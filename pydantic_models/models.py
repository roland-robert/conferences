"""These models are just templates for API documentation, error handling and validation.
They are based on the sqlalchemy models
"""

from pydantic import BaseModel, validator
from typing import List, Optional
from datetime import datetime


class PaysBase(BaseModel):
    nom: str


class Pays(PaysBase):
    id_pays: int


class UtilisateurBase(BaseModel):
    nom: str
    prenom: str
    email: str
    password_hash: str
    password_salt: str
    user_role: str


class Utilisateur(UtilisateurBase):
    id_utilisateur: int


class EditeurConferenceBase(BaseModel):
    nom: str


class EditeurConference(EditeurConferenceBase):
    id_editeur_conference: int


class SerieBase(BaseModel):
    nom: str


class Serie(SerieBase):
    id_serie: int


class OrganisateurBase(BaseModel):
    nom: str
    adresse: str
    email: str


class Organisateur(OrganisateurBase):
    id_organisateur: int | None


class ThemeBase(BaseModel):
    nom: str


class Theme(ThemeBase):
    id_theme: int


class TypeResponsabiliteBase(BaseModel):
    nom: str


class TypeResponsabilite(TypeResponsabiliteBase):
    id_type_responsabilite: int


class ResponsableBase(BaseModel):
    adresse_pro: str
    id_utilisateur: int
    id_type_responsabilite: int


class Responsable(ResponsableBase):
    id_responsable: int
    utilisateur: Utilisateur
    type_responsabilite: TypeResponsabilite


class LienUtilisateurThemeBase(BaseModel):
    id_utilisateur: int
    id_theme: int


class LienUtilisateurThemeCreate(LienUtilisateurThemeBase):
    pass


class LienUtilisateurTheme(LienUtilisateurThemeBase):
    pass


class VilleBase(BaseModel):
    id_pays: int
    nom_ville: str


class VilleCreate(VilleBase):
    pass


class Ville(VilleBase):
    id_ville: int
    pays: Pays


class CategorieSoumissionBase(BaseModel):
    id_conference: int
    nom_categorie: str
    nombre_maxi_pages: int
    font: str
    font_size: int
    type_logiciel: str
    date_soumission: datetime
    date_notification_acceptation: datetime
    date_limite_envoi_version_corrigee: datetime


class CategorieSoumissionCreate(CategorieSoumissionBase):
    pass


class CategorieSoumission(CategorieSoumissionBase):
    id_categorie_soumission: int


class SessionBase(BaseModel):
    intitule: str
    id_conference: int


class Session(SessionBase):
    id_session: int
    responsables: List[Responsable]
    themes: List[Theme]


class LienConferenceResponsableBase(BaseModel):
    id_conference: int
    id_responsable: int


class LienConferenceResponsableCreate(LienConferenceResponsableBase):
    pass


class LienConferenceResponsable(LienConferenceResponsableBase):
    pass


class LienSessionResponsableBase(BaseModel):
    id_session: int
    id_responsable: int


class LienSessionResponsableCreate(LienSessionResponsableBase):
    pass


class LienSessionResponsable(LienSessionResponsableBase):
    pass


class LienSessionThemeBase(BaseModel):
    id_session: int
    id_theme: int


class LienSessionThemeCreate(LienSessionThemeBase):
    pass


class LienSessionTheme(LienSessionThemeBase):
    pass


class ConferenceBase(BaseModel):
    id_conference: int
    id_serie: int | None
    id_ville: int | None
    id_organisateur: int | None
    id_editeur: int | None
    id_conference_du_workshop: int | None
    id_utilisateur: int | None
    intitule: str | None
    date_debut: datetime | None
    date_fin: datetime | None
    texte_introductif: str | None
    image_url: str | None


class Conference(ConferenceBase):
    serie: Serie | None
    ville: Ville | None
    organisateur: Organisateur | None
    editeur_conference: EditeurConference | None
    utilisateur: Utilisateur | None
    categories_soumission: List[CategorieSoumission]
    sessions: List[Session]
