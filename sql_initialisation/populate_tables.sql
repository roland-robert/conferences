INSERT INTO pays (nom) VALUES
    ('France'), ('Allemagne'), ('États-Unis'),
    ('Canada'), ('Japon'), ('Australie');

INSERT INTO utilisateur (nom, prenom, email, password_hash, password_salt, user_role) VALUES
    ('John', 'Doe', 'john.doe@example.com', 'hash123', 'salt123', 'user'),
    ('Jane', 'Doe', 'jane.doe@example.com', 'hash456', 'salt456', 'user'),
    ('Walter', 'White', 'admin@admin.com', '$2b$12$rhbqFlH659WMx.ImtCN1OOuULA3Dhg2ji9tmSBb492e8L1wV0lb6q', 'salt456', 'admin'),
    ('Jean', 'Dupont', 'jdp@example.com', 'hash123', 'salt123', 'user'),
    ('Jeanne', 'Dupont', 'jeannedp@example.com', 'hash456', 'salt456', 'user');

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
    ('Astronomie'), ('Nature'), ('Politique'), ('Economie'), ('Informatique'), ('Mathematiques'), ('Physique'), ('Chimie'), ('Biologie'), ('Histoire'), ('Geographie'), ('Litterature'), ('Philosophie'), ('Psychologie'), ('Medecine'), ('Droit'), ('Langues'), ('Musique'), ('Art'), ('Cinema'), ('Theatre'), ('Danse'), ('Cuisine'), ('Mode'), ('Religion'), ('Voyage'), ('Jardinage'), ('Bricolage'), ('Animaux'), ('Jeux'), ('Environnement'), ('Ecologie'), ('Militaire'), ('Agriculture'), ('Architecture'), ('Automobile'), ('Manga'), ('BD'), ('Comics'), ('Jeux video'), ('Maison'), ('Famille'), ('Beaute'), ('Sante'), ('Vie pratique'), ('Loisirs'), ('Culture'), ('Education'), ('Enseignement'), ('Emploi'), ('Entreprise'), ('Immobilier'), ('Internet'), ('Marketing'), ('Presse'), ('Publicite'), ('Restauration'), ('Spectacle'), ('Vente'), ('Commerce'), ('Communication'), ('Diplomatie'), ('Finance'), ('Gestion'), ('Lettres'), ('Sociologie'), ('Theologie'), ('Tourisme'), ('Transport'), ('Sciences'), ('Peinture'), ('Photographie'), ('Sculpture'), ('Sport');
    

INSERT INTO type_responsabilite (nom) VALUES
    ('Program Commitee Chair'), ('Steering Commitee'), ('General Chair'), ('Program Commitee Member'), ('Organizing Commitee'), ('Program Commitee'), ('Poster Chair'), ('Industrial Session Chair');

INSERT INTO responsable (adresse_pro, id_utilisateur, id_type_responsabilite) VALUES
    ('adressepro1@pro.com', 1, 1),
    ('adressepro2@pro.com', 2, 2),
    ('adressepro3@pro.com', 3, 3),
    ('adressepro4@pro.com', 4, 4),
    ('adressepro5@pro.com', 5, 5);


INSERT INTO lien_utilisateur_theme (id_utilisateur, id_theme) VALUES
    (1, 1), (1, 11), (1,21), (1,31), (1,41),
    (2, 2), (2, 12), (2,22), (2,32), (2,42),
    (3, 3), (3, 13), (3,23), (3,33), (3,43),
    (4, 4), (4, 14), (4,24), (4,34), (4,44),
    (5, 5), (5, 15), (5,25), (5,35), (5,45);

