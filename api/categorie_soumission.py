from fastapi import FastAPI, HTTPException, APIRouter
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

import settings
from pydantic_models.models import CategorieSoumissionBase, CategorieSoumissionUpdate, CategorieSoumission
from orm_sqlalchemy.categorie_soumission import get_categories_soumission, create_categorie_soumission, update_categorie_soumission

router = APIRouter(tags=["Categorie Soumission"])


@router.get("/categories_soumission/", response_model=list[CategorieSoumission])
def read_categories_soumission():
    return get_categories_soumission()


@router.post("/categorie_soumission/", response_model=int)
def post_editeur_conference(
    categorie_soumission: CategorieSoumissionBase
):
    return create_categorie_soumission(categorie_soumission)


@router.put("/categorie_soumission/", response_model=None)
def put_editeur_conference(categorie_soumission: CategorieSoumissionUpdate):
    update_categorie_soumission(categorie_soumission)
    return None
