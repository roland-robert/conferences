CREATE TABLE pays (
    id_pays SERIAL PRIMARY KEY,
    nom VARCHAR(50)
);

CREATE TABLE utilisateur (
    id_utilisateur SERIAL PRIMARY KEY,
    nom VARCHAR(50),
    prenom VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    password_hash VARCHAR(128),
    password_salt VARCHAR(50),
    user_role VARCHAR(24)
);

CREATE TABLE editeur_conference (
    id_editeur_conference SERIAL PRIMARY KEY,
    nom VARCHAR(50)
);

CREATE TABLE serie (
    id_serie SERIAL PRIMARY KEY,
    nom VARCHAR(50)
);

CREATE TABLE organisateur (
    id_organisateur SERIAL PRIMARY KEY,
    nom VARCHAR(50),
    adresse VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE theme (
    id_theme SERIAL PRIMARY KEY,
    nom VARCHAR(50)
);

CREATE TABLE type_responsabilite (
    id_type_responsabilite SERIAL PRIMARY KEY,
    nom VARCHAR(50)
);

CREATE TABLE responsable (
    id_responsable SERIAL PRIMARY KEY,
    adresse_pro VARCHAR(100),
    id_utilisateur INTEGER REFERENCES utilisateur(id_utilisateur),
    id_type_responsabilite INTEGER REFERENCES type_responsabilite(id_type_responsabilite)
);

CREATE TABLE lien_utilisateur_theme (
    id_utilisateur INTEGER REFERENCES utilisateur(id_utilisateur),
    id_theme INTEGER REFERENCES theme(id_theme),
    PRIMARY KEY (id_utilisateur, id_theme)
);

CREATE TABLE ville (
    id_ville SERIAL PRIMARY KEY,
    id_pays INTEGER REFERENCES pays(id_pays),
    nom_ville VARCHAR(255)
);

CREATE TABLE conference (
    id_conference SERIAL PRIMARY KEY,
    id_serie INTEGER REFERENCES serie(id_serie),
    id_ville INTEGER REFERENCES ville(id_ville),
    id_organisateur INTEGER REFERENCES organisateur(id_organisateur),
    id_editeur INTEGER REFERENCES editeur_conference(id_editeur_conference),
    id_conference_du_workshop INTEGER REFERENCES conference(id_conference),
    id_utilisateur INTEGER REFERENCES utilisateur(id_utilisateur),
    intitule VARCHAR(100),
    date_debut DATE,
    date_fin DATE,
    texte_introductif VARCHAR(2000),
    image_url VARCHAR,
    FOREIGN KEY (id_conference_du_workshop) REFERENCES conference(id_conference)
);

CREATE TABLE categorie_soumission (
    id_categorie_soumission SERIAL PRIMARY KEY,
    id_conference INTEGER REFERENCES conference(id_conference),
    nom_categorie VARCHAR(25),
    nombre_maxi_pages INTEGER,
    font VARCHAR(50),
    font_size INTEGER,
    type_logiciel VARCHAR(50),
    date_soumission DATE,
    date_notification_acceptation DATE,
    date_limite_envoi_version_corrigee DATE,
    FOREIGN KEY (id_conference) REFERENCES conference(id_conference)
);

CREATE TABLE session (
    id_session SERIAL PRIMARY KEY,
    intitule VARCHAR(100),
    id_conference INTEGER REFERENCES conference(id_conference)
);

CREATE TABLE lien_conference_responsable (
    id_conference INTEGER REFERENCES conference(id_conference),
    id_responsable INTEGER REFERENCES responsable(id_responsable),
    PRIMARY KEY (id_conference, id_responsable)
);

CREATE TABLE lien_session_responsable (
    id_session INTEGER REFERENCES session(id_session),
    id_responsable INTEGER REFERENCES responsable(id_responsable),
    PRIMARY KEY (id_session, id_responsable)
);

CREATE TABLE lien_session_theme (
    id_session INTEGER REFERENCES session(id_session),
    id_theme INTEGER REFERENCES theme(id_theme),
    PRIMARY KEY (id_session, id_theme)
);
