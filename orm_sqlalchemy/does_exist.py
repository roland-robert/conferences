"""handles all does exist functions"""

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
import settings
from orm_sqlalchemy.models import TypeResponsabilite, Utilisateur, Conference, Responsable, Session, Theme
from sqlalchemy.exc import NoResultFound

engine = create_engine(settings.POSTGRES_URI)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
session = SessionLocal()


def does_conference_exist(id_conference: int | None):
    if id_conference is None:
        return False

    try:
        session.query(Conference).filter_by(id_conference=id_conference).one()
        return True
    except NoResultFound:
        return False


def does_user_exist(id_utilisateur: int | None):
    if id_utilisateur is None:
        return False

    try:
        session.query(Utilisateur).filter_by(
            id_utilisateur=id_utilisateur).one()
        return True
    except NoResultFound:
        return False


def does_responsable_exist(id_responsable: int | None):
    if id_responsable is None:
        return False

    try:
        session.query(Responsable).filter_by(
            id_responsable=id_responsable).one()
        return True
    except NoResultFound:
        return False


def does_theme_exist(id_theme: int | None):
    if id_theme is None:
        return False

    try:
        session.query(Theme).filter_by(id_theme=id_theme).one()
        return True
    except NoResultFound:
        return False


def does_session_exist(id_session: int | None):
    if id_session is None:
        return False

    try:
        session.query(Session).filter_by(id_session=id_session).one()
        return True
    except NoResultFound:
        return False


def does_type_responsabilite_exist(id_type_responsabilite: int | None):
    if id_type_responsabilite is None:
        return False

    try:
        session.query(TypeResponsabilite).filter_by(
            id_type_responsabilite=id_type_responsabilite).one()
        return True
    except NoResultFound:
        return False
