"""These models are just templates for API documentation and error handling.
They are based on the sqlalchemy models
"""
from typing import List, Optional
from datetime import date
from pydantic import BaseModel


class PydanticPays(BaseModel):
    id_pays: Optional[int]
    nom: str


class PydanticUtilisateur(BaseModel):
    id_utilisateur: Optional[int]
    nom: str
    prenom: str
    email: str
    password_hash: str
    password_salt: str
    user_role: str


class PydanticEditeurConference(BaseModel):
    id_editeur_conference: Optional[int]
    nom: str


class PydanticSerie(BaseModel):
    id_serie: Optional[int]
    nom: str


class PydanticOrganisateur(BaseModel):
    id_organisateur: Optional[int]
    nom: str
    adresse: str
    email: str


class PydanticTheme(BaseModel):
    id_theme: Optional[int]
    nom: str


class PydanticTypeResponsabilite(BaseModel):
    id_type_responsabilite: Optional[int]
    nom: str


class PydanticResponsable(BaseModel):
    id_responsable: Optional[int]
    prenom: str
    nom: str
    adresse_pro: str
    adresse_email: str
    id_type_responsabilite: int


class PydanticLienUtilisateurTheme(BaseModel):
    id_utilisateur: int
    id_theme: int


class PydanticVille(BaseModel):
    id_ville: Optional[int]
    id_pays: int
    nom_ville: str


class PydanticConference(BaseModel):
    id_conference: Optional[int]
    id_serie: int
    id_ville: int
    id_organisateur: int
    id_editeur: int
    id_conference_du_workshop: Optional[int]
    intitule: str
    date_fin: date
    texte_introductif: str


class PydanticCategorieSoumission(BaseModel):
    id_categorie_soumission: Optional[int]
    id_conference: int
    nom_categorie: str
    nombre_maxi_pages: int
    font: str
    font_size: int
    type_logiciel: str
    date_soumission: date
    date_notification_acceptation: date
    date_limite_envoi_version_corrigee: date


class PydanticSession(BaseModel):
    id_session: Optional[int]
    intitule: str
    id_conference: int


class PydanticLienConferenceResponsable(BaseModel):
    id_conference: int
    id_responsable: int


class PydanticLienSessionResponsable(BaseModel):
    id_session: int
    id_responsable: int


class PydanticLienSessionTheme(BaseModel):
    id_session: int
    id_theme: int