INSERT INTO ville (id_pays, nom_ville) VALUES
    (1, 'Paris'), (1, 'Marseille'), (1, 'Lyon'), (1, 'Toulouse'), (1, 'Nice'), (1, 'Nantes'), (1, 'Montpellier'), (1, 'Strasbourg'), (1, 'Bordeaux'), (1, 'Lille'), (1, 'Rennes'), (1, 'Reims'), (1, 'Saint-Étienne'), (1, 'Toulon'), (1, 'Le Havre'), (1, 'Grenoble'), (1, 'Dijon'), (1, 'Angers'), (1, 'Nîmes'), (1, 'Villeurbanne'), (1, 'Saint-Denis'), (1, 'Le Mans'), (1, 'Aix-en-Provence'), (1, 'Clermont-Ferrand'), (1, 'Brest'), (1, 'Limoges'), (1, 'Tours'), (1, 'Amiens'), (1, 'Perpignan'), (1, 'Metz'), (1, 'Besançon'), (1, 'Boulogne-Billancourt'), (1, 'Orléans'), (1, 'Mulhouse'), (1, 'Rouen'), (1, 'Saint-Denis'), (1, 'Caen'), (1, 'Nancy'),
    (2, 'Berlin'), (2, 'Munich'), (2, 'Francfort-sur-le-Main'), (2, 'Hambourg'), (2, 'Stuttgart'), (2, 'Düsseldorf'), (2, 'Dortmund'), (2, 'Essen'), (2, 'Leipzig'), (2, 'Breme'), (2, 'Dresde'), (2, 'Hanovre'), (2, 'Nuremberg'), (2, 'Duisbourg'), (2, 'Bochum'), (2, 'Wuppertal'), (2, 'Bielefeld'), (2, 'Bonn'), (2, 'Münster'), (2, 'Karlsruhe'), (2, 'Mannheim'), (2, 'Augsbourg'), (2, 'Wiesbaden'), (2, 'Gelsenkirchen'), (2, 'Mönchengladbach'), (2, 'Braunschweig'), (2, 'Chemnitz'), (2, 'Kiel'), (2, 'Aix-la-Chapelle'), (2, 'Krefeld'), (2, 'Halle'), (2, 'Magdebourg'), (2, 'Fribourg-en-Brisgau'), (2, 'Krefeld'), (2, 'Mayence'), (2, 'Lübeck'), 
    (3, 'New York'), (3, 'San Francisco'), (3, 'Los Angeles'), (3, 'Chicago'), (3, 'Houston'), (3, 'Phoenix'), (3, 'Philadelphia'), (3, 'San Antonio'), (3, 'San Diego'), (3, 'Dallas'), (3, 'San Jose'), (3, 'Austin'), (3, 'Jacksonville'), (3, 'Fort Worth'), (3, 'Columbus'), (3, 'Charlotte'), (3, 'Indianapolis'), (3, 'San Francisco'), (3, 'Seattle'), (3, 'Denver'), (3, 'Washington'), (3, 'Boston'), (3, 'El Paso'), (3, 'Nashville'), (3, 'Detroit'), (3, 'Oklahoma City'), (3, 'Portland'), (3, 'Las Vegas'), (3, 'Memphis'), (3, 'Louisville'), (3, 'Baltimore'), (3, 'Milwaukee'), (3, 'Albuquerque'), (3, 'Tucson'), (3, 'Fresno'), 
    (4, 'Toronto'), (4, 'Vancouver'), (4, 'Montréal'), (4, 'Calgary'), (4, 'Ottawa'), (4, 'Edmonton'), (4, 'Mississauga'), (4, 'Winnipeg'), (4, 'Québec'), (4, 'Hamilton'), (4, 'Brampton'), (4, 'Surrey'), (4, 'Laval'), (4, 'Halifax'), (4, 'London'), (4, 'Markham'), (4, 'Vaughan'), (4, 'Gatineau'), (4, 'Longueuil'), (4, 'Burnaby'), (4, 'Saskatoon'), (4, 'Kitchener'), (4, 'Windsor'), (4, 'Regina'), (4, 'Richmond'), (4, 'Richmond Hill'), (4, 'Oakville'), (4, 'Burlington'), (4, 'Barrie'), (4, 'Oshawa'), (4, 'Sherbrooke'), (4, 'Saguenay'), (4, 'Lévis'), (4, 'Kelowna'), (4, 'Abbotsford'), (4, 'Coquitlam'), (4, 'Trois-Rivières'), 
    (5, 'Tokyo'), (5, 'Osaka'), (5, 'Nagoya'), (5, 'Sapporo'), (5, 'Kobe'), (5, 'Kyoto'), (5, 'Fukuoka'), (5, 'Kawasaki'), (5, 'Saitama'), (5, 'Hiroshima'), (5, 'Yokohama'), (5, 'Sendai'), (5, 'Kitakyushu'), (5, 'Chiba'), (5, 'Sakai'), (5, 'Niigata'), (5, 'Hamamatsu'), (5, 'Shizuoka'), (5, 'Sagamihara'), (5, 'Okayama'), (5, 'Kumamoto'), (5, 'Hachioji'), (5, 'Utsunomiya'), (5, 'Matsuyama'), (5, 'Kanazawa'), (5, 'Kawaguchi'), (5, 'Ichikawa'), (5, 'Urawa'), (5, 'Matsudo'), (5, 'Nishinomiya'), (5, 'Kawagoe'), (5, 'Kurashiki'), (5, 'Asahikawa'), (5, 'Kashiwa'), (5, 'Toyama'), (5, 'Takatsuki'), (5, 'Okazaki'), (5, 'Suita'),
    (6, 'Sydney'), (6, 'Melbourne'), (6, 'Brisbane'), (6, 'Perth'), (6, 'Adelaide'), (6, 'Gold Coast'), (6, 'Newcastle'), (6, 'Canberra'), (6, 'Wollongong'), (6, 'Logan City'), (6, 'Geelong'), (6, 'Hobart'), (6, 'Townsville'), (6, 'Cairns'), (6, 'Toowoomba'), (6, 'Darwin'), (6, 'Rockingham'), (6, 'Launceston'), (6, 'Bendigo'), (6, 'Ballarat'), (6, 'Mandurah'), (6, 'Mackay'), (6, 'Bundaberg'), (6, 'Bunbury'), (6, 'Maitland'), (6, 'Armadale'), (6, 'Rockhampton'), (6, 'Adelaide Hills'), (6, 'South Brisbane'), (6, 'Hervey Bay'), (6, 'Reservoir'), (6, 'Tamworth'), (6, 'Wagga Wagga'), (6, 'Albury'), (6, 'Berwick');

