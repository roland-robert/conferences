from fastapi import Depends, FastAPI, HTTPException, status, APIRouter
from pydantic_models.models import SerieBase, SerieUpdate
from sqlalchemy import create_engine, insert
from sqlalchemy.orm import sessionmaker
from sqlalchemy.exc import NoResultFound
from orm_sqlalchemy.models import Serie
from orm_sqlalchemy.serie import get_series, create_serie, update_serie

engine = create_engine("sqlite:///:memory:")
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
session = SessionLocal()


def test_get_series():
    result = get_series()
    print(result)


def test_create_serie():
    # Test data for the function
    serie_base = SerieBase(nom="New Serie")

    result = create_serie(serie=serie_base)
    print(result)


def test_update_serie():
    # Test data for the function
    serie_update = SerieUpdate(id_serie=1, nom="Updated Serie")

    update_serie(serie=serie_update)


if __name__ == "__main__":
    test_get_series()
    test_create_serie()
    test_update_serie()
