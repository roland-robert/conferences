from fastapi import HTTPException, status
from sqlalchemy import create_engine, insert
from sqlalchemy.orm import sessionmaker
from sqlalchemy.exc import NoResultFound
from pydantic_models.models import SessionBase, Session as SessionFullCreate, SessionUpdate, Theme, Responsable
from orm_sqlalchemy.secondary_links import link_theme_and_session, link_session_and_responsable
from orm_sqlalchemy.session import (
    get_sessions,
    create_session,
    update_session,
    create_session_and_link,
    create_or_update_session_full,
)


def test_get_sessions():
    result = get_sessions()
    print(result)


def test_create_session():
    # Test data for the function
    session_base = SessionBase(intitule="New Session", id_conference=1)

    result = create_session(session_=session_base)
    print(result)


def test_update_session():
    # Test data for the function
    session_update = SessionUpdate(
        id_conference=None, id_session=1, intitule="Updated Session2")
    update_session(session_=session_update)

    session_update = SessionUpdate(
        id_conference=1, id_session=1, intitule="Updated Session")

    update_session(session_=session_update)


def test_create_session_and_link():
    # Test data for the function
    session_base = SessionBase(intitule="Linked Session", id_conference=1)
    theme_ids = [1, 2]
    responsable_ids = [1, 2]

    result = create_session_and_link(
        session_=session_base, theme_ids=theme_ids, responsable_ids=responsable_ids)
    print(result)


def test_create_or_update_session_full():
    # Test data for the function
    session_full_create = SessionFullCreate(
        id_session=None,
        intitule="Full Session",
        id_conference=1,
        themes=[Theme(**{"id_theme": 1, "nom": "Theme 1"}),
                Theme(**{"id_theme": None, "nom": "New Theme"})],
        responsables=[Responsable(**{"id_responsable": 1, "adresse_pro": "addpResponsable 1"}, type_responsabilite=None, utilisateur=None, id_utilisateur=1, id_type_responsabilite=1),
                      Responsable(**{"id_responsable": None, "adresse_pro": "addpNRespsable"},
                                  type_responsabilite=None, utilisateur=None, id_utilisateur=1, id_type_responsabilite=1)
                      ],
    )
    result = create_or_update_session_full(session_=session_full_create)
    print(result)


if __name__ == "__main__":
    test_get_sessions()
    test_create_session()
    test_update_session()
    test_create_session_and_link()
    test_create_or_update_session_full()
