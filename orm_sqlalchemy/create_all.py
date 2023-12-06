from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from datetime import date

from orm_sqlalchemy.models import Base, Pays, Utilisateur, EditeurConference, Serie, Organisateur, Theme, TypeResponsabilite, Responsable, LienUtilisateurTheme, Ville, Conference, CategorieSoumission, Session, LienConferenceResponsable, LienSessionResponsable, LienSessionTheme
import settings


engine = create_engine(settings.POSTGRES_URI)
Base.metadata.bind = engine
DBSession = sessionmaker(bind=engine)
session = DBSession()


def create_all():
    Base.metadata.create_all(engine)


def populate_all():
    france = Pays(nom='France')
    session.add(france)
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

    editor1 = EditeurConference(nom='Editor1')
    editor2 = EditeurConference(nom='Editor2')
    session.add_all([editor1, editor2])
    session.commit()

    series = [Serie(nom=f'Serie{i}') for i in range(1, 4)]
    session.add_all(series)
    session.commit()

    organizer1 = Organisateur(
        nom='Organizer1', adresse='Address1', email='organizer1@example.com')
    organizer2 = Organisateur(
        nom='Organizer2', adresse='Address2', email='organizer2@example.com')
    session.add_all([organizer1, organizer2])
    session.commit()

    themes = [Theme(nom=f'Theme{i}') for i in range(1, 4)]
    session.add_all(themes)
    session.commit()

    type_responsability = TypeResponsabilite(nom='Type1')
    session.add(type_responsability)
    session.commit()

    responsible1 = Responsable(
        adresse_pro='AddressPro1', id_type_responsabilite=1, id_utilisateur=2)
    responsible2 = Responsable(
        adresse_pro='AddressPro2', id_type_responsabilite=1, id_utilisateur=2)
    session.add_all([responsible1, responsible2])
    session.commit()

    user_theme_relation = LienUtilisateurTheme(id_utilisateur=1, id_theme=1)
    session.add(user_theme_relation)
    session.commit()

    city1 = Ville(id_pays=1, nom_ville='Paris')
    city2 = Ville(id_pays=1, nom_ville='Marseille')
    session.add_all([city1, city2])
    session.commit()

    conference = Conference(
        id_serie=1,
        id_ville=1,
        id_organisateur=1,
        id_editeur=1,
        id_conference_du_workshop=None,
        intitule='Conference1',
        date_debut=date.today(),
        date_fin=date.today(),
        texte_introductif='Introduction for Conference1'
    )
    session.add(conference)
    session.commit()

    category_submission = CategorieSoumission(
        id_conference=1,
        nom_categorie='Category1',
        nombre_maxi_pages=10,
        font='Arial',
        font_size=12,
        type_logiciel='Word',
        date_soumission=date.today(),
        date_notification_acceptation=date.today(),
        date_limite_envoi_version_corrigee=date.today()
    )
    session.add(category_submission)
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
