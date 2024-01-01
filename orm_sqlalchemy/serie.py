from fastapi import Depends, FastAPI, HTTPException, status, APIRouter
from pydantic_models.models import SerieBase, SerieUpdate, ThemeBase, ThemeUpdate
from sqlalchemy import create_engine, select, exists, or_, and_, insert
from sqlalchemy.orm import sessionmaker, joinedload
from typing import Literal
import settings
from orm_sqlalchemy.models import Serie
from sqlalchemy.exc import NoResultFound
from orm_sqlalchemy.does_exist import *
from orm_sqlalchemy.secondary_links import *

engine = create_engine(settings.POSTGRES_URI)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
session = SessionLocal()


def get_series() -> list[Serie]:
    query = session.query(Serie).options()
    return query.all()


def create_serie(serie: SerieBase) -> int:
    with engine.connect() as connection:
        transaction = connection.begin()
        result = connection.execute(insert(Serie).values(**serie.model_dump()))
        if result.inserted_primary_key is not None:
            transaction.commit()
            return result.inserted_primary_key[0]
        else:
            transaction.rollback()
            raise RuntimeError("Failed to retrieve the inserted primary key.")


def update_serie(serie: SerieUpdate) -> None:
    """PUT"""
    try:
        existing_theme = session.query(Theme).filter_by(
            id_theme=serie.id_serie).one()
    except NoResultFound:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"Theme id={serie.id_serie} does not exist during the update for theme={serie.model_dump()}.",
        )

    for key, value in serie.model_dump(exclude_unset=True).items():
        if key == 'id_serie':
            continue
        setattr(existing_theme, key, value)

    session.commit()
