from fastapi import FastAPI, HTTPException, APIRouter
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

import settings
from pydantic_models.models import Organisateur as PydanticOrganisateur
from orm_sqlalchemy.models import Organisateur

router = APIRouter()

engine = create_engine(settings.POSTGRES_URI)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)


@router.get("/organizers/", response_model=list[PydanticOrganisateur])
async def get_organizers():
    db = SessionLocal()
    organizers: list[Organisateur] = db.query(Organisateur).all()
    db.close()
    return organizers
