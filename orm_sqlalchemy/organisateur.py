from fastapi import Depends, FastAPI, HTTPException, status, APIRouter
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm
from pydantic import BaseModel
from pydantic_models.models import ConferenceBase, ConferenceCreate, OrganisateurBase, OrganisateurUpdate, SessionBase, ThemeBase
from sqlalchemy import create_engine, select, exists, or_, and_, insert
from sqlalchemy.orm import sessionmaker, joinedload
from typing import Literal
import settings
from orm_sqlalchemy.models import CategorieSoumission, Utilisateur, Conference, Responsable, Organisateur, Session, Theme, LienSessionTheme, LienConferenceResponsable, LienUtilisateurTheme
from passlib.context import CryptContext
from sqlalchemy.exc import NoResultFound
from datetime import datetime
from orm_sqlalchemy.does_exist import *
from orm_sqlalchemy.session import create_session_and_link

engine = create_engine(settings.POSTGRES_URI)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
session = SessionLocal()


def get_organisateurs() -> list[Organisateur]:
    query = session.query(Organisateur)
    return query.all()


def create_organisateur(organisateur: OrganisateurBase) -> int:
    with engine.connect() as connection:
        transaction = connection.begin()
        result = connection.execute(
            insert(Organisateur).values(**organisateur.model_dump()))
        if result.inserted_primary_key is not None:
            transaction.commit()
            return result.inserted_primary_key[0]
        else:
            transaction.rollback()
            raise RuntimeError("Failed to retrieve the inserted primary key.")


def update_organisateur(organisateur_update: OrganisateurUpdate) -> None:
    """PUT"""
    try:
        existing_organisateur = session.query(Organisateur).filter_by(
            id_organisateur=organisateur_update.id_organisteur).one()
    except NoResultFound:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"Organisateur id={organisateur_update.id_organisteur} does not exist during the update for organisateur={organisateur_update.dict()}.",
        )

    for key, value in organisateur_update.model_dump(exclude_unset=True).items():
        if key == 'id_organisateur':
            continue
        setattr(existing_organisateur, key, value)

    session.commit()
