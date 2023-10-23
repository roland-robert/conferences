INSERT INTO PAYS (nom) VALUES ('Allemagne');
INSERT INTO PAYS (nom) VALUES ('Canada');

INSERT INTO UTILISATEUR (nom, prenom, email, password_hash, password_salt)
VALUES ('Martin', 'Sophie', 'sophie.m@example.com', 'hash789', 'salt789');
INSERT INTO UTILISATEUR (nom, prenom, email, password_hash, password_salt)
VALUES ('Lefebvre', 'Pierre', 'pierre.l@example.com', 'hash101', 'salt101');

INSERT INTO EDITEUR_CONFERENCE (nom) VALUES ('Elsevier');
INSERT INTO EDITEUR_CONFERENCE (nom) VALUES ('ACM Publications');

INSERT INTO SERIE (nom) VALUES ('Série de conférences C');
INSERT INTO SERIE (nom) VALUES ('Série de conférences D');

INSERT INTO ORGANISATEUR (nom, adresse, email)
VALUES ('ACM', '123 Rue des Sciences, Paris', 'acm.paris@example.com');
INSERT INTO ORGANISATEUR (nom, adresse, email)
VALUES ('IEEE', '456 Rue des Technologies, Montréal', 'ieee.montreal@example.com');

INSERT INTO THEME (nom) VALUES ('Intelligence Artificielle');
INSERT INTO THEME (nom) VALUES ('Systèmes Embarqués');

INSERT INTO TYPE_RESPONSABILITE (nom) VALUES ('Vice-Président');
INSERT INTO TYPE_RESPONSABILITE (nom) VALUES ('Secrétaire');

INSERT INTO RESPONSABLE (prenom, nom, adresse_pro, adresse_email, id_type_responsabilite)
VALUES ('Jean', 'Dupont', '789 Rue des Affaires', 'jean.d@example.com', 1);
INSERT INTO RESPONSABLE (prenom, nom, adresse_pro, adresse_email, id_type_responsabilite)
VALUES ('Marie', 'Leblanc', '101 Rue des Sciences', 'marie.l@example.com', 1);

INSERT INTO LIEN_UTILISATEUR_THEME (id_utilisateur, id_theme)
VALUES (1, 1);
INSERT INTO LIEN_UTILISATEUR_THEME (id_utilisateur, id_theme)
VALUES (2, 2);

INSERT INTO VILLE (id_pays, nom_ville)
VALUES (2, 'TORONTO');
INSERT INTO VILLE (id_pays, nom_ville)
VALUES (1, 'Berlin');

INSERT INTO CONFERENCE (id_serie, id_ville, id_organisateur, id_editeur, intitule, date_fin, texte_introductif, id_conference_du_workshop)
VALUES (2, 2, 2, 2, 'Conférence 2024', '2024-11-15', 'Ceci est une autre conférence exemple.', NULL);

INSERT INTO CATEGORIE_SOUMISSION (id_conference, nom_categorie, nombre_maxi_pages, font, font_size, type_logiciel, date_soumission, date_notification_acceptation, date_limite_envoi_version_corrigee)
VALUES (1, 'Article', 12, 'Times New Roman', 11, 'LaTeX', '2024-10-01', '2024-10-30', '2024-11-30');

INSERT INTO SESSION (intitule, id_conference)
VALUES ('Session 2', 1);

INSERT INTO LIEN_CONFERENCE_RESPONSABLE (id_conference, id_responsable)
VALUES (1, 2);

INSERT INTO LIEN_SESSION_RESPONSABLE (id_session, id_responsable)
VALUES (1, 1);

INSERT INTO LIEN_SESSION_THEME (id_session, id_theme)
VALUES (1, 2);
