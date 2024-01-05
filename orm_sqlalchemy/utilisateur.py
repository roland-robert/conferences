from fastapi import status, HTTPException
from sqlalchemy import create_engine, select, insert
from sqlalchemy.orm import sessionmaker
from sqlalchemy.exc import NoResultFound
import settings
from orm_sqlalchemy.models import Utilisateur, TypeResponsabilite, Responsable
from passlib.context import CryptContext
from pydantic_models.models import ResponsableBase, ResponsableUpdate, TypeResponsabiliteBase, UtilisateurCreate, UtilisateurRead, UtilisateurUpdate
from orm_sqlalchemy.does_exist import *
from orm_sqlalchemy.secondary_links import *
from api.user import get_password_hash

engine = create_engine(settings.POSTGRES_URI)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
session = SessionLocal()


def get_utilisateurs() -> list[UtilisateurRead]:
    query = session.query(Utilisateur).options(
        joinedload(Utilisateur.themes))
    result = query.all()
    return [
        UtilisateurRead(
            id_utilisateur=row_dict["id_utilisateur"],
            nom=row_dict["nom"],
            prenom=row_dict["prenom"],
            email=row_dict["email"],
            user_role=row_dict["user_role"],
            themes=[theme.__dict__ for theme in row_dict["themes"]],
        )
        for row_dict in (row.__dict__ for row in result)
    ]


def create_utilisateur(utilisateur: UtilisateurCreate):
    password_hash = get_password_hash(utilisateur.password)
    password_salt = '123'  # TODO
    user_dict = {
        "nom": utilisateur.nom,
        "prenom": utilisateur.prenom,
        "password_hash": password_hash,
        "password_salt": password_salt,
        "email": utilisateur.email,
        "user_role": "user",
    }
    with engine.connect() as connection:
        transaction = connection.begin()
        result = connection.execute(
            insert(Utilisateur).values(user_dict))
        if result.inserted_primary_key is not None:
            transaction.commit()
            return result.inserted_primary_key[0]
        else:
            transaction.rollback()
            raise RuntimeError("Failed to retrieve the inserted primary key.")


def update_utilisateur(utilisateur_update: UtilisateurUpdate):
    try:
        existing_utilisateur = session.query(Utilisateur).filter_by(
            id_utilisateur=utilisateur_update.id_utilisateur).one()
    except NoResultFound:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"Utilisateur id={utilisateur_update.id_utilisateur} does not exist during the update for utilisateur={utilisateur_update.model_dump()}.",
        )

    for key, value in utilisateur_update.model_dump(exclude_unset=True).items():
        if key == 'id_utilisateur':
            continue
        setattr(existing_utilisateur, key, value)

    session.commit()
