from fastapi import Depends, FastAPI, HTTPException, status, APIRouter
from pydantic_models.models import ThemeBase, ThemeUpdate
from sqlalchemy import create_engine, select, exists, or_, and_, insert
from sqlalchemy.orm import sessionmaker, joinedload
from typing import Literal
import settings
from orm_sqlalchemy.models import Theme
from sqlalchemy.exc import NoResultFound
from orm_sqlalchemy.does_exist import *
from orm_sqlalchemy.secondary_links import *

engine = create_engine(settings.POSTGRES_URI)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
session = SessionLocal()


def get_themes() -> list[Theme]:
    query = session.query(Theme).options(
        joinedload(Theme.sessions),
        joinedload(Theme.utilisateurs),

    )
    return query.all()


def get_theme(id_theme: int) -> Theme | None:
    try:
        conference: Theme = session.query(
            Theme).options(
            joinedload(Theme.sessions),
            joinedload(Theme.utilisateurs),
        ).filter(Theme.id_theme == id_theme).one()
    except NoResultFound:
        return None

    return conference


def create_theme(theme: ThemeBase) -> int:
    with engine.connect() as connection:
        transaction = connection.begin()
        result = connection.execute(insert(Theme).values(**theme.model_dump()))
        if result.inserted_primary_key is not None:
            transaction.commit()
            return result.inserted_primary_key[0]
        else:
            transaction.rollback()
            raise RuntimeError("Failed to retrieve the inserted primary key.")


def create_theme_and_link(theme: ThemeBase, session_ids=[], utilisateur_ids=[]) -> int:
    """return create theme id"""
    id_theme = create_theme(theme)
    for id_session in session_ids:
        link_theme_and_session(id_theme=id_theme, id_session=id_session)
    for id_utilisateur in utilisateur_ids:
        link_utilisateur_and_theme(
            id_theme=id_theme, id_utilisateur=id_utilisateur)
    return id_theme


def update_theme(theme_update: ThemeUpdate):
    try:
        existing_theme = session.query(Theme).filter_by(
            id_theme=theme_update.id_theme).one()
    except NoResultFound:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"Theme id={theme_update.id_theme} does not exist during the update for theme={theme_update.model_dump()}.",
        )

    for key, value in theme_update.model_dump(exclude_unset=True).items():
        if key == 'id_theme':
            continue
        setattr(existing_theme, key, value)

    session.commit()
