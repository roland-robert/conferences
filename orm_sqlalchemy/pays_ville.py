from fastapi import Depends, FastAPI, HTTPException, status, APIRouter
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm
from pydantic import BaseModel
from pydantic_models.models import ConferenceBase, ConferenceCreate, PaysBase, SessionBase, ThemeBase, VilleAndPays, VilleBase
from pydantic_models.models import Ville as PydanticVille
from sqlalchemy import create_engine, select, exists, or_, and_, insert
from sqlalchemy.orm import sessionmaker, joinedload
from typing import Literal
import settings
from orm_sqlalchemy.models import CategorieSoumission, Pays, Utilisateur, Conference, Responsable, Organisateur, Session, Theme, LienSessionTheme, LienConferenceResponsable, LienUtilisateurTheme, Ville
from orm_sqlalchemy.does_exist import *


engine = create_engine(settings.POSTGRES_URI)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
session = SessionLocal()


def get_villes() -> list[Ville]:
    query = session.query(Ville).options(
        joinedload(Ville.pays),
    )
    return query.all()


def get_pays() -> list[Pays]:
    query = session.query(Pays)
    return query.all()


def create_pays(pays: PaysBase) -> int:
    with engine.connect() as connection:
        transaction = connection.begin()
        result = connection.execute(insert(Pays).values(**pays.model_dump()))
        if result.inserted_primary_key is not None:
            transaction.commit()
            return result.inserted_primary_key[0]
        else:
            transaction.rollback()
            raise RuntimeError(
                "Failed to retrieve the inserted primary key for Pays.")


def create_ville(ville: VilleBase) -> int:
    with engine.connect() as connection:
        transaction = connection.begin()
        result = connection.execute(insert(Ville).values(**ville.model_dump()))
        if result.inserted_primary_key is not None:
            transaction.commit()
            return result.inserted_primary_key[0]
        else:
            transaction.rollback()
            raise RuntimeError(
                "Failed to retrieve the inserted primary key for Ville.")


def create_ville_and_pays(ville_pays: VilleAndPays) -> tuple[int, int]:
    id_pays = create_pays(PaysBase(nom=ville_pays.pays.nom))
    id_ville = create_ville(
        VilleBase(nom_ville=ville_pays.nom_ville, id_pays=id_pays))
    return id_pays, id_ville
