"""handles links with secondary tables"""

from fastapi import Depends, FastAPI, HTTPException, status, APIRouter
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm
from pydantic import BaseModel
from pydantic_models.models import SessionBase, ThemeBase
from sqlalchemy import create_engine, select, exists, or_, and_
from sqlalchemy.orm import sessionmaker, joinedload
from typing import Literal
import settings
from orm_sqlalchemy.models import LienSessionResponsable, CategorieSoumission, Utilisateur, Conference, Responsable, Organisateur, Session, Theme, LienSessionTheme, LienConferenceResponsable, LienUtilisateurTheme
from passlib.context import CryptContext
from sqlalchemy.exc import NoResultFound
from datetime import datetime
from orm_sqlalchemy.does_exist import *


def link_theme_and_session(id_theme: int, id_session: int):
    if not does_theme_exist(id_theme):
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"Theme id={id_theme} does not exist, can not link to session.",
        )
    if not does_session_exist(id_session):
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"Session id={id_session} does not exist, can not link to theme.",
        )

    if session.query(exists().where(and_(LienSessionTheme.id_theme == id_theme, LienSessionTheme.id_session == id_session))).scalar():
        print('WARNING : adding link that already exists')
        return

    session.add(LienSessionTheme(id_theme=id_theme, id_session=id_session))
    session.commit()


def link_utilisateur_and_theme(id_utilisateur: int, id_theme: int):
    if not does_user_exist(id_utilisateur):
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"User id={id_utilisateur} does not exist, can not link to theme.",
        )
    if not does_theme_exist(id_theme):
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"Theme id={id_theme} does not exist, can not link to user.",
        )

    if session.query(exists().where(and_(LienUtilisateurTheme.id_utilisateur == id_utilisateur, LienUtilisateurTheme.id_theme == id_theme))).scalar():
        print('WARNING : adding link that already exists')
        return

    session.add(LienUtilisateurTheme(
        id_utilisateur=id_utilisateur, id_theme=id_theme))
    session.commit()


def link_responsable_and_conference(id_responsable: int, id_conference: int):
    if not does_responsable_exist(id_responsable):
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"Responsable id={id_responsable} does not exist, can not link to conf.",
        )
    if not does_conference_exist(id_conference):
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"Conference id={id_conference} does not exist, can not link to responsable.",
        )

    if session.query(exists().where(and_(LienConferenceResponsable.id_responsable == id_responsable, LienConferenceResponsable.id_conference == id_conference))).scalar():
        print('WARNING : adding link that already exists')
        return

    session.add(LienConferenceResponsable(
        id_responsable=id_responsable, id_conference=id_conference))
    session.commit()


def link_session_and_responsable(id_session: int, id_responsable: int):
    if not does_session_exist(id_session):
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"Session id={id_session} does not exist, can not link to responsible.",
        )
    if not does_responsable_exist(id_responsable):
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"Responsable id={id_responsable} does not exist, can not link to session.",
        )

    if session.query(exists().where(and_(LienSessionResponsable.id_session == id_session, LienSessionResponsable.id_responsable == id_responsable))).scalar():
        print('WARNING : adding link that already exists')
        return

    session.add(LienSessionResponsable(
        id_session=id_session, id_responsable=id_responsable))
    session.commit()


def link_session_and_theme(*args, **kwargs):
    link_theme_and_session(*args, **kwargs)


def link_user_and_theme(*args, **kwargs):
    link_utilisateur_and_theme(*args, **kwargs)


def link_conference_and_responsable(*args, **kwargs):
    link_responsable_and_conference(*args, **kwargs)


def link_responsable_and_session(*args, **kwargs):
    link_session_and_responsable(*args, **kwargs)


def delete_session_theme(id_session: int, id_theme: int):
    try:
        link = session.query(LienSessionTheme).filter_by(
            id_session=id_session, id_theme=id_theme).one()
        session.delete(link)
        session.commit()
    except NoResultFound:
        print("WARNING: Trying to delete link that does not exist.")
        pass  # Do nothing if the link does not exist


def delete_user_theme(id_utilisateur: int, id_theme: int):
    try:
        link = session.query(LienUtilisateurTheme).filter_by(
            id_utilisateur=id_utilisateur, id_theme=id_theme).one()
        session.delete(link)
        session.commit()
    except NoResultFound:
        print("WARNING: Trying to delete link that does not exist.")
        pass


def delete_conference_responsable(id_conference: int, id_responsable: int):
    try:
        link = session.query(LienConferenceResponsable).filter_by(
            id_conference=id_conference, id_responsable=id_responsable).one()
        session.delete(link)
        session.commit()
    except NoResultFound:
        print("WARNING: Trying to delete link that does not exist.")
        pass


def delete_responsable_session(id_responsable: int, id_session: int):
    try:
        link = session.query(LienSessionResponsable).filter_by(
            id_responsable=id_responsable, id_session=id_session).one()
        session.delete(link)
        session.commit()
    except NoResultFound:
        print("WARNING: Trying to delete link that does not exist.")
        pass
