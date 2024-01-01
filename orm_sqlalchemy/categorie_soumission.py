from fastapi import HTTPException, status
from pydantic_models.models import CategorieSoumissionBase, CategorieSoumissionUpdate
from sqlalchemy import create_engine, select, exists, or_, and_, insert
from sqlalchemy.orm import sessionmaker, joinedload
from typing import Literal
import settings
from orm_sqlalchemy.models import CategorieSoumission
from sqlalchemy.exc import NoResultFound
from orm_sqlalchemy.does_exist import *
from orm_sqlalchemy.secondary_links import *

engine = create_engine(settings.POSTGRES_URI)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
session = SessionLocal()


def get_categories_soumission() -> list[CategorieSoumission]:
    query = session.query(CategorieSoumission)
    return query.all()


def create_categorie_soumission(categorie_soumission: CategorieSoumissionBase) -> int:
    with engine.connect() as connection:
        transaction = connection.begin()
        result = connection.execute(
            insert(CategorieSoumission).values(**categorie_soumission.model_dump()))
        if result.inserted_primary_key is not None:
            transaction.commit()
            return result.inserted_primary_key[0]
        else:
            transaction.rollback()
            raise RuntimeError("Failed to retrieve the inserted primary key.")


def update_categorie_soumission(categorie_soumission: CategorieSoumissionUpdate) -> None:
    # PUT
    try:
        existing_categorie_soumission = session.query(Theme).filter_by(
            id_theme=categorie_soumission.id_categorie_soumission).one()
    except NoResultFound:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"Categorie soumission with id={categorie_soumission.id_categorie_soumission} does not exist during the update for cat_soum={categorie_soumission.model_dump()}.",
        )

    for key, value in categorie_soumission.model_dump(exclude_unset=True).items():
        if key == 'id_categorie_soumission':
            continue
        setattr(existing_categorie_soumission, key, value)

    session.commit()
