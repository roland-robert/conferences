from fastapi import FastAPI, HTTPException, APIRouter
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

import settings
from pydantic_models.models import EditeurConference, EditeurConferenceBase, EditeurConferenceUpdate
from orm_sqlalchemy.editeur_conference import get_editeurs_conference, update_edditeur_conference, create_editeur_conference

router = APIRouter(tags=["Editeur Conference"])


@router.get("/editeurs_conference/", response_model=list[EditeurConference])
def read_editeurs_conference():
    return get_editeurs_conference()


@router.post("/editeur_conference/", response_model=int)
def post_editeur_conference(
    editeur_conference: EditeurConferenceBase
):
    return create_editeur_conference(editeur_conference)


@router.put("/editeur_conference/", response_model=None)
def put_editeur_conference(editeur_conference: EditeurConferenceUpdate):
    update_edditeur_conference(editeur_conference)
    return None
