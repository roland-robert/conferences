from fastapi import FastAPI, HTTPException, APIRouter
from typing import List
from pydantic_models.models import Responsable, ResponsableBase, ResponsableUpdate, TypeResponsabiliteBase
from orm_sqlalchemy.responsable import create_responsable, update_responsable, get_responsables, create_type_responsabilite
from sqlalchemy.exc import NoResultFound
import settings

router = APIRouter(tags=["Responsable"])


@router.get("/responsables/", response_model=List[Responsable])
def read_responsables():
    responsables = get_responsables()
    return responsables


@router.post("/type-responsabilites/", response_model=int)
def create_type_responsabilite_endpoint(type_responsabilite: TypeResponsabiliteBase):
    new_type_responsabilite_id = create_type_responsabilite(
        type_responsabilite)
    return new_type_responsabilite_id


@router.post("/responsables/", response_model=int)
def create_responsable_endpoint(responsable: ResponsableBase):
    return create_responsable(responsable)


@router.put("/responsables/", response_model=None)
def update_responsable_endpoint(responsable_update: ResponsableUpdate):
    update_responsable(responsable_update)
    return None
