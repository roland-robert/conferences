from pydantic_models.models import ResponsableBase, ResponsableUpdate, TypeResponsabiliteBase
from orm_sqlalchemy.responsable import (
    get_responsables,
    create_type_responsabilite,
    create_responsable,
    update_responsable
)


def test_get_responsables():
    result = get_responsables()
    print(result)


def test_create_type_responsabilite():
    type_responsabilite_base = TypeResponsabiliteBase(
        nom="New Type Responsabilite")

    result = create_type_responsabilite(
        type_responsabilite=type_responsabilite_base)
    print(result)


def test_create_responsable():
    responsable_base = ResponsableBase(
        adresse_pro='addprotest', id_utilisateur=1, id_type_responsabilite=1)

    result = create_responsable(responsable=responsable_base)
    print(result)


def test_update_responsable():
    responsable_update = ResponsableUpdate(adresse_pro='addprodada',
                                           id_responsable=1, id_utilisateur=2, id_type_responsabilite=2)

    update_responsable(responsable=responsable_update)
    print("Update successful")


if __name__ == "__main__":
    test_get_responsables()
    test_create_type_responsabilite()
    test_create_responsable()
    test_update_responsable()
