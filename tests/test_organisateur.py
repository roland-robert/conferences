from api.organisateur import get_organisateurs
from pydantic_models.models import OrganisateurBase, OrganisateurUpdate
from orm_sqlalchemy.organisateur import create_organisateur, update_organisateur, get_organisateurs


def test_get_organisateur():
    organisateurs = get_organisateurs()


def test_create_organisateur():
    # Test data for the function
    organisateur_base = OrganisateurBase(
        nom="New Organisateur", adresse="Address", email="email@example.com"
    )

    # Call the function without any database interaction
    result = create_organisateur(organisateur=organisateur_base)
    print(result)


def test_update_organisateur():
    # Test data for the function
    organisateur_update = OrganisateurUpdate(
        id_organisteur=1, nom="Updated Organisateur", adresse="New Address", email='mailtest'
    )

    # Call the function without any database interaction
    update_organisateur(organisateur_update=organisateur_update)
