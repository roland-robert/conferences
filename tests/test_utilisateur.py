from fastapi import HTTPException, status
from sqlalchemy import create_engine, insert
from sqlalchemy.orm import sessionmaker
from sqlalchemy.exc import NoResultFound
from pydantic_models.models import UtilisateurCreate, UtilisateurUpdate, UtilisateurRead
from orm_sqlalchemy.models import Utilisateur
from api.user import get_password_hash
from orm_sqlalchemy.utilisateur import get_utilisateurs, create_utilisateur, update_utilisateur
import random as rd


def test_get_utilisateurs():
    result = get_utilisateurs()
    print(result)


def test_create_utilisateur():
    # Test data for the function
    utilisateur_create = UtilisateurCreate(
        nom="NewUser", prenom="Test", email=f"newuser@example.com{rd.randint(1, 9999999)}", password="testpassword"
    )

    result = create_utilisateur(utilisateur=utilisateur_create)
    print(result)


def test_update_utilisateur():
    # Test data for the function
    utilisateur_update = UtilisateurUpdate(
        id_utilisateur=1, nom="UpdatedUser", prenom="Updated"
    )

    update_utilisateur(utilisateur_update)


if __name__ == "__main__":
    test_get_utilisateurs()
    test_create_utilisateur()
    test_update_utilisateur()
