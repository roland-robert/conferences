from fastapi import FastAPI, HTTPException, APIRouter
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from orm_sqlalchemy.organisateur import create_organisateur, update_organisateur
import settings
from pydantic_models.models import Organisateur as PydanticOrganisateur, OrganisateurUpdate, OrganisateurBase
from orm_sqlalchemy.models import Organisateur

router = APIRouter(tags=["Organisateur"])

engine = create_engine(settings.POSTGRES_URI)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)


@router.get("/organisateurs/", response_model=list[PydanticOrganisateur])
async def get_organisateurs():
    db = SessionLocal()
    organizers: list[Organisateur] = db.query(Organisateur).all()
    db.close()
    return organizers


@router.put("/organisateur/", response_model=None)
async def put_organisateur(organisateur: OrganisateurUpdate) -> None:
    return update_organisateur(organisateur)


@router.post("/organisateur/", response_model=int)
async def post_organisateur(organisateur: OrganisateurBase) -> int:
    return create_organisateur(organisateur)
