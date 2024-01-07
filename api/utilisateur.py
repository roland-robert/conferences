

from fastapi import APIRouter
from orm_sqlalchemy.utilisateur import create_utilisateur, get_utilisateurs, update_utilisateur, update_utilisateur_and_link_to_themes
from pydantic_models.models import ThemeOptional, UtilisateurCreate, UtilisateurRead, UtilisateurUpdate


router = APIRouter(tags=["Utilisateur"])


@router.get("/utilisateurs/", response_model=list[UtilisateurRead])
def get_utilisateurs_endpoint():
    return get_utilisateurs()


@router.post("/utilisateur/", response_model=int)
def create_utilisateur_endpoint(utilisateur: UtilisateurCreate):
    return create_utilisateur(utilisateur)


@router.put("/utilisateur/", response_model=None)
def update_utilisateur_endpoint(utilisateur: UtilisateurUpdate):
    return update_utilisateur(utilisateur)


@router.put("/utilisateur_and_themes/", response_model=None, description="Si un theme est sans id, il sera créé puis lié")
def update_utilisateur_with_themes(utilisateur: UtilisateurUpdate, themes: list[ThemeOptional]):
    return update_utilisateur_and_link_to_themes(utilisateur, themes)


@router.post("/utilisateur_and_themes/", response_model=int, description="Si un theme est sans id, il sera créé puis lié")
def create_utilisateur_with_themes(utilisateur: UtilisateurCreate, themes: list[ThemeOptional]):
    return create_utilisateur_with_themes(utilisateur=utilisateur, themes=themes)
