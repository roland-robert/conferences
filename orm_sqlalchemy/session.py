from fastapi import Depends, FastAPI, HTTPException, status, APIRouter
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm
from pydantic import BaseModel
from orm_sqlalchemy.responsable import create_or_update_responsable_full
from orm_sqlalchemy.theme import create_theme, update_theme
from pydantic_models.models import SessionBase, Session as SessionFullCreate, SessionUpdate, ThemeBase, ThemeUpdate
from sqlalchemy import create_engine, select, exists, or_, and_, insert
from sqlalchemy.orm import sessionmaker, joinedload
from typing import Literal
import settings
from orm_sqlalchemy.models import LienSessionResponsable, CategorieSoumission, Utilisateur, Conference, Responsable, Organisateur, Session, Theme, LienSessionTheme, LienConferenceResponsable, LienUtilisateurTheme
from passlib.context import CryptContext
from sqlalchemy.exc import NoResultFound
from datetime import datetime
from orm_sqlalchemy.does_exist import *
from orm_sqlalchemy.secondary_links import *

engine = create_engine(settings.POSTGRES_URI)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
session = SessionLocal()


def get_sessions() -> list[Session]:
    query = session.query(Session).options(
        joinedload(Session.conference),
        joinedload(Session.themes),
        joinedload(Session.responsables),
    )
    return query.all()


def create_session(session_: SessionBase) -> int:
    if not does_conference_exist(session_.id_conference):
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"Conference id={session_.id_conference} n'existe pas lors de la création session={session_.model_dump()}.",
        )
    with engine.connect() as connection:
        transaction = connection.begin()
        result = connection.execute(
            insert(Session).values(**session_.model_dump()))
        if result.inserted_primary_key is not None:
            transaction.commit()
            return result.inserted_primary_key[0]
        else:
            transaction.rollback()
            raise RuntimeError(
                "Failed to retrieve the inserted primary key for session.")


def update_session(session_: SessionUpdate):
    try:
        existing_session = session.query(Session).filter_by(
            id_session=session_.id_session).one()
    except NoResultFound:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"Session id={session_.id_session} n'existe pas lors de son update session={session_.model_dump()}.",
        )
    for key, value in session_.model_dump(exclude_unset=True).items():
        if key == 'id_session':
            continue
        setattr(existing_session, key, value)
    session.commit()


def create_session_and_link(session_: SessionBase, theme_ids=[], responsable_ids=[]) -> int:
    """return create theme id"""
    id_session = create_session(session_)

    for id_theme in theme_ids:
        link_theme_and_session(id_session=id_session, id_theme=id_theme)

    for id_responsable in responsable_ids:
        link_session_and_responsable(id_session, id_responsable)

    return id_session


def create_or_update_session_full(session_: SessionFullCreate) -> int:
    """Creates/updates themes and responsables aswell, make sure to specify id_conference before."""
    theme_ids, responsable_ids = [], []
    for theme in session_.themes:
        if theme.id_theme:
            theme_ids.append(theme.id_theme)
            update_theme(theme_update=ThemeUpdate(
                nom=theme.nom, id_theme=theme.id_theme))
            continue
        theme_ids.append(create_theme(theme=ThemeBase(nom=theme.nom)))

    for responsable in session_.responsables:
        responsable_ids.append(create_or_update_responsable_full(responsable))

    data = {
        "intitule": session_.intitule,
        "id_conference": session_.id_conference,
    }

    if not session_.id_session:
        return create_session_and_link(SessionBase(**data), theme_ids=theme_ids, responsable_ids=responsable_ids)

    update_session(SessionUpdate(**data, id_session=session_.id_session))
    id_session = session_.id_session
    for id_theme in theme_ids:
        link_theme_and_session(id_session=id_session, id_theme=id_theme)

    for id_responsable in responsable_ids:
        link_session_and_responsable(id_session, id_responsable)
    return id_session
