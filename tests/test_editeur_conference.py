from pydantic_models.models import EditeurConferenceBase, EditeurConferenceUpdate
from orm_sqlalchemy.editeur_conference import (
    get_editeurs_conference,
    create_editeur_conference,
    update_edditeur_conference
)


def test_get_editeurs_conference():
    # Call the function without any database interaction
    result = get_editeurs_conference()
    print(result)


def test_create_editeur_conference():
    # Test data for the function
    editeur_conference_base = EditeurConferenceBase(nom="New Editeur")

    # Call the function without any database interaction
    result = create_editeur_conference(editeur=editeur_conference_base)
    print(result)


def test_update_edditeur_conference():
    # Test data for the function
    editeur_conference_update = EditeurConferenceUpdate(
        id_editeur_conference=1, nom="Updated Editeur"
    )

    # Call the function without any database interaction
    update_edditeur_conference(editeur=editeur_conference_update)
