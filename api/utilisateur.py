

from fastapi import APIRouter
from orm_sqlalchemy.utilisateur import create_utilisateur, get_utilisateurs, update_utilisateur
from pydantic_models.models import UtilisateurCreate, UtilisateurRead, UtilisateurUpdate


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
