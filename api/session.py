from fastapi import FastAPI, HTTPException, APIRouter
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

import settings
from pydantic_models.models import Session, SessionBase, SessionUpdate
from orm_sqlalchemy.session import create_session_and_link, update_session, get_sessions
router = APIRouter(tags=["Session"])


@router.get("/sessions/", response_model=list[Session])
def get_sessions_endpoint():
    return get_sessions()


@router.post("/session/", response_model=int)
def create_session_endpoint(session_: SessionBase, theme_ids: list[int] = [], responsable_ids: list[int] = []):
    new_session_id = create_session_and_link(
        session_, theme_ids, responsable_ids)
    return new_session_id


@router.put("/session/", response_model=None)
def update_session_endpoint(session_update: SessionUpdate):
    update_session(session_update)
    return None
