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


@app.get("/")
async def home():
    """test get method"""
    return {"Bonjour": "Il n'y a rien ici"}


@app.get("/whatismytoken/")
async def read_items(token: Annotated[str, Depends(oauth2_scheme)]):
    return {"token": token}
