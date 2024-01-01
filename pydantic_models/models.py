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


class UtilisateurCreate(BaseModel):
    nom: str
    prenom: str
    email: str
    password: str


class UtilisateurUpdate(BaseModel):
    id_utilisateur: int
    nom: str | None
    prenom: str | None


class UtilisateurRead(BaseModel):
    id_utilisateur: int
    nom: str | None
    prenom: str | None
    email: str
    user_role: str


class EditeurConferenceBase(BaseModel):
    nom: str


class EditeurConference(EditeurConferenceBase):
    id_editeur_conference: int


class EditeurConferenceUpdate(EditeurConference):
    pass


class SerieBase(BaseModel):
    nom: str


class Serie(SerieBase):
    id_serie: int


class SerieUpdate(Serie):
    pass


class SerieOptional(SerieBase):
    id_serie: int | None


class OrganisateurBase(BaseModel):
    nom: str
    adresse: str
    email: str


class Organisateur(OrganisateurBase):
    id_organisateur: int | None


class OrganisateurUpdate(OrganisateurBase):
    id_organisteur: int


class ThemeBase(BaseModel):
    nom: str


class Theme(ThemeBase):
    id_theme: int | None


class ThemeUpdate(ThemeBase):
    id_theme: int


class ThemeOptional(ThemeBase):
    id_theme: int | None


class TypeResponsabiliteBase(BaseModel):
    nom: str


class TypeResponsabilite(TypeResponsabiliteBase):
    id_type_responsabilite: int | None


class ResponsableBase(BaseModel):
    adresse_pro: str | None
    id_utilisateur: int | None
    id_type_responsabilite: int | None


class ResponsableUpdate(ResponsableBase):
    id_responsable: int | None


class Responsable(ResponsableBase):
    id_responsable: int | None
    utilisateur: Utilisateur | None
    type_responsabilite: TypeResponsabilite | None


class LienUtilisateurThemeBase(BaseModel):
    id_utilisateur: int | None
    id_theme: int | None


class VilleBase(BaseModel):
    id_pays: int | None
    nom_ville: str | None


class VilleCreate(VilleBase):
    pass


class Ville(VilleBase):
    id_ville: int | None
    pays: Pays | None


class VilleAndPays(BaseModel):
    nom_ville: str | None
    pays: PaysBase


class CategorieSoumissionBase(BaseModel):
    id_conference: int | None
    nom_categorie: str | None
    nombre_maxi_pages: int | None
    font: str | None
    font_size: int | None
    type_logiciel: str | None
    date_soumission: datetime | None
    date_notification_acceptation: datetime | None
    date_limite_envoi_version_corrigee: datetime | None


class CategorieSoumissionCreate(CategorieSoumissionBase):
    pass


class CategorieSoumission(CategorieSoumissionBase):
    id_categorie_soumission: int | None


class CategorieSoumissionUpdate(CategorieSoumissionBase):
    id_categorie_soumission: int


class SessionBase(BaseModel):
    intitule: str
    id_conference: int | None


class SessionUpdate(SessionBase):
    id_session: int


class Session(SessionBase):
    id_session: int | None
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


class LienSessionTheme(LienSessionThemeBase):
    pass


class ConferenceBase(BaseModel):
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


class ConferenceUpdate(ConferenceBase):
    id_conference: int


class ConferenceCreate(ConferenceBase):
    serie: SerieOptional | None
    ville: Ville | None
    organisateur: Organisateur | None
    editeur_conference: EditeurConference | None
    utilisateur: Utilisateur | None
    categories_soumission: List[CategorieSoumission]
    sessions: List[Session]


class ConferenceCreateOrUpdate(ConferenceCreate):
    id_conference: int | None


class Conference(ConferenceBase):
    id_conference: int
    serie: SerieOptional | None
    ville: Ville | None
    organisateur: Organisateur | None
    editeur_conference: EditeurConference | None
    utilisateur: Utilisateur | None
    categories_soumission: List[CategorieSoumission]
    sessions: List[Session]
