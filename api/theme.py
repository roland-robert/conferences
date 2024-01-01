from fastapi import FastAPI, HTTPException, APIRouter
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

import settings
from pydantic_models.models import Theme, ThemeBase, ThemeUpdate
from orm_sqlalchemy.theme import create_theme_and_link, update_theme, get_themes

router = APIRouter(tags=["Theme"])


@router.get("/themes/", response_model=list[Theme])
def read_themes():
    themes = get_themes()
    return themes


@router.post("/theme/", response_model=int)
def create_theme_and_link_endpoint(
    theme: ThemeBase, session_ids: list[int] = [], utilisateur_ids: list[int] = []
):
    return create_theme_and_link(theme, session_ids, utilisateur_ids)


@router.put("/theme", response_model=None)
def update_theme_endpoint(theme_update: ThemeUpdate):
    update_theme(theme_update)
    return None
