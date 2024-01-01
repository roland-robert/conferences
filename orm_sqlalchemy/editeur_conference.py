from fastapi import Depends, FastAPI, HTTPException, status, APIRouter
from pydantic_models.models import EditeurConferenceUpdate, ThemeBase, ThemeUpdate, EditeurConferenceBase
from sqlalchemy import create_engine, select, exists, or_, and_, insert
from sqlalchemy.orm import sessionmaker, joinedload
from typing import Literal
import settings
from orm_sqlalchemy.models import EditeurConference
from sqlalchemy.exc import NoResultFound
from orm_sqlalchemy.does_exist import *
from orm_sqlalchemy.secondary_links import *

engine = create_engine(settings.POSTGRES_URI)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
session = SessionLocal()


def get_editeurs_conference() -> list[EditeurConference]:
    query = session.query(EditeurConference)
    return query.all()


def create_editeur_conference(editeur: EditeurConferenceBase) -> int:
    with engine.connect() as connection:
        transaction = connection.begin()
        result = connection.execute(
            insert(EditeurConference).values(**editeur.model_dump()))
        if result.inserted_primary_key is not None:
            transaction.commit()
            return result.inserted_primary_key[0]
        else:
            transaction.rollback()
            raise RuntimeError("Failed to retrieve the inserted primary key.")


def update_edditeur_conference(editeur: EditeurConferenceUpdate) -> None:
    # PUT
    try:
        existing_editeur_conference = session.query(Theme).filter_by(
            id_theme=editeur.id_editeur_conference).one()
    except NoResultFound:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"Theme id={editeur.id_editeur_conference} does not exist during the update for theme={editeur.model_dump()}.",
        )

    for key, value in editeur.model_dump(exclude_unset=True).items():
        if key == 'id_editeur_conference':
            continue
        setattr(existing_editeur_conference, key, value)

    session.commit()
