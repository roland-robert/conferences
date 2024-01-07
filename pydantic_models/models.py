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
    nom: str
    prenom: str


class ThemeBase(BaseModel):
    nom: str


class Theme(ThemeBase):
    id_theme: int | None = None


class ThemeUpdate(ThemeBase):
    id_theme: int


class ThemeOptional(ThemeBase):
    id_theme: int | None = None


class UtilisateurRead(BaseModel):
    id_utilisateur: int
    nom: str | None = None
    prenom: str | None = None
    email: str
    user_role: str
    themes: list[Theme]


class UtilisateurMe(Utilisateur):
    themes: list[Theme]


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
    id_serie: int | None = None


class OrganisateurBase(BaseModel):
    nom: str
    adresse: str
    email: str


class Organisateur(OrganisateurBase):
    id_organisateur: int | None = None


class OrganisateurUpdate(OrganisateurBase):
    id_organisteur: int


class TypeResponsabiliteBase(BaseModel):
    nom: str


class TypeResponsabilite(TypeResponsabiliteBase):
    id_type_responsabilite: int | None = None


class ResponsableBase(BaseModel):
    adresse_pro: str | None = None
    id_utilisateur: int | None = None
    id_type_responsabilite: int | None = None


class ResponsableUpdate(ResponsableBase):
    id_responsable: int | None = None


class Responsable(ResponsableBase):
    id_responsable: int | None = None
    utilisateur: Utilisateur | None = None
    type_responsabilite: TypeResponsabilite | None = None


class LienUtilisateurThemeBase(BaseModel):
    id_utilisateur: int | None = None
    id_theme: int | None = None


class VilleBase(BaseModel):
    id_pays: int | None = None
    nom_ville: str | None = None


class VilleCreate(VilleBase):
    pass


class Ville(VilleBase):
    id_ville: int | None = None
    pays: Pays | None = None


class VilleAndPays(BaseModel):
    nom_ville: str | None = None
    pays: PaysBase


class CategorieSoumissionBase(BaseModel):
    id_conference: int | None = None
    nom_categorie: str | None = None
    nombre_maxi_pages: int | None = None
    font: str | None = None
    font_size: int | None = None
    type_logiciel: str | None = None
    date_soumission: datetime | None = None
    date_notification_acceptation: datetime | None = None
    date_limite_envoi_version_corrigee: datetime | None = None


class CategorieSoumissionCreate(CategorieSoumissionBase):
    pass


class CategorieSoumission(CategorieSoumissionBase):
    id_categorie_soumission: int | None = None


class CategorieSoumissionUpdate(CategorieSoumissionBase):
    id_categorie_soumission: int


class SessionBase(BaseModel):
    intitule: str
    id_conference: int | None = None


class SessionUpdate(SessionBase):
    id_session: int


class Session(SessionBase):
    id_session: int | None = None
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
    id_serie: int | None = None
    id_ville: int | None = None
    id_organisateur: int | None = None
    id_editeur: int | None = None
    id_conference_du_workshop: int | None = None
    id_utilisateur: int | None = None
    intitule: str | None = None
    date_debut: datetime | None = None
    date_fin: datetime | None = None
    texte_introductif: str | None = None
    image_url: str | None = None


class ConferenceUpdate(ConferenceBase):
    id_conference: int


class ConferenceCreate(ConferenceBase):
    serie: SerieOptional | None = None
    ville: Ville | None = None
    organisateur: Organisateur | None = None
    editeur_conference: EditeurConference | None = None
    utilisateur: Utilisateur | None = None
    categories_soumission: List[CategorieSoumission]
    sessions: List[Session]


class ConferenceCreateOrUpdate(ConferenceCreate):
    id_conference: int | None = None


class Conference(ConferenceBase):
    id_conference: int
    serie: SerieOptional | None = None
    ville: Ville | None = None
    organisateur: Organisateur | None = None
    editeur_conference: EditeurConference | None = None
    utilisateur: Utilisateur | None = None
    categories_soumission: List[CategorieSoumission]
    sessions: List[Session]
