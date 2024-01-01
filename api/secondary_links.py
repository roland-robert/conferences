from fastapi import FastAPI, HTTPException, APIRouter
from orm_sqlalchemy.secondary_links import *

router = APIRouter(tags=["Liens Secondaires (relation N:N)"])


@router.post("/link_session_theme/", response_model=None)
def link_session_theme(id_session: int, id_theme: int):
    link_theme_and_session(id_theme, id_session)


@router.post("/link_user_theme/", response_model=int)
def link_user_theme(id_utilisateur: int, id_theme: int):
    link_utilisateur_and_theme(id_utilisateur, id_theme)


@router.post("/link_conference_responsable/", response_model=int)
def link_conference_responsable(id_conference: int, id_responsable: int):
    link_responsable_and_conference(id_responsable, id_conference)


@router.post("/link_responsable_session/", response_model=int)
def link_responsable_session(id_responsable: int, id_session: int):
    link_session_and_responsable(id_session, id_responsable)


@router.post("/delete_session_theme/", response_model=int)
def delete_session_theme(id_session: int, id_theme: int):
    delete_session_theme(id_session, id_theme)


@router.post("/delete_user_theme/", response_model=int)
def delete_user_theme(id_utilisateur: int, id_theme: int):
    delete_user_theme(id_utilisateur, id_theme)


@router.post("/delete_conference_responsable/", response_model=int)
def delete_conference_responsable(id_conference: int, id_responsable: int):
    delete_conference_responsable(id_conference, id_responsable)


@router.post("/delete_responsable_session/", response_model=int)
def delete_responsable_session(id_responsable: int, id_session: int):
    delete_responsable_session(id_responsable, id_session)