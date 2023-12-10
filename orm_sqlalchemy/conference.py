from fastapi import Depends, FastAPI, HTTPException, status, APIRouter
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm
from pydantic import BaseModel
from sqlalchemy import create_engine, select, exists, or_, and_
from sqlalchemy.orm import sessionmaker, joinedload
from typing import Literal
import settings
from orm_sqlalchemy.models import Utilisateur, Conference, Responsable, Organisateur, Session, Theme
from passlib.context import CryptContext
from sqlalchemy.exc import NoResultFound
from datetime import datetime

engine = create_engine(settings.POSTGRES_URI)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)


def get_conference(id_conference: int) -> Conference | None:
    session = SessionLocal()
    try:
        conference: Conference = session.query(
            Conference).options(
                joinedload(Conference.serie),
                joinedload(Conference.ville),
                joinedload(Conference.organisateur),
                joinedload(Conference.editeur_conference),
                joinedload(Conference.utilisateur),
                joinedload(Conference.categories_soumission),
                joinedload(Conference.sessions),
                # joinedload(Conference.responsables)
        ).filter(Conference.id_conference == id_conference).one()
    except NoResultFound:
        return None

    return conference


def get_conferences(
    order_by: Literal['date_debut', 'date_fin'] = 'date_debut',
    order: Literal['asc', 'desc'] = 'asc',
    id_pays: int | None = None,
    id_theme_list: list[int] | None = None,
    id_serie: int | None = None,
    id_editeur: int | None = None,
    responsable: str | None = None,  # nom ou prenom regex sur nom ou prenom contient
    min_date: str | None = None,  # 2023-12-09T00:00:00 UTC format
    max_date: str | None = None,  # 2023-12-09T00:00:00 UTC format
    # None ignore, true only workshops, false only not workshops
    is_workshop: bool | None = None,
) -> list[Conference]:
    session = SessionLocal()
    query = session.query(Conference).options(
        joinedload(Conference.serie),
        joinedload(Conference.ville),
        joinedload(Conference.organisateur),
        joinedload(Conference.editeur_conference),
        joinedload(Conference.utilisateur),
        joinedload(Conference.categories_soumission),
        joinedload(Conference.sessions),
        # joinedload(Conference.responsables)
    )

    filters = []

    if id_pays is not None:
        filters.append(Conference.ville.has(id_pays=id_pays))

    if id_theme_list:
        filters.append(Conference.sessions.any(
            Session.themes.any(Theme.id_theme.in_(id_theme_list))))

    if id_serie is not None:
        filters.append(Conference.id_serie == id_serie)

    if id_editeur is not None:
        filters.append(Conference.id_editeur == id_editeur)

    if responsable is not None:
        filters.append(or_(Responsable.nom.ilike(
            f'%{responsable}%'), Responsable.prenom.ilike(f'%{responsable}%')))

    if min_date is not None:
        filters.append(Conference.date_debut >=
                       datetime.fromisoformat(min_date))

    if max_date is not None:
        filters.append(Conference.date_fin <= datetime.fromisoformat(max_date))

    if is_workshop is not None:
        if is_workshop:
            filters.append(Conference.is_workshop == True)
        else:
            filters.append(Conference.is_workshop == False)

    query = query.filter(and_(*filters))

    if order_by == 'date_debut':
        query = query.order_by(Conference.date_debut.desc(
        ) if order == 'desc' else Conference.date_debut.asc())
    elif order_by == 'date_fin':
        query = query.order_by(Conference.date_fin.desc(
        ) if order == 'desc' else Conference.date_fin.asc())

    conferences: list[Conference] = query.all()
    return conferences
