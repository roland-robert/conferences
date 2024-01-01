from fastapi import FastAPI, HTTPException, APIRouter

from pydantic_models.models import SerieBase, SerieUpdate, Serie
from orm_sqlalchemy.serie import get_series, create_serie, update_serie

router = APIRouter(tags=["Serie"])


@router.get("/serie/", response_model=list[Serie])
def read_themes():
    return get_series()


@router.post("/serie/", response_model=int)
def create_serie(
        serie: SerieBase):
    return create_serie(serie)


@router.put("/serie/", response_model=None)
def update_theme_endpoint(serie: SerieUpdate):
    update_serie(serie)
    return None
