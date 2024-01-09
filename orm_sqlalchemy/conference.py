from fastapi import Depends, FastAPI, HTTPException, status, APIRouter
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm
from pydantic import BaseModel
from orm_sqlalchemy.categorie_soumission import create_categorie_soumission, update_categorie_soumission
from orm_sqlalchemy.editeur_conference import create_editeur_conference
from orm_sqlalchemy.organisateur import create_organisateur
from orm_sqlalchemy.serie import create_serie
from orm_sqlalchemy.theme import create_theme_and_link
from pydantic_models.models import CategorieSoumissionBase, CategorieSoumissionUpdate, ConferenceBase, ConferenceCreate, ConferenceCreateOrUpdate, ConferenceUpdate, EditeurConferenceBase, OrganisateurBase, SerieBase, SessionBase, SessionUpdate, ThemeBase, Session
from sqlalchemy import create_engine, select, exists, or_, and_, insert
from sqlalchemy.orm import sessionmaker, joinedload
from typing import Literal
import settings
from orm_sqlalchemy.models import CategorieSoumission, Utilisateur, Conference, Responsable, Organisateur, Theme, LienSessionTheme, LienConferenceResponsable, LienUtilisateurTheme
from passlib.context import CryptContext
from sqlalchemy.exc import NoResultFound
from datetime import datetime
from orm_sqlalchemy.does_exist import *
from orm_sqlalchemy.session import create_or_update_session_full, create_session_and_link, update_session

engine = create_engine(settings.POSTGRES_URI)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
session = SessionLocal()


def get_conference(id_conference: int) -> Conference | None:
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
    id_theme_list: list[int] = [],
    id_serie: int | None = None,
    id_editeur: int | None = None,
    responsable: str | None = None,  # nom ou prenom regex sur nom ou prenom contient
    min_date: str | None = None,  # 2023-12-09T00:00:00 UTC format
    max_date: str | None = None,  # 2023-12-09T00:00:00 UTC format
    # None ignore, true only workshops, false only not workshops
    is_workshop: bool | None = None,
    id_utilisateur: int | None = None,
    id_conference_du_workshop: int | None = None,
) -> list[Conference]:
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
        filters.append(Conference.responsables.any(
            Responsable.utilisateur.has(
                or_(Utilisateur.nom.ilike(
                    f'%{responsable}%'),
                    Utilisateur.prenom.ilike(f'%{responsable}%')
                    )
            )
        )
        )

    if min_date is not None:
        filters.append(Conference.date_debut >=
                       datetime.fromisoformat(min_date))

    if max_date is not None:
        filters.append(Conference.date_fin <= datetime.fromisoformat(max_date))

    if is_workshop is not None:
        if is_workshop:
            filters.append(Conference.id_conference_du_workshop.isnot(None))
        else:
            filters.append(Conference.id_conference_du_workshop.is_(None))

    if id_utilisateur is not None:
        filters.append(Conference.id_utilisateur == id_utilisateur)

    if id_conference_du_workshop:
        filters.append(Conference.id_conference_du_workshop ==
                       id_conference_du_workshop)

    query = query.filter(and_(*filters))

    if order_by == 'date_debut':
        query = query.order_by(Conference.date_debut.desc(
        ) if order == 'desc' else Conference.date_debut.asc())
    elif order_by == 'date_fin':
        query = query.order_by(Conference.date_fin.desc(
        ) if order == 'desc' else Conference.date_fin.asc())

    conferences: list[Conference] = query.all()
    return conferences


def post_conference(conference: ConferenceBase) -> int:
    with engine.connect() as connection:
        transaction = connection.begin()
        result = connection.execute(
            insert(Conference).values(**conference.model_dump()))
        if result.inserted_primary_key is not None:
            transaction.commit()
            return result.inserted_primary_key[0]
        else:
            transaction.rollback()
            raise RuntimeError("Failed to retrieve the inserted primary key.")


def update_conference(conference: ConferenceUpdate):
    try:
        existing_conference = session.query(Conference).filter_by(
            id_conference=conference.id_conference).one()
    except NoResultFound:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"Theme id={conference.id_conference} does not exist during the update for theme={conference.model_dump()}.",
        )

    for key, value in conference.model_dump(exclude_unset=True).items():
        if key == 'id_conference':
            continue
        setattr(existing_conference, key, value)

    session.commit()


def _get_id_serie(conference: ConferenceCreate) -> int | None:
    """get serie id directly OR create session then give session id"""
    if conference.id_serie:
        return conference.id_serie
    if conference.serie:
        if conference.serie.id_serie:
            return conference.serie.id_serie
        return create_serie(SerieBase(nom=conference.serie.nom))
    return None


def _get_id_ville(conference: ConferenceCreate) -> int | None:
    if conference.id_ville:
        return conference.id_ville
    if conference.ville and conference.ville.id_ville:
        return conference.ville.id_ville
    return None


def _get_id_organisateur(conference: ConferenceCreate) -> int | None:
    """get orga id directly OR create organisateur then give orga_id"""
    if conference.id_organisateur:
        return conference.id_organisateur
    if conference.organisateur:
        if conference.organisateur.id_organisateur:
            return conference.organisateur.id_organisateur
        return create_organisateur(OrganisateurBase(nom=conference.organisateur.nom, adresse=conference.organisateur.adresse, email=conference.organisateur.email))
    return None


def _get_id_editeur_conference(conference: ConferenceCreate) -> int | None:
    """get id directly OR create then give id"""
    if conference.id_editeur:
        return conference.id_editeur
    if conference.editeur_conference:
        if conference.editeur_conference.id_editeur_conference:
            return conference.editeur_conference.id_editeur_conference
        return create_editeur_conference(EditeurConferenceBase(nom=conference.editeur_conference.nom))
    return None


def _get_id_utilisateur(conference: ConferenceCreate) -> int | None:
    if conference.id_utilisateur:
        return conference.id_utilisateur
    if conference.utilisateur and conference.utilisateur.id_utilisateur:
        return conference.utilisateur.id_utilisateur


def post_or_update_conference_pro(conference: ConferenceCreateOrUpdate) -> int:
    """
    liens directes :editeur_conference organisateur serie ville utilisateur (ville et utilisateur pas d'update/create)
    lien backprop : sessions, categorie_soumission (creation/update recursif)
    """
    conference_base = ConferenceBase(id_editeur=_get_id_editeur_conference(conference), id_organisateur=_get_id_organisateur(
        conference), id_serie=_get_id_serie(conference), id_ville=_get_id_ville(conference), id_utilisateur=_get_id_utilisateur(conference),
        id_conference_du_workshop=conference.id_conference_du_workshop, intitule=conference.intitule, date_debut=conference.date_debut, date_fin=conference.date_fin, image_url=conference.image_url, texte_introductif=conference.texte_introductif
    )

    if conference.id_conference:
        conference_id = conference.id_conference
        update_conference(ConferenceUpdate(
            **conference_base.model_dump(), id_conference=conference_id))
    else:
        conference_id = post_conference(conference_base)
    # backprop
    for session in conference.sessions:
        session.id_conference = conference_id
        create_or_update_session_full(session)

    for categorie_soumission in conference.categories_soumission:
        categorie_soumission.id_conference = conference_id
        data = categorie_soumission.model_dump()
        if categorie_soumission.id_categorie_soumission:
            update_categorie_soumission(CategorieSoumissionUpdate(
                **data))
        else:
            data.pop("id_categorie_soumission", None)
            create_categorie_soumission(CategorieSoumissionBase(**data))
    return conference_id


def get_workshop():
    pass
