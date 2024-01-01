from fastapi import FastAPI, HTTPException, APIRouter
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

import settings
from pydantic_models.models import VilleBase, VilleAndPays, PaysBase, Ville, Pays
from orm_sqlalchemy.pays_ville import get_pays, get_villes, create_pays, create_ville, create_ville_and_pays

router = APIRouter(tags=["Pays Ville"])

@router.get("/villes/", response_model=list[Ville])
def read_villes():
    villes = get_villes()
    return villes


@router.post("/ville/", response_model=int)
def create_ville(ville: VilleBase):
    return create_ville(ville)


@router.get("/pays/", response_model=list[Pays])
def read_pays():
    pays = get_pays()
    return pays


@router.post("/pays/", response_model=int)
def create_pays_endpoint(pays: PaysBase):
    return create_pays(pays)


@router.post("/ville-pays/", response_model=tuple[int, int])
def create_ville_and_pays_endpoint(ville_pays: VilleAndPays):
    return create_ville_and_pays(ville_pays)
