INSERT INTO pays (nom) VALUES
    ('France'), ('Allemagne'), ('États-Unis'),
    ('Canada'), ('Japon'), ('Australie');

INSERT INTO utilisateur (nom, prenom, email, password_hash, password_salt, user_role) VALUES
    ('John', 'Doe', 'john.doe@example.com', 'hash123', 'salt123', 'user'),
    ('Jane', 'Doe', 'jane.doe@example.com', 'hash456', 'salt456', 'user'),
    ('Walter', 'White', 'admin@admin.com', '$2b$12$rhbqFlH659WMx.ImtCN1OOuULA3Dhg2ji9tmSBb492e8L1wV0lb6q', 'salt456', 'admin');

INSERT INTO editeur_conference (nom) VALUES
    ('EditeurPro'), ('LetsEdit'), ('EditFo'), ('Editeur_4');

INSERT INTO serie (nom) VALUES
    ('Serie_1'), ('Serie_2'), ('Serie_3'), ('Serie_4'), ('Serie_5');

INSERT INTO organisateur (nom, adresse, email) VALUES
    ('BigOrg', '4 rue bigorg', 'bigorg@bigorg.com'),
    ('Organizer2', '1 rue Paris', 'organizer2@example.com'),
    ('OrgMaster', '19 rue du Maitre Co', 'eventmaster@example.com'),
    ('ConferencePro', '7 rue du Pro', 'conferencepro@example.com');

INSERT INTO theme (nom) VALUES
    ('Fusion Collaborative'),
    ('Sommet de Synergie Mondiale'),
    ('Forum des Horizons Futurs'),
    ('Exposition sur les Connaissances'),
    ('Confluence de Découverte Technologique');

INSERT INTO type_responsabilite (nom) VALUES
    ('Organisateur'), ('Secretaire');

INSERT INTO responsable (adresse_pro, id_utilisateur, id_type_responsabilite) VALUES
    ('secretaire@pro.com', 1, 2),
    ('secretaire2@pro.com', 3, 1);

INSERT INTO lien_utilisateur_theme (id_utilisateur, id_theme) VALUES
    (1, 1),
    (2, 1),
    (2, 3),
    (3, 5);

INSERT INTO ville (id_pays, nom_ville) VALUES
    (1, 'Paris'), (1, 'Marseille'),
    (2, 'Berlin'), (2, 'Munich'),
    (3, 'New York'), (3, 'San Francisco'),
    (4, 'Toronto'), (4, 'Vancouver'),
    (5, 'Tokyo'), (5, 'Osaka'),
    (6, 'Sydney'), (6, 'Melbourne');

INSERT INTO conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, intitule, date_debut, date_fin, texte_introductif, image_url) VALUES
    (1, 1, 1, 1, NULL, 'Conference discussion sur le workshop', '2023-01-04 16:41:24', '2023-01-04 18:41:24', 'Introduction for Conference1', 'https://admin.live.ilo.org/sites/default/files/2023-06/52951700532_df0e3916d9_k.jpg'),
    (2, 3, 2, 3, 1, 'Workshop', '2022-01-04 16:41:24', '2022-01-04 18:41:24', 'Aller on discute', 'https://admin.live.ilo.org/sites/default/files/2023-06/52951700532_df0e3916d9_k.jpg');

INSERT INTO categorie_soumission (id_conference, nom_categorie, nombre_maxi_pages, font, font_size, type_logiciel, date_soumission, date_notification_acceptation, date_limite_envoi_version_corrigee) VALUES
    (1, 'Category1', 10, 'Arial', 12, 'Word', '2023-01-04 16:41:24', CURRENT_DATE, '2014-01-04 16:41:24'),
    (1, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-02-15 10:30:00', CURRENT_DATE, '2014-02-28 18:00:00'),
    (1, 'Panel', 8, 'Helvetica', 10, 'PowerPoint', '2023-02-20 12:45:00', CURRENT_DATE, '2014-03-05 15:30:00'),
    (2, 'Tutorial', 15, 'Courier New', 16, 'Markdown', '2023-03-10 08:00:00', CURRENT_DATE, '2014-04-01 20:00:00'),
    (2, 'workshop', 15, 'Courier New', 14, 'Markdown', '2023-03-10 08:00:00', CURRENT_DATE, '2014-04-01 20:00:00');

INSERT INTO session (intitule, id_conference) VALUES
    ('Session1', 1),
    ('Session2', 1);

INSERT INTO lien_conference_responsable (id_conference, id_responsable) VALUES
    (1, 1);

INSERT INTO lien_session_responsable (id_session, id_responsable) VALUES
    (1, 1);

INSERT INTO lien_session_theme (id_session, id_theme) VALUES
    (1, 1);
