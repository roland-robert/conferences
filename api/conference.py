from fastapi import FastAPI, HTTPException, APIRouter, status, Query
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from typing import Literal, Annotated
import settings

from pydantic_models.models import Conference, ConferenceBase, ConferenceCreateOrUpdate, ConferenceUpdate
from orm_sqlalchemy.models import Organisateur
from orm_sqlalchemy.conference import get_conference, get_conferences, post_conference, update_conference, post_or_update_conference_pro

router = APIRouter(tags=["Conference"])


@router.get("/conference/{id_conference}", response_model=Conference)
async def get_conference_by_id(id_conference: int):
    conference = get_conference(id_conference)
    if conference is None:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"Conference avec id={id_conference} n'existe pas.",
        )
    return conference


@router.get("/conferences", response_model=list[Conference])
async def get_conferences_filter(order_by: Literal['date_debut', 'date_fin'] = 'date_debut',
                                 order: Literal['asc', 'desc'] = 'asc',
                                 id_pays: int | None = None,
                                 id_theme_list: Annotated[list[int],
                                                          Query(max_length=50)] = [],
                                 id_serie: int | None = None,
                                 id_editeur: int | None = None,
                                 responsable: str | None = None,  # nom ou prenom regex sur nom ou prenom contient
                                 min_date: str | None = None,  # 2023-12-09T00:00:00 UTC format
                                 max_date: str | None = None,  # 2023-12-09T00:00:00 UTC format
                                 # None ignore, true only workshops, false only not workshops
                                 is_workshop: bool | None = None,
                                 id_utilisateur: int | None = None,
                                 ):

    conferences = get_conferences(
        id_pays=id_pays,
        id_theme_list=id_theme_list,
        id_serie=id_serie,
        id_editeur=id_editeur,
        responsable=responsable,
        min_date=min_date,
        max_date=max_date,
        is_workshop=is_workshop,
        order_by=order_by,
        order=order,
        id_utilisateur=id_utilisateur,
    )
    return conferences


@router.post("/conference/", response_model=int)
async def post_conference_endpoint(conference: ConferenceBase):
    return post_conference(conference)


@router.put("/conference/", response_model=int)
async def update_conference_endpoint(conference: ConferenceUpdate):
    return update_conference(conference)


conference_full_pro_desc = """Le modèle exacte du body est le suivant, quand il y a =None, alors facultatif.
class ConferenceCreateOrUpdate(BaseModel):

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
    
    serie: SerieOptional | None = None
    
    ville: Ville | None = None
    
    organisateur: Organisateur | None = None
    
    editeur_conference: EditeurConference | None = None
    
    utilisateur: Utilisateur | None = None
    
    categories_soumission: List[CategorieSoumission]
    
    sessions: List[Session]
    
    id_conference: int | None = None

Attention : 

Les ids directes dans l'objet conference l'emportent sur le reste, donc par exemple pour ajouter un éditeur il faut l'objet editeur (sans id_editeur) et pas mettre d'id_editeur dans l'objet conférence.

Pour relier une conférence à un autre editeur il suffit d'avoir l'id_editeur.

Pour relier à un autre éditeur et update l'éditeur il faut set l'id_editeur à null et avoir un id_editeur dans l'objet editeur.

Les autres attributs 'image_url, texte_introductifs etc..., si ils ne sont pas présent SERONT SUPPRIMéS ! (set à NULL dans SQL).

Les villes et les utilisateurs ne seront pas updatés ici, on ne peut que changer les liens.

On suppose quand l'entrée est bonne, vérifier que tous les ids passés existent sinon on peut récupérer une erreur 500 non documentée ! (il faudra regarder les logs serveurs pour comprendre)
"""


@router.post("/conference_full_pro/", response_model=int, description=conference_full_pro_desc)
async def post_or_update_conference_pro_endpoint(conference: ConferenceCreateOrUpdate):
    return post_or_update_conference_pro(conference)
