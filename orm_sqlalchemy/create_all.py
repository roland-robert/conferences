from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from datetime import date, datetime

from orm_sqlalchemy.models import Base, Pays, Utilisateur, EditeurConference, Serie, Organisateur, Theme, TypeResponsabilite, Responsable, LienUtilisateurTheme, Ville, Conference, CategorieSoumission, Session, LienConferenceResponsable, LienSessionResponsable, LienSessionTheme
import settings
import warnings


engine = create_engine(settings.POSTGRES_URI)
Base.metadata.bind = engine
DBSession = sessionmaker(bind=engine)
session = DBSession()


def create_all():
    Base.metadata.create_all(engine)


def populate_all():
    if session.query(Pays).all():
        print('Trying to populate already populated db. Nothing will happen.')
        warnings.warn(
            f'Trying to populate already populated db. Nothing will happen.')
        return
    countries = ['France', 'Allemagne', 'États-Unis',
                 'Canada', 'Japon', 'Australie']
    for country_name in countries:
        country = Pays(nom=country_name)
        session.add(country)
    session.commit()

    user1 = Utilisateur(nom='John', prenom='Doe', email='john.doe@example.com',
                        password_hash='hash123', password_salt='salt123', user_role='user')
    user2 = Utilisateur(nom='Jane', prenom='Doe', email='jane.doe@example.com',
                        password_hash='hash456', password_salt='salt456', user_role='user')
    # mdp = admin pour le hash
    user3 = Utilisateur(nom='Walter', prenom='White', email='admin@admin.com',
                        password_hash='$2b$12$rhbqFlH659WMx.ImtCN1OOuULA3Dhg2ji9tmSBb492e8L1wV0lb6q', password_salt='salt456', user_role='admin')
    session.add_all([user1, user2, user3])
    session.commit()

    editor1 = EditeurConference(nom='EditeurPro')
    editor2 = EditeurConference(nom='LetsEdit')
    editor3 = EditeurConference(nom='EditFo')
    session.add_all([editor1, editor2, editor3,
                    EditeurConference(nom='Editeur_4')])
    session.commit()

    series = [Serie(nom=f'Serie_{i}') for i in range(1, 6)]
    session.add_all(series)
    session.commit()

    organizers_data = [
        {
            'nom': 'BigOrg',
            'adresse': '4 rue bigorg',
            'email': 'bigorg@bigorg.com',
        },
        {
            'nom': 'Organizer2',
            'adresse': '1 rue Paris',
            'email': 'organizer2@example.com',
        },
        {
            'nom': 'OrgMaster',
            'adresse': '19 rue du Maitre Co',
            'email': 'eventmaster@example.com',
        },
        {
            'nom': 'ConferencePro',
            'adresse': '7 rue du Pro',
            'email': 'conferencepro@example.com',
        },
    ]

    for organizer_data in organizers_data:
        organizer = Organisateur(**organizer_data)
        session.add(organizer)

    session.commit()

    themes = [Theme(nom=f'Fusion Collaborative'),
              Theme(nom=f'Sommet de Synergie Mondiale'),
              Theme(nom=f'Forum des Horizons Futurs'),
              Theme(nom=f'Exposition sur les Connaissances'),
              Theme(nom=f'Confluence de Découverte Technologique')]
    session.add_all(themes)
    session.commit()

    types_responsability = [TypeResponsabilite(
        nom='Organisateur'), TypeResponsabilite(nom='Secretaire')]
    session.add_all(types_responsability)
    session.commit()

    responsible1 = Responsable(
        adresse_pro='secretaire@pro.com', id_type_responsabilite=2, id_utilisateur=1)
    responsible2 = Responsable(
        adresse_pro='secretaire2@pro.com', id_type_responsabilite=1, id_utilisateur=3)
    session.add_all([responsible1, responsible2])
    session.commit()

    user_theme_relation = LienUtilisateurTheme(id_utilisateur=1, id_theme=1)
    user_theme_relation = LienUtilisateurTheme(id_utilisateur=2, id_theme=1)
    user_theme_relation = LienUtilisateurTheme(id_utilisateur=2, id_theme=3)
    user_theme_relation = LienUtilisateurTheme(id_utilisateur=3, id_theme=5)
    session.add(user_theme_relation)
    session.commit()

    cities = [Ville(id_pays=1, nom_ville='Paris'), Ville(id_pays=1, nom_ville='Marseille'),
              Ville(id_pays=2, nom_ville='Berlin'), Ville(
                  id_pays=2, nom_ville='Munich'),
              Ville(id_pays=3, nom_ville='New York'), Ville(
                  id_pays=3, nom_ville='San Francisco'),
              Ville(id_pays=4, nom_ville='Toronto'), Ville(
                  id_pays=4, nom_ville='Vancouver'),
              Ville(id_pays=5, nom_ville='Tokyo'), Ville(
                  id_pays=5, nom_ville='Osaka'),
              Ville(id_pays=6, nom_ville='Sydney'), Ville(id_pays=6, nom_ville='Melbourne')]

    session.add_all(cities)
    session.commit()

    conferences = [Conference(
        id_serie=1,
        id_ville=1,
        id_organisateur=1,
        id_editeur=1,
        id_conference_du_workshop=None,
        intitule='Conference discussion sur le workshop',
        date_debut=datetime.fromisoformat(
            '2023-01-04T16:41:24'),
        date_fin=datetime.fromisoformat(
            '2023-01-04T18:41:24'),
        texte_introductif='Introduction for Conference1',
        image_url="https://admin.live.ilo.org/sites/default/files/2023-06/52951700532_df0e3916d9_k.jpg",
    ),
        Conference(
        id_serie=2,
        id_ville=3,
        id_organisateur=2,
        id_editeur=3,
        id_conference_du_workshop=1,
        intitule='Workshop',
        date_debut=datetime.fromisoformat(
            '2022-01-04T16:41:24'),
        date_fin=datetime.fromisoformat(
            '2022-01-04T18:41:24'),
        texte_introductif='Aller on discute',
        image_url="https://admin.live.ilo.org/sites/default/files/2023-06/52951700532_df0e3916d9_k.jpg",
    )]
    session.add_all(conferences)
    session.commit()

    categories_list = []

    # Existing category
    category_submission1 = CategorieSoumission(
        id_conference=1,
        nom_categorie='Category1',
        nombre_maxi_pages=10,
        font='Arial',
        font_size=12,
        type_logiciel='Word',
        date_soumission=datetime.fromisoformat('2023-01-04T16:41:24'),
        date_notification_acceptation=date.today(),
        date_limite_envoi_version_corrigee=datetime.fromisoformat(
            '2014-01-04T16:41:24')
    )
    categories_list.append(category_submission1)

    category_submission_regular_paper = CategorieSoumission(
        id_conference=1,
        nom_categorie='Regular paper',
        nombre_maxi_pages=12,
        font='Times New Roman',
        font_size=14,
        type_logiciel='PDF',
        date_soumission=datetime.fromisoformat('2023-02-15T10:30:00'),
        date_notification_acceptation=date.today(),
        date_limite_envoi_version_corrigee=datetime.fromisoformat(
            '2014-02-28T18:00:00')
    )
    categories_list.append(category_submission_regular_paper)

    category_submission_panel = CategorieSoumission(
        id_conference=1,
        nom_categorie='Panel',
        nombre_maxi_pages=8,
        font='Helvetica',
        font_size=10,
        type_logiciel='PowerPoint',
        date_soumission=datetime.fromisoformat('2023-02-20T12:45:00'),
        date_notification_acceptation=date.today(),
        date_limite_envoi_version_corrigee=datetime.fromisoformat(
            '2014-03-05T15:30:00')
    )
    categories_list.append(category_submission_panel)

    category_submission_tutorial = CategorieSoumission(
        id_conference=2,
        nom_categorie='Tutorial',
        nombre_maxi_pages=15,
        font='Courier New',
        font_size=16,
        type_logiciel='Markdown',
        date_soumission=datetime.fromisoformat('2023-03-10T08:00:00'),
        date_notification_acceptation=date.today(),
        date_limite_envoi_version_corrigee=datetime.fromisoformat(
            '2014-04-01T20:00:00')
    )
    categories_list.append(category_submission_tutorial)

    category_submission_workshop = CategorieSoumission(
        id_conference=2,
        nom_categorie='workshop',
        nombre_maxi_pages=15,
        font='Courier New',
        font_size=14,
        type_logiciel='Markdown',
        date_soumission=datetime.fromisoformat('2023-03-10T08:00:00'),
        date_notification_acceptation=date.today(),
        date_limite_envoi_version_corrigee=datetime.fromisoformat(
            '2014-04-01T20:00:00')
    )
    categories_list.append(category_submission_workshop)

    session.add_all(categories_list)
    session.commit()

    session1 = Session(intitule='Session1', id_conference=1)
    session2 = Session(intitule='Session2', id_conference=1)
    session.add_all([session1, session2])
    session.commit()

    conference_responsable_relation = LienConferenceResponsable(
        id_conference=1, id_responsable=1)
    session.add(conference_responsable_relation)
    session.commit()

    session_responsable_relation = LienSessionResponsable(
        id_session=1, id_responsable=1)
    session.add(session_responsable_relation)
    session.commit()

    session_theme_relation = LienSessionTheme(id_session=1, id_theme=1)
    session.add(session_theme_relation)
    session.commit()
