from sqlalchemy import create_engine, Column, Integer, String, Date, ForeignKey
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship

Base = declarative_base()


class Pays(Base):
    __tablename__ = 'pays'
    id_pays = Column(Integer, primary_key=True, autoincrement=True)
    nom = Column(String(50))


class Utilisateur(Base):
    __tablename__ = 'utilisateur'
    id_utilisateur = Column(Integer, primary_key=True, autoincrement=True)
    nom = Column(String(50))
    prenom = Column(String(50))
    email = Column(String(100), unique=True)
    password_hash = Column(String(128))
    password_salt = Column(String(50))
    user_role = Column(String(24))  # user, admin


class EditeurConference(Base):
    __tablename__ = 'editeur_conference'
    id_editeur_conference = Column(
        Integer, primary_key=True, autoincrement=True)
    nom = Column(String(50))


class Serie(Base):
    __tablename__ = 'serie'
    id_serie = Column(Integer, primary_key=True, autoincrement=True)
    nom = Column(String(50))


class Organisateur(Base):
    __tablename__ = 'organisateur'
    id_organisateur = Column(Integer, primary_key=True, autoincrement=True)
    nom = Column(String(50))
    adresse = Column(String(100))
    email = Column(String(100))


class Theme(Base):
    __tablename__ = 'theme'
    id_theme = Column(Integer, primary_key=True, autoincrement=True)
    nom = Column(String(50))


class TypeResponsabilite(Base):
    __tablename__ = 'type_responsabilite'
    id_type_responsabilite = Column(
        Integer, primary_key=True, autoincrement=True)
    nom = Column(String(50))


class Responsable(Base):
    __tablename__ = 'responsable'
    id_responsable = Column(Integer, primary_key=True, autoincrement=True)
    adresse_pro = Column(String(100))
    id_utilisateur = Column(Integer, ForeignKey(
        'utilisateur.id_utilisateur'))
    id_type_responsabilite = Column(Integer, ForeignKey(
        'type_responsabilite.id_type_responsabilite'))
    utilisateur = relationship('Utilisateur')
    type_responsabilite = relationship('TypeResponsabilite')


class LienUtilisateurTheme(Base):
    __tablename__ = 'lien_utilisateur_theme'
    id_utilisateur = Column(Integer, ForeignKey(
        'utilisateur.id_utilisateur'), primary_key=True)
    id_theme = Column(Integer, ForeignKey('theme.id_theme'), primary_key=True)
    utilisateur = relationship('Utilisateur')
    theme = relationship('Theme')


class Ville(Base):
    __tablename__ = 'ville'
    id_ville = Column(Integer, primary_key=True, autoincrement=True)
    id_pays = Column(Integer, ForeignKey('pays.id_pays'))
    nom_ville = Column(String(255))
    pays = relationship('Pays')


class Conference(Base):
    __tablename__ = 'conference'
    id_conference = Column(Integer, primary_key=True, autoincrement=True)
    id_serie = Column(Integer, ForeignKey('serie.id_serie'))
    id_ville = Column(Integer, ForeignKey('ville.id_ville'))
    id_organisateur = Column(Integer, ForeignKey(
        'organisateur.id_organisateur'))
    id_editeur = Column(Integer, ForeignKey(
        'editeur_conference.id_editeur_conference'))
    id_conference_du_workshop = Column(
        Integer, ForeignKey('conference.id_conference'))
    intitule = Column(String(100))
    date_debut = Column(Date)
    date_fin = Column(Date)
    texte_introductif = Column(String(2000))

    serie = relationship('Serie')
    ville = relationship('Ville')
    organisateur = relationship('Organisateur')
    editeur_conference = relationship('EditeurConference')
    conference_du_workshop = relationship('Conference')


class CategorieSoumission(Base):
    __tablename__ = 'categorie_soumission'
    id_categorie_soumission = Column(
        Integer, primary_key=True, autoincrement=True)
    id_conference = Column(Integer, ForeignKey('conference.id_conference'))
    nom_categorie = Column(String(25))
    nombre_maxi_pages = Column(Integer)
    font = Column(String(50))
    font_size = Column(Integer)
    type_logiciel = Column(String(50))
    date_soumission = Column(Date)
    date_notification_acceptation = Column(Date)
    date_limite_envoi_version_corrigee = Column(Date)

    conference = relationship('Conference')


class Session(Base):
    __tablename__ = 'session'
    id_session = Column(Integer, primary_key=True, autoincrement=True)
    intitule = Column(String(100))
    id_conference = Column(Integer, ForeignKey('conference.id_conference'))
    conference = relationship('Conference')


class LienConferenceResponsable(Base):
    __tablename__ = 'lien_conference_responsable'
    id_conference = Column(Integer, ForeignKey(
        'conference.id_conference'), primary_key=True)
    id_responsable = Column(Integer, ForeignKey(
        'responsable.id_responsable'), primary_key=True)
    conference = relationship('Conference')
    responsable = relationship('Responsable')


class LienSessionResponsable(Base):
    __tablename__ = 'lien_session_responsable'
    id_session = Column(Integer, ForeignKey(
        'session.id_session'), primary_key=True)
    id_responsable = Column(Integer, ForeignKey(
        'responsable.id_responsable'), primary_key=True)
    session = relationship('Session')
    responsable = relationship('Responsable')


class LienSessionTheme(Base):
    __tablename__ = 'lien_session_theme'
    id_session = Column(Integer, ForeignKey(
        'session.id_session'), primary_key=True)
    id_theme = Column(Integer, ForeignKey('theme.id_theme'), primary_key=True)
    session = relationship('Session')
    theme = relationship('Theme')
