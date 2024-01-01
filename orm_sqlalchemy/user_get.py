from fastapi import status, HTTPException
from sqlalchemy import create_engine, select
from sqlalchemy.orm import sessionmaker
from sqlalchemy.exc import NoResultFound
import settings
from orm_sqlalchemy.models import Utilisateur, TypeResponsabilite, Responsable
from passlib.context import CryptContext
from pydantic_models.models import ResponsableBase, ResponsableUpdate, TypeResponsabiliteBase, UtilisateurCreate
from orm_sqlalchemy.does_exist import *
from orm_sqlalchemy.secondary_links import *

engine = create_engine(settings.POSTGRES_URI)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
session = SessionLocal()

# made different file to avoid cyclic imports
def get_user(email: str | None) -> Utilisateur | None:
    utilisateurs: list[Utilisateur] = session.query(
        Utilisateur).filter(Utilisateur.email == email).all()
    if len(utilisateurs) == 0:
        return None
    if len(utilisateurs) > 1:
        print('WARNING : many users with same email')
    return utilisateurs[0]
