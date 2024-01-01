from pydantic_models.models import SessionBase, ThemeBase
from orm_sqlalchemy.secondary_links import (
    link_theme_and_session,
    link_utilisateur_and_theme,
    link_responsable_and_conference,
    link_session_and_responsable,
    link_session_and_theme,
    link_user_and_theme,
    link_conference_and_responsable,
    link_responsable_and_session,
    delete_session_theme,
    delete_user_theme,
    delete_conference_responsable,
    delete_responsable_session
)


def test_link_theme_and_session():
    # Test data for the function
    id_theme, id_session = 1, 1

    # Call the function without any database interaction
    link_theme_and_session(id_theme=id_theme, id_session=id_session)
    print("Link created successfully")


def test_link_utilisateur_and_theme():
    # Test data for the function
    id_utilisateur, id_theme = 1, 1

    # Call the function without any database interaction
    link_utilisateur_and_theme(id_utilisateur=id_utilisateur, id_theme=id_theme)
    print("Link created successfully")


def test_link_responsable_and_conference():
    # Test data for the function
    id_responsable, id_conference = 1, 1

    # Call the function without any database interaction
    link_responsable_and_conference(
        id_responsable=id_responsable, id_conference=id_conference)
    print("Link created successfully")


def test_link_session_and_responsable():
    # Test data for the function
    id_session, id_responsable = 1, 1

    # Call the function without any database interaction
    link_session_and_responsable(
        id_session=id_session, id_responsable=id_responsable)
    print("Link created successfully")


def test_link_session_and_theme():
    # Test data for the function
    id_session, id_theme = 1, 1

    # Call the function without any database interaction
    link_session_and_theme(id_session=id_session, id_theme=id_theme)
    print("Link created successfully")


def test_link_user_and_theme():
    # Test data for the function
    id_utilisateur, id_theme = 1, 1

    # Call the function without any database interaction
    link_user_and_theme(id_utilisateur=id_utilisateur, id_theme=id_theme)
    print("Link created successfully")


def test_link_conference_and_responsable():
    # Test data for the function
    id_conference, id_responsable = 1, 1

    # Call the function without any database interaction
    link_conference_and_responsable(
        id_conference=id_conference, id_responsable=id_responsable)
    print("Link created successfully")


def test_link_responsable_and_session():
    # Test data for the function
    id_responsable, id_session = 1, 1

    # Call the function without any database interaction
    link_responsable_and_session(
        id_responsable=id_responsable, id_session=id_session)
    print("Link created successfully")


def test_delete_session_theme():
    # Test data for the function
    id_session, id_theme = 1, 1

    # Call the function without any database interaction
    delete_session_theme(id_session=id_session, id_theme=id_theme)
    print("Link deleted successfully")


def test_delete_user_theme():
    # Test data for the function
    id_utilisateur, id_theme = 1, 1

    # Call the function without any database interaction
    delete_user_theme(id_utilisateur=id_utilisateur, id_theme=id_theme)
    print("Link deleted successfully")


def test_delete_conference_responsable():
    # Test data for the function
    id_conference, id_responsable = 1, 1

    # Call the function without any database interaction
    delete_conference_responsable(
        id_conference=id_conference, id_responsable=id_responsable)
    print("Link deleted successfully")


def test_delete_responsable_session():
    # Test data for the function
    id_responsable, id_session = 1, 1

    # Call the function without any database interaction
    delete_responsable_session(
        id_responsable=id_responsable, id_session=id_session)
    print("Link deleted successfully")


if __name__ == "__main__":
    test_link_theme_and_session()
    test_link_utilisateur_and_theme()
    test_link_responsable_and_conference()
    test_link_session_and_responsable()
    test_link_session_and_theme()
    test_link_user_and_theme()
    test_link_conference_and_responsable()
    test_link_responsable_and_session()
    test_delete_session_theme()
    test_delete_user_theme()
    test_delete_conference_responsable()
    test_delete_responsable_session()
