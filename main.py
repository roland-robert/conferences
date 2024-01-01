import csv
import json
import os

from fastapi import FastAPI, HTTPException, Body, Depends
from fastapi.staticfiles import StaticFiles
from fastapi.responses import FileResponse
from fastapi.middleware.cors import CORSMiddleware
from api.organisateur import router as organisateur_rooter
from api.user import router as user_rooter
from api.conference import router as conference_rooter
from api.theme import router as theme_rooter
from api.session import router as session_rooter
from api.responsable import router as responsable_rooter
from api.pays_ville import router as pays_ville_rooter
from api.editeur_conference import router as editeur_conference_rooter
from api.categorie_soumission import router as categorie_soumission_rooter
from api.serie import router as serie_rooter
from api.secondary_links import router as secondary_links_rooter
from api.utilisateur import router as utilisater_rooter


from fastapi.security import OAuth2PasswordBearer
from typing import Annotated

app = FastAPI()

oauth2_scheme = OAuth2PasswordBearer(tokenUrl="token")

origins = [
    "http://localhost:3000",
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# routes de api/users.py
app.include_router(user_rooter)
app.include_router(organisateur_rooter)
app.include_router(conference_rooter)
app.include_router(responsable_rooter)
app.include_router(theme_rooter)
app.include_router(session_rooter)
app.include_router(pays_ville_rooter)
app.include_router(categorie_soumission_rooter)
app.include_router(editeur_conference_rooter)
app.include_router(serie_rooter)
app.include_router(secondary_links_rooter)
app.include_router(utilisater_rooter)


@app.get("/")
async def home():
    """test get method"""
    return {"Bonjour": "Il n'y a rien ici"}


@app.get("/whatismytoken/")
async def read_items(token: Annotated[str, Depends(oauth2_scheme)]):
    return {"token": token}
