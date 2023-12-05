from re import U
from jose import JWTError, jwt
from datetime import datetime, timedelta
from typing import Annotated

from fastapi import Depends, FastAPI, HTTPException, status, APIRouter
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm
from pydantic import BaseModel
from sqlalchemy import create_engine, select
from sqlalchemy.orm import sessionmaker

import settings
from pydantic_models.models import PydanticOrganisateur
from orm_sqlalchemy.models import Utilisateur
from passlib.context import CryptContext

engine = create_engine(settings.POSTGRES_URI)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)


def get_user(email: str | None) -> Utilisateur | None:
    # stmt = select(Utilisateur).where(Utilisateur.email == email)
    # result = session.execute(stmt)
    session = SessionLocal()

    utilisateurs: list[Utilisateur] = session.query(
        Utilisateur).filter(Utilisateur.email == email).all()
    if len(utilisateurs) == 0:
        return None
    return utilisateurs[0]
