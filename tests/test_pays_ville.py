from pydantic_models.models import PaysBase, VilleBase, VilleAndPays
from orm_sqlalchemy.pays_ville import (
    get_villes,
    get_pays,
    create_pays,
    create_ville,
    create_ville_and_pays
)


def test_get_villes():
    result = get_villes()


def test_get_pays():
    result = get_pays()


def test_create_pays():
    # Test data for the function
    pays_base = PaysBase(nom="New Pays")

    # Call the function without any database interaction
    result = create_pays(pays=pays_base)


def test_create_ville():
    # Test data for the function
    ville_base = VilleBase(nom_ville="New Ville", id_pays=1)

    # Call the function without any database interaction
    result = create_ville(ville=ville_base)


def test_create_ville_and_pays():
    # Test data for the function
    ville_and_pays = VilleAndPays(
        nom_ville="New Ville", pays=PaysBase(**{"nom": "New Pays"}))

    # Call the function without any database interaction
    result = create_ville_and_pays(ville_pays=ville_and_pays)
