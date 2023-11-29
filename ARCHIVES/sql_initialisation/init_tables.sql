CREATE TABLE PAYS (
    id_pays SERIAL PRIMARY KEY,
    nom VARCHAR(50)
);
CREATE TABLE UTILISATEUR (
    id_utilisateur SERIAL PRIMARY KEY,
    nom VARCHAR(50),
    prenom VARCHAR(50),
    email VARCHAR(100),
    password_hash VARCHAR(128),
    password_salt VARCHAR(50),
    user_role VARCHAR(24)
);

CREATE TABLE EDITEUR_CONFERENCE (
    id_editeur_conference SERIAL PRIMARY KEY,
    nom VARCHAR(50)
);
CREATE TABLE SERIE (
    id_serie SERIAL PRIMARY KEY,
    nom VARCHAR(50)
);
CREATE TABLE ORGANISATEUR (
    id_organisateur SERIAL PRIMARY KEY,
    nom VARCHAR(50),
    adresse VARCHAR(100),
    email VARCHAR(100)
);
CREATE TABLE THEME (
    id_theme SERIAL PRIMARY KEY,
    nom VARCHAR(50)
);
CREATE TABLE TYPE_RESPONSABILITE (
    id_type_responsabilite SERIAL PRIMARY KEY,
    nom VARCHAR(50)
);

CREATE TABLE RESPONSABLE (
    id_responsable SERIAL PRIMARY KEY,
    id_utilisateur INTEGER,
    adresse_pro VARCHAR(100),
    id_type_responsabilite INTEGER,
    FOREIGN KEY (id_utilisateur) REFERENCES UTILISATEUR(id_utilisateur),
    FOREIGN KEY (id_type_responsabilite) REFERENCES TYPE_RESPONSABILITE(id_type_responsabilite)
);
CREATE TABLE LIEN_UTILISATEUR_THEME (
    id_utilisateur INTEGER,
    id_theme INTEGER,
    PRIMARY KEY (id_utilisateur, id_theme),
    FOREIGN KEY (id_utilisateur) REFERENCES UTILISATEUR(id_utilisateur),
    FOREIGN KEY (id_theme) REFERENCES THEME(id_theme)
);
CREATE TABLE VILLE (
    id_ville SERIAL PRIMARY KEY,
    id_pays INTEGER,
    nom_ville VARCHAR(255),
    FOREIGN KEY (id_pays) REFERENCES PAYS(id_pays)
);


CREATE TABLE CONFERENCE (
    id_conference SERIAL PRIMARY KEY,
    id_serie INTEGER,
    id_ville INTEGER,
    id_organisateur INTEGER,
    id_editeur INTEGER,
    id_conference_du_workshop INTEGER,
    intitule VARCHAR(100),
    date_debut DATE,
    date_fin DATE,
    texte_introductif VARCHAR(2000),
    FOREIGN KEY (id_serie) REFERENCES SERIE(id_serie),
    FOREIGN KEY (id_ville) REFERENCES VILLE(id_ville),
    FOREIGN KEY (id_organisateur) REFERENCES ORGANISATEUR(id_organisateur),
    FOREIGN KEY (id_editeur) REFERENCES EDITEUR_CONFERENCE(id_editeur_conference),
    FOREIGN KEY (id_conference_du_workshop) REFERENCES CONFERENCE(id_conference)
);
CREATE TABLE CATEGORIE_SOUMISSION (
    id_categorie_soumission SERIAL PRIMARY KEY,
    id_conference INTEGER,
    nom_categorie VARCHAR(25),
    nombre_maxi_pages INTEGER,
    font VARCHAR(50),
    font_size INTEGER,
    type_logiciel VARCHAR(50),
    date_soumission DATE,
    date_notification_acceptation DATE,
    date_limite_envoi_version_corrigee DATE,
    FOREIGN KEY (id_conference) REFERENCES CONFERENCE(id_conference)
);



CREATE TABLE SESSION (
    id_session SERIAL PRIMARY KEY,
    intitule VARCHAR(100),
    id_conference INTEGER,
    FOREIGN KEY (id_conference) REFERENCES CONFERENCE(id_conference)
);
CREATE TABLE LIEN_CONFERENCE_RESPONSABLE (
    id_conference INTEGER,
    id_responsable INTEGER,
    PRIMARY KEY (id_conference, id_responsable),
    FOREIGN KEY (id_conference) REFERENCES CONFERENCE(id_conference),
    FOREIGN KEY (id_responsable) REFERENCES RESPONSABLE(id_responsable)
);



CREATE TABLE LIEN_SESSION_RESPONSABLE (
    id_session INTEGER,
    id_responsable INTEGER,
    PRIMARY KEY (id_session, id_responsable),
    FOREIGN KEY (id_session) REFERENCES SESSION(id_session),
    FOREIGN KEY (id_responsable) REFERENCES RESPONSABLE(id_responsable)
);
CREATE TABLE LIEN_SESSION_THEME (
    id_session INTEGER,
    id_theme INTEGER,
    PRIMARY KEY (id_session, id_theme),
    FOREIGN KEY (id_session) REFERENCES SESSION(id_session),
    FOREIGN KEY (id_theme) REFERENCES THEME(id_theme)
);