INSERT INTO conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) VALUES
    (1, 1, 1, 1, NULL, 1, 'Conference discussion sur le workshop', '2023-01-04 16:41:24', '2023-01-04 18:41:24', 'Introduction for Conference1', 'https://admin.live.ilo.org/sites/default/files/2023-06/52951700532_df0e3916d9_k.jpg'),
    (2, 6, 2, 3, 1, 1, 'Workshop', '2022-01-04 16:41:24', '2022-01-04 18:41:24', 'Allez on discute', 'https://fastly.picsum.photos/id/613/1000/1000.jpg?hmac=dTp0kxYjZdZv9vdvwZFIGQCxYgjZYwxHVqOFroWZ7Ts'),
    (3, 42, 3, 2, NULL, 1, 'Conference2', '2023-01-04 16:41:24', '2023-01-04 18:41:24', 'Introduction for Conference2', 'https://fastly.picsum.photos/id/14/1000/1000.jpg?hmac=oaPLPwNgk6TJdckR6XJ0nJZ37h4Lrk55bdBa6gHR9Fo'),
    (4, 63, 4, 4, NULL, 2, 'Conference3', '2023-01-04 16:41:24', '2023-01-04 18:41:24', 'Introduction for Conference3', 'https://fastly.picsum.photos/id/875/1000/1000.jpg?hmac=xQk_HfpJGFk_XM0jTD2LbnFJWho25_dBuXxRG8T5ZF4'),
    (5, 89, 1, 1, NULL, 4, 'Conference4', '2023-01-04 16:41:24', '2023-01-04 18:41:24', 'Introduction for Conference4', 'https://fastly.picsum.photos/id/680/1000/1000.jpg?hmac=7jNvLJWmthBj60FeOzA0sefjBtlGhT4IWonkbnzpc9o'),
    (1, 102, 2, 2, NULL, 4, 'Conference5', '2023-01-04 16:41:24', '2023-01-04 18:41:24', 'Introduction for Conference5', 'https://fastly.picsum.photos/id/614/1000/1000.jpg?hmac=7cWdSvP8FffWl4sO7ucrwov4hM-zCkllNvwTLrcGYEM'),
    (2, 124, 3, 3, NULL, 4, 'Conference6', '2023-01-04 16:41:24', '2023-01-04 18:41:24', 'Introduction for Conference6', 'https://fastly.picsum.photos/id/47/1000/1000.jpg?hmac=ghBkBcoiyod7COy0WPzvRkQQ98upvTzfuxR7RsOQL7A'),
    (3, 161, 4, 4, NULL, 4, 'Conference7', '2023-01-04 16:41:24', '2023-01-04 18:41:24', 'Introduction for Conference7', 'https://fastly.picsum.photos/id/307/1000/1000.jpg?hmac=RqjQGed4VG7OLUFXSfVvd7mv3AQhOm6vjkfHb8S1bLA');

