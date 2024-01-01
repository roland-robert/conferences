from pydantic_models.models import ThemeBase, ThemeUpdate
from orm_sqlalchemy.theme import create_theme, create_theme_and_link, get_theme, get_themes, update_theme


def test_get_themes():
    # Assuming you have test data in the database
    themes = get_themes()
    assert themes is not None
    assert isinstance(themes, list)


def test_create_theme():
    # Assuming you have test data for theme creation
    theme_data = {
        "nom": "Test Theme",
        # Add other ThemeBase fields here
    }
    theme_base = ThemeBase(**theme_data)
    theme_id = create_theme(theme_base)
    assert theme_id is not None
    assert isinstance(theme_id, int)


def test_create_theme_and_link():
    theme_data = {
        "nom": "Test Theme",
    }
    theme_base = ThemeBase(**theme_data)

    session_ids = [1, 2, 3]
    utilisateur_ids = [1, 2, 3]

    theme_id = create_theme_and_link(theme_base, session_ids, utilisateur_ids)
    assert theme_id is not None
    assert isinstance(theme_id, int)


def test_update_theme():
    theme_update_data = {
        "id_theme": 1,
        "nom": "Updated Theme Name",
    }
    theme_update = ThemeUpdate(**theme_update_data)

    update_theme(theme_update)
    updated_theme = get_theme(1)
    assert updated_theme is not None
    assert str(updated_theme.nom) == "Updated Theme Name"
