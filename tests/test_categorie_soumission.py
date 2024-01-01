from orm_sqlalchemy.categorie_soumission import get_categories_soumission, create_categorie_soumission, update_categorie_soumission
from pydantic_models.models import CategorieSoumissionBase, CategorieSoumissionUpdate
from datetime import datetime


def test_get_categories_soumission():
    result = get_categories_soumission()
    print(result)


def test_create_categorie_soumission():
    # Test data for the function
    categorie_soumission_base = CategorieSoumissionBase(
        id_conference=1, nom_categorie="New Category", nombre_maxi_pages=10,
        font="Arial", font_size=12, type_logiciel="TypeC",
        date_soumission=datetime.strptime("2023-03-01", "%Y-%m-%d"),
        date_notification_acceptation=datetime.strptime(
            "2023-03-10", "%Y-%m-%d"),
        date_limite_envoi_version_corrigee=datetime.strptime(
            "2023-03-20", "%Y-%m-%d")
    )

    result = create_categorie_soumission(
        categorie_soumission=categorie_soumission_base)
    print(result)


def test_update_categorie_soumission():
    # Test data for the function
    categorie_soumission_update = CategorieSoumissionUpdate(
        id_conference=1,
        id_categorie_soumission=1,
        nom_categorie="Updated Category", nombre_maxi_pages=20,
        font="Arial", font_size=12, type_logiciel="TypeC",
        date_soumission=datetime.strptime("2023-03-01", "%Y-%m-%d"),
        date_notification_acceptation=datetime.strptime(
            "2023-03-10", "%Y-%m-%d"),
        date_limite_envoi_version_corrigee=datetime.strptime(
            "2023-03-20", "%Y-%m-%d")
    )

    update_categorie_soumission(
        categorie_soumission=categorie_soumission_update)