INSERT INTO categorie_soumission (id_conference, nom_categorie, nombre_maxi_pages, font, font_size, type_logiciel, date_soumission, date_notification_acceptation, date_limite_envoi_version_corrigee) VALUES
    (1, 'Category1', 10, 'Arial', 12, 'Word', '2023-01-04 16:41:24', CURRENT_DATE, '2014-01-04 16:41:24'),
    (1, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-02-15 10:30:00', CURRENT_DATE, '2014-02-28 18:00:00'),
    (1, 'Panel', 8, 'Helvetica', 10, 'PowerPoint', '2023-02-20 12:45:00', CURRENT_DATE, '2014-03-05 15:30:00'),
    (2, 'Tutorial', 15, 'Courier New', 16, 'Markdown', '2023-03-10 08:00:00', CURRENT_DATE, '2014-04-01 20:00:00'),
    (2, 'Workshop', 15, 'Courier New', 14, 'Markdown', '2023-03-10 08:00:00', CURRENT_DATE, '2014-04-01 20:00:00');

INSERT INTO session (intitule, id_conference) VALUES
    ('Session1', 1), ('Session2', 1), ('Session1', 2), ('Session2', 2), ('Session1', 3), ('Session2', 3), ('Session1', 4), ('Session2', 4), ('Session1', 5), ('Session2', 5), ('Session1', 6), ('Session2', 6), ('Session1', 7), ('Session2', 7), ('Session1', 8), ('Session2', 8);
    

INSERT INTO lien_conference_responsable (id_conference, id_responsable) VALUES
    (1, 1), 
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 2),
    (7, 5),
    (8, 1);

INSERT INTO lien_session_responsable (id_session, id_responsable) VALUES
    (1, 1), (1, 4), (1, 5),
    (2, 2), (2, 3), (2, 4), (2, 5),
    (3, 3), (3, 5),
    (4, 3), (4, 4), (4, 5),
    (5, 1), (5, 5),
    (6, 2), (6, 4), (6, 5),
    (7, 1), (7, 2), (7, 5),
    (8, 1), (8, 2),
    (9, 1), (9, 2),
    (10, 5),
    (11, 3), (11, 4), (11, 5),
    (12, 2), (12, 5),
    (13, 1), (13, 4), (13, 5),
    (14, 3), (14, 4),
    (15, 1), (15, 4), (15, 5),
    (16, 3), (16, 5);

INSERT INTO lien_session_theme (id_session, id_theme) VALUES
    (1, 1), (1, 11), (1,21), (1,31), (1,41),
    (2, 2), (2, 12), (2,22), (2,32), (2,42),
    (3, 3), (3, 13), (3,23), (3,33), (3,43),
    (4, 4), (4, 14), (4,24), (4,34), (4,44),
    (5, 5), (5, 15), (5,25), (5,35), (5,45),
    (6, 6), (6, 16), (6,26), (6,36), (6,46),
    (7, 7), (7, 17), (7,27), (7,37), (7,47),
    (8, 8), (8, 18), (8,28), (8,38), (8,48),
    (9, 9), (9, 19), (9,29), (9,39), (9,49),
    (10, 10), (10, 20), (10,30), (10,40), (10,50),
    (11, 11), (11, 21), (11,31), (11,41), (11,51),
    (12, 12), (12, 22), (12,32), (12,42), (12,52),
    (13, 13), (13, 23), (13,33), (13,43), (13,53),
    (14, 14), (14, 24), (14,34), (14,44), (14,54),
    (15, 15), (15, 25), (15,35), (15,45), (15,55),
    (16, 16), (16, 26), (16,36), (16,46), (16,56);
    

