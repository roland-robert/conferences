from sqlalchemy import create_engine, select
from sqlalchemy.orm import sessionmaker

import settings
from orm_sqlalchemy.models import Utilisateur
from passlib.context import CryptContext
from pydantic_models.models import ResponsableBase, TypeResponsabiliteBase

engine = create_engine(settings.POSTGRES_URI)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)


def get_user(email: str | None) -> Utilisateur | None:
    session = SessionLocal()
    utilisateurs: list[Utilisateur] = session.query(
        Utilisateur).filter(Utilisateur.email == email).all()
    if len(utilisateurs) == 0:
        return None
    if len(utilisateurs) > 1:
        print('WARNING : many users with same email')
    return utilisateurs[0]


def create_type_responsabilite(type_responsabilite: TypeResponsabiliteBase):
    pass

def create_responsable(responsable: ResponsableBase):
    """add responsable, """
    pass
