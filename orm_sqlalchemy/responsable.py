from fastapi import status, HTTPException
from sqlalchemy import create_engine, select, insert
from sqlalchemy.orm import sessionmaker
from sqlalchemy.exc import NoResultFound
import settings
from orm_sqlalchemy.models import Utilisateur, TypeResponsabilite, Responsable
from passlib.context import CryptContext
from pydantic_models.models import ResponsableBase, ResponsableUpdate, TypeResponsabiliteBase, Responsable as ResponsablePydantic
from orm_sqlalchemy.does_exist import *
from orm_sqlalchemy.secondary_links import *

engine = create_engine(settings.POSTGRES_URI)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
session = SessionLocal()


def get_responsables() -> list[Responsable]:
    query = session.query(Responsable).options(
        joinedload(Responsable.utilisateur),
        joinedload(Responsable.type_responsabilite),
    )
    return query.all()


def create_type_responsabilite(type_responsabilite: TypeResponsabiliteBase):
    with engine.connect() as connection:
        transaction = connection.begin()
        result = connection.execute(
            insert(TypeResponsabilite).values(**type_responsabilite.model_dump()))
        if result.inserted_primary_key is not None:
            transaction.commit()
            return result.inserted_primary_key[0]
        else:
            transaction.rollback()
            raise RuntimeError(
                "Failed to retrieve the inserted primary key for type respo.")


def create_responsable(responsable: ResponsableBase):
    """add new responsable"""
    id_utilisateur, id_type_responsabilite = responsable.id_utilisateur, responsable.id_type_responsabilite
    user_exists, type_responsabilite_exists = does_user_exist(
        id_utilisateur), does_type_responsabilite_exist(id_type_responsabilite)
    if not user_exists:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"Utilisateur id={id_utilisateur} n'existe pas lors de la création responsable={responsable.model_dump()}.",
        )
    if not type_responsabilite_exists:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"Type responsabilite id={id_type_responsabilite} n'existe pas lors de la création responsable={responsable.model_dump()}.",
        )

    with engine.connect() as connection:
        transaction = connection.begin()
        result = connection.execute(
            insert(Responsable).values(**responsable.model_dump()))
        if result.inserted_primary_key is not None:
            transaction.commit()
            return result.inserted_primary_key[0]
        else:
            transaction.rollback()
            raise RuntimeError("Failed to retrieve the inserted primary key.")


def update_responsable(responsable: ResponsableUpdate):
    """Set les liens à None si None est donné comme id (utilisateur, type responsabilite)!!"""
    id_utilisateur, id_type_responsabilite = responsable.id_utilisateur, responsable.id_type_responsabilite
    user_exists, type_responsabilite_exists = does_user_exist(
        id_utilisateur), does_type_responsabilite_exist(id_type_responsabilite)
    if not user_exists and id_utilisateur is not None:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"Utilisateur id={id_utilisateur} n'existe pas lors de l'update responsable={responsable.model_dump()}.",
        )
    if not type_responsabilite_exists and id_type_responsabilite is not None:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"Type responsabilite id={id_type_responsabilite} n'existe pas lors de l'update responsable={responsable.model_dump()}.",
        )
    try:
        existing_responsable = session.query(Responsable).filter_by(
            id_responsable=responsable.id_responsable).one()
    except NoResultFound:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"Responsable id={responsable.id_responsable} n'existe pas lors de son update responsable={responsable.model_dump()}.",
        )
    for key, value in responsable.model_dump(exclude_unset=True).items():
        if key == 'id_responsable':
            continue
        setattr(existing_responsable, key, value)
    session.commit()


def create_or_update_responsable_full(responsable: ResponsablePydantic) -> int:
    """creates type responsabilite if needed, flexible function"""
    if not responsable.id_type_responsabilite and responsable.type_responsabilite:
        if responsable.type_responsabilite.id_type_responsabilite:
            responsable.id_type_responsabilite = responsable.type_responsabilite.id_type_responsabilite
        else:
            id_type_responsabilite_new = create_type_responsabilite(
                responsable.type_responsabilite)
            responsable.id_type_responsabilite = id_type_responsabilite_new
    if not responsable.id_utilisateur and responsable.utilisateur and responsable.utilisateur.id_utilisateur:
        responsable.id_utilisateur = responsable.utilisateur.id_utilisateur

    data = {
        "id_utilisateur": responsable.id_utilisateur,
        "adresse_pro": responsable.adresse_pro,
        "id_type_responsabilite": responsable.id_type_responsabilite
    }

    if responsable.id_responsable:
        update_responsable(ResponsableUpdate(
            **data, id_responsable=responsable.id_responsable))
        return responsable.id_responsable

    return create_responsable(ResponsableBase(**data))


def get_type_responsabilite() -> list[TypeResponsabilite]:
    query = session.query(TypeResponsabilite)
    return query.all()
