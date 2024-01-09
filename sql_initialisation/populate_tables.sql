INSERT INTO pays (nom) VALUES
    ('France'), ('Allemagne'), ('États-Unis'),
    ('Canada'), ('Japon'), ('Australie'),
    ('Brésil'), ('Mexique'), ('Royaume-Uni'),
    ('Italie'), ('Espagne'), ('Chine'),
    ('Inde'), ('Russie'), ('Afrique du Sud');

INSERT INTO utilisateur (prenom, nom, email, password_hash, password_salt, user_role) VALUES
    ('John', 'Doe', 'john.doe@example.com', 'hash123', 'salt123', 'user'),
    ('Jane', 'Doe', 'jane.doe@example.com', 'hash456', 'salt456', 'user'),
    ('Walter', 'White', 'admin@admin.com', '$2b$12$e2fRaFTVakhTPsPBvKY2r.PPeaU9TR7FrW17K8rOmSoi0LXxPg5JS', 'salt456', 'admin'),
    ('Jean', 'Dupont', 'jdp@example.com', 'hash123', 'salt123', 'user'),
    ('Jeanne', 'Dupont', 'jeannedp@example.com', 'hash456', 'salt456', 'user'),
    ('Alice', 'Martin', 'alice.martin@example.com', 'hash789', 'salt789', 'user'),
    ('Bob', 'Johnson', 'bob.johnson@example.com', 'hashabc', 'saltabc', 'user'),
    ('Eva', 'Smith', 'eva.smith@example.com', 'hashdef', 'saltdef', 'user'),
    ('Tom', 'Anderson', 'tom.anderson@example.com', 'hashghi', 'saltghi', 'user'),
    ('Sophie', 'Miller', 'sophie.miller@example.com', 'hashjkl', 'saltjkl', 'user'),
    ('Sam', 'Clark', 'sam.clark@example.com', 'hashmno', 'saltmno', 'user'),
    ('Emma', 'Davis', 'emma.davis@example.com', 'hashpqr', 'saltpqr', 'user'),
    ('James', 'Taylor', 'james.taylor@example.com', 'hashstu', 'saltstu', 'user'),
    ('Olivia', 'Brown', 'olivia.brown@example.com', 'hashvwx', 'saltvwx', 'user'),
    ('Liam', 'Moore', 'liam.moore@example.com', 'hashyz', 'saltyz', 'user'),
    ('Mia', 'Wilson', 'mia.wilson@example.com', 'hash123', 'salt123', 'user'),
    ('Noah', 'Anderson', 'noah.anderson@example.com', 'hash456', 'salt456', 'user'),
    ('Ava', 'Smith', 'ava.smith@example.com', 'hash789', 'salt789', 'user'),
    ('Logan', 'Johnson', 'logan.johnson@example.com', 'hashabc', 'saltabc', 'user'),
    ('Grace', 'Taylor', 'grace.taylor@example.com', 'hashdef', 'saltdef', 'user'),
    ('Lucas', 'Martin', 'lucas.martin@example.com', 'hashghi', 'saltghi', 'user'),
    ('Lily', 'Clark', 'lily.clark@example.com', 'hashjkl', 'saltjkl', 'user'),
    ('Jackson', 'Davis', 'jackson.davis@example.com', 'hashmno', 'saltmno', 'user'),
    ('Chloe', 'Wilson', 'chloe.wilson@example.com', 'hashpqr', 'saltpqr', 'user'),
    ('Benjamin', 'Brown', 'benjamin.brown@example.com', 'hashstu', 'saltstu', 'user'),
    ('Zoe', 'Moore', 'zoe.moore@example.com', 'hashvwx', 'saltvwx', 'user'),
    ('Mason', 'Wilson', 'mason.wilson@example.com', 'hashyz', 'saltyz', 'user'),
    ('Monsieur', 'X', 'monsieur.x@example.com', 'hashxxx', 'saltxxx', 'user');



INSERT INTO editeur_conference (nom) VALUES
    ('EditeurPro'), ('LetsEdit'), ('EditFo'),
    ('ConferencePlus'), ('SmartPublishers'), ('InnoEdits'), ('TechReviewers'),
    ('GlobalEditing'), ('CreativeEdits');

INSERT INTO serie (nom) VALUES
    ('Serie_1'), ('Serie_2'), ('Serie_3'), ('Serie_4'), ('Serie_5'),('SDH');

INSERT INTO organisateur (nom, adresse, email) VALUES
    ('BigOrg', '4 rue bigorg', 'bigorg@bigorg.com'),
    ('Organizer2', '1 rue Paris', 'organizer2@example.com'),
    ('OrgMaster', '19 rue du Maitre Co', 'eventmaster@example.com'),
    ('ConferencePro', '7 rue du Pro', 'conferencepro@example.com'),
    ('OrgXpress', '14 Avenue de la Rencontre', 'orgxpress@example.com'),
    ('MegaEvents', '22 Boulevard des Grandes Conférences', 'megaevents@example.com'),
    ('EliteOrganizers', '10 Rue Prestige', 'eliteorganizers@example.com'),
    ('ProEventPlanners', '27 Avenue des Evénements', 'proeventplanners@example.com'),
    ('MasterMinds', '5 Rue des Organisations', 'masterminds@example.com'),
    ('EventLeaders', '12 Boulevard des Leaders', 'eventleaders@example.com'),
    ('UltimateOrganizing', '18 Rue de l''Ultimatum', 'ultimateorganizing@example.com'),
    ('DynamicEvents', '33 Avenue de la Dynamique', 'dynamicevents@example.com'),
    ('TechEventPros', '9 Rue Technologique', 'techeventpros@example.com'),
    ('GlobalGatherings', '25 Boulevard Global', 'globalgatherings@example.com'),
    ('EpicMeetings', '36 Rue Epic', 'epicmeetings@example.com');




INSERT INTO theme (nom) VALUES
    ('Astronomie'), ('Nature'), ('Politique'), ('Economie'), ('Informatique'), ('Mathematiques'), ('Physique'), ('Chimie'), ('Biologie'), ('Histoire'), ('Geographie'), ('Litterature'), ('Philosophie'), ('Psychologie'), ('Medecine'), ('Droit'), ('Langues'), ('Musique'), ('Art'), ('Cinema'), ('Theatre'), ('Danse'), ('Cuisine'), ('Mode'), ('Religion'), ('Voyage'), ('Jardinage'), ('Bricolage'), ('Animaux'), ('Bases de donnees spatiales'), ('Environnement'), ('Ecologie'), ('Militaire'), ('Agriculture'), ('Architecture'), ('Automobile'), ('Manga'), ('BD'), ('Comics'), ('Jeux video'), ('Maison'), ('Famille'), ('Beaute'), ('Sante'), ('Vie pratique'), ('Loisirs'), ('Culture'), ('Education'), ('Enseignement'), ('Emploi'), ('Entreprise'), ('Immobilier'), ('Internet'), ('Marketing'), ('Presse'), ('Publicite'), ('Restauration'), ('Spectacle'), ('Vente'), ('Commerce'), ('Communication'), ('Diplomatie'), ('Finance'), ('Gestion'), ('Lettres'), ('Sociologie'), ('Theologie'), ('Tourisme'), ('Transport'), ('Sciences'), ('Peinture'), ('Photographie'), ('Sculpture'), ('Sport');
    

INSERT INTO type_responsabilite (nom) VALUES
    ('Program Commitee Chair'), ('Steering Commitee'), ('General Chair'), ('Program Commitee Member'), ('Organizing Commitee'), ('Program Commitee'), ('Poster Chair'), ('Industrial Session Chair');

INSERT INTO responsable (adresse_pro, id_utilisateur, id_type_responsabilite) VALUES
    ('responsable1@pro.com', 1, 1),
    ('responsable2@pro.com', 2, 2),
    ('responsable3@pro.com', 3, 3),
    ('responsable4@pro.com', 4, 4),
    ('responsable5@pro.com', 5, 5),
    ('responsable6@pro.com', 6, 1),
    ('responsable7@pro.com', 7, 2),
    ('responsable8@pro.com', 8, 3),
    ('responsable9@pro.com', 9, 4),
    ('responsable10@pro.com', 10, 5),
    ('responsable11@pro.com', 11, 1),
    ('responsable12@pro.com', 12, 2),
    ('responsable13@pro.com', 13, 3),
    ('responsable14@pro.com', 14, 4),
    ('responsable15@pro.com', 15, 5);


INSERT INTO lien_utilisateur_theme (id_utilisateur, id_theme) VALUES
    (1, 1), (1, 12), (1, 23), (1, 31), (1, 42),
    (2, 2), (2, 14), (2, 25), (2, 32), (2, 44),
    (3, 3), (3, 16), (3, 21), (3, 33), (3, 43),
    (4, 4), (4, 18), (4, 22), (4, 34), (4, 45),
    (5, 5), (5, 20), (5, 26), (5, 35), (5, 41),
    (6, 6), (6, 22), (6, 23), (6, 36), (6, 46),
    (7, 7), (7, 24), (7, 27),
    (8, 8), (8, 26), (8, 28),
    (9, 9), (9, 28), (9, 29),
    (10, 10), (10, 30), (10, 42),
    (11, 15), (11, 5), (11, 35), (11, 45), (11, 25),
    (12, 14), (12, 4), (12, 24), (12, 34), (12, 44),
    (13, 23), (13, 33), (13, 43), (13, 13), (13, 3),
    (14, 12), (14, 22), (14, 32), (14, 42), (14, 2),
    (15, 11), (15, 21), (15, 31), (15, 41), (15, 1),
    (16, 20), (16, 30), (16, 10),
    (17, 17), (17, 27), (17, 7),
    (18, 18), (18, 28), (18, 8),
    (19, 19), (19, 29), (19, 9),
    (20, 16), (20, 26), (20, 6),
    (21, 25), (21, 35), (21, 45),
    (22, 24), (22, 34), (22, 44),
    (23, 23), (23, 33), (23, 43),
    (24, 22), (24, 32), (24, 42),
    (25, 21), (25, 31), (25, 41);


INSERT INTO ville (id_pays, nom_ville) VALUES
    (1, 'Paris'), (1, 'Marseille'), (1, 'Lyon'), (1, 'Toulouse'), (1, 'Nice'), (1, 'Nantes'), (1, 'Montpellier'), (1, 'Strasbourg'), (1, 'Bordeaux'), (1, 'Lille'), (1, 'Rennes'), (1, 'Reims'), (1, 'Saint-Étienne'), (1, 'Toulon'), (1, 'Le Havre'), (1, 'Grenoble'), (1, 'Dijon'), (1, 'Angers'), (1, 'Nîmes'), (1, 'Villeurbanne'), (1, 'Saint-Denis'), (1, 'Le Mans'), (1, 'Aix-en-Provence'), (1, 'Clermont-Ferrand'), (1, 'Brest'), (1, 'Limoges'), (1, 'Tours'), (1, 'Amiens'), (1, 'Perpignan'), (1, 'Metz'), (1, 'Besançon'), (1, 'Boulogne-Billancourt'), (1, 'Orléans'), (1, 'Mulhouse'), (1, 'Rouen'), (1, 'Saint-Denis'), (1, 'Caen'), (1, 'Nancy'),
    (2, 'Berlin'), (2, 'Munich'), (2, 'Francfort-sur-le-Main'), (2, 'Hambourg'), (2, 'Stuttgart'), (2, 'Düsseldorf'), (2, 'Dortmund'), (2, 'Essen'), (2, 'Leipzig'), (2, 'Breme'), (2, 'Dresde'), (2, 'Hanovre'), (2, 'Nuremberg'), (2, 'Duisbourg'), (2, 'Bochum'), (2, 'Wuppertal'), (2, 'Bielefeld'), (2, 'Bonn'), (2, 'Münster'), (2, 'Karlsruhe'), (2, 'Mannheim'), (2, 'Augsbourg'), (2, 'Wiesbaden'), (2, 'Gelsenkirchen'), (2, 'Mönchengladbach'), (2, 'Braunschweig'), (2, 'Chemnitz'), (2, 'Kiel'), (2, 'Aix-la-Chapelle'), (2, 'Krefeld'), (2, 'Halle'), (2, 'Magdebourg'), (2, 'Fribourg-en-Brisgau'), (2, 'Krefeld'), (2, 'Mayence'), (2, 'Lübeck'), 
    (3, 'New York'), (3, 'San Francisco'), (3, 'Los Angeles'), (3, 'Chicago'), (3, 'Houston'), (3, 'Phoenix'), (3, 'Philadelphia'), (3, 'San Antonio'), (3, 'San Diego'), (3, 'Dallas'), (3, 'San Jose'), (3, 'Austin'), (3, 'Jacksonville'), (3, 'Fort Worth'), (3, 'Columbus'), (3, 'Charlotte'), (3, 'Indianapolis'), (3, 'San Francisco'), (3, 'Seattle'), (3, 'Denver'), (3, 'Washington'), (3, 'Boston'), (3, 'El Paso'), (3, 'Nashville'), (3, 'Detroit'), (3, 'Oklahoma City'), (3, 'Portland'), (3, 'Las Vegas'), (3, 'Memphis'), (3, 'Louisville'), (3, 'Baltimore'), (3, 'Milwaukee'), (3, 'Albuquerque'), (3, 'Tucson'), (3, 'Fresno'), 
    (4, 'Toronto'), (4, 'Vancouver'), (4, 'Montréal'), (4, 'Calgary'), (4, 'Ottawa'), (4, 'Edmonton'), (4, 'Mississauga'), (4, 'Winnipeg'), (4, 'Québec'), (4, 'Hamilton'), (4, 'Brampton'), (4, 'Surrey'), (4, 'Laval'), (4, 'Halifax'), (4, 'London'), (4, 'Markham'), (4, 'Vaughan'), (4, 'Gatineau'), (4, 'Longueuil'), (4, 'Burnaby'), (4, 'Saskatoon'), (4, 'Kitchener'), (4, 'Windsor'), (4, 'Regina'), (4, 'Richmond'), (4, 'Richmond Hill'), (4, 'Oakville'), (4, 'Burlington'), (4, 'Barrie'), (4, 'Oshawa'), (4, 'Sherbrooke'), (4, 'Saguenay'), (4, 'Lévis'), (4, 'Kelowna'), (4, 'Abbotsford'), (4, 'Coquitlam'), (4, 'Trois-Rivières'), 
    (5, 'Tokyo'), (5, 'Osaka'), (5, 'Nagoya'), (5, 'Sapporo'), (5, 'Kobe'), (5, 'Kyoto'), (5, 'Fukuoka'), (5, 'Kawasaki'), (5, 'Saitama'), (5, 'Hiroshima'), (5, 'Yokohama'), (5, 'Sendai'), (5, 'Kitakyushu'), (5, 'Chiba'), (5, 'Sakai'), (5, 'Niigata'), (5, 'Hamamatsu'), (5, 'Shizuoka'), (5, 'Sagamihara'), (5, 'Okayama'), (5, 'Kumamoto'), (5, 'Hachioji'), (5, 'Utsunomiya'), (5, 'Matsuyama'), (5, 'Kanazawa'), (5, 'Kawaguchi'), (5, 'Ichikawa'), (5, 'Urawa'), (5, 'Matsudo'), (5, 'Nishinomiya'), (5, 'Kawagoe'), (5, 'Kurashiki'), (5, 'Asahikawa'), (5, 'Kashiwa'), (5, 'Toyama'), (5, 'Takatsuki'), (5, 'Okazaki'), (5, 'Suita'),
    (6, 'Sydney'), (6, 'Melbourne'), (6, 'Brisbane'), (6, 'Perth'), (6, 'Adelaide'), (6, 'Gold Coast'), (6, 'Newcastle'), (6, 'Canberra'), (6, 'Wollongong'), (6, 'Logan City'), (6, 'Geelong'), (6, 'Hobart'), (6, 'Townsville'), (6, 'Cairns'), (6, 'Toowoomba'), (6, 'Darwin'), (6, 'Rockingham'), (6, 'Launceston'), (6, 'Bendigo'), (6, 'Ballarat'), (6, 'Mandurah'), (6, 'Mackay'), (6, 'Bundaberg'), (6, 'Bunbury'), (6, 'Maitland'), (6, 'Armadale'), (6, 'Rockhampton'), (6, 'Adelaide Hills'), (6, 'South Brisbane'), (6, 'Hervey Bay'), (6, 'Reservoir'), (6, 'Tamworth'), (6, 'Wagga Wagga'), (6, 'Albury'), (6, 'Berwick'),
    (7, 'Rio de Janeiro'), (7, 'São Paulo'), (7, 'Brasília'), (7, 'Salvador'), (7, 'Fortaleza'), (7, 'Recife'), (7, 'Belém'), (7, 'Manaus'), (7, 'Curitiba'), (7, 'Porto Alegre'),
    (8, 'Mexico City'), (8, 'Guadalajara'), (8, 'Monterrey'), (8, 'Puebla'), (8, 'Tijuana'), (8, 'Veracruz'), (8, 'Merida'), (8, 'Cancun'), (8, 'Toluca'), (8, 'Acapulco'),
    (9, 'London'), (9, 'Manchester'), (9, 'Birmingham'), (9, 'Glasgow'), (9, 'Liverpool'), (9, 'Edinburgh'), (9, 'Bristol'), (9, 'Leeds'), (9, 'Newcastle upon Tyne'), (9, 'Nottingham'),
    (10, 'Rome'), (10, 'Milan'), (10, 'Naples'), (10, 'Turin'), (10, 'Palermo'), (10, 'Venice'), (10, 'Florence'), (10, 'Bologna'), (10, 'Genoa'), (10, 'Verona'),
    (11, 'Madrid'), (11, 'Barcelona'), (11, 'Valencia'), (11, 'Seville'), (11, 'Zaragoza'), (11, 'Málaga'), (11, 'Murcia'), (11, 'Valladolid'), (11, 'Alicante'), (11, 'Córdoba'),
    (12, 'Beijing'), (12, 'Shanghai'), (12, 'Guangzhou'), (12, 'Shenzhen'), (12, 'Wuhan'), (12, 'Chongqing'), (12, 'Hangzhou'), (12, 'Harbin'), (12, 'Shijiazhuang'), (12, 'Xiamen'),
    (13, 'Mumbai'), (13, 'Delhi'), (13, 'Bangalore'), (13, 'Chennai'), (13, 'Kolkata'), (13, 'Hyderabad'), (13, 'Ahmedabad'), (13, 'Pune'), (13, 'Surat'), (13, 'Jaipur'),
    (14, 'Moscow'), (14, 'Saint Petersburg'), (14, 'Novosibirsk'), (14, 'Yekaterinburg'), (14, 'Kazan'), (14, 'Nizhny Novgorod'), (14, 'Samara'), (14, 'Omsk'), (14, 'Chelyabinsk'), (14, 'Ufa'),
    (15, 'Johannesburg'), (15, 'Cape Town'), (15, 'Durban'), (15, 'Pretoria'), (15, 'Port Elizabeth'), (15, 'Bloemfontein'), (15, 'East London'), (15, 'Pietermaritzburg'), (15, 'Rustenburg'), (15, 'Polokwane');


insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (4, 4, 3, 4, null, 7, 'at turpis donec posuere metus vitae ipsum aliquam non', '7/9/2022', '7/9/2022', 'Aliquam erat volutpat. In congue. Etiam justo.', 'https://admin.live.ilo.org/sites/default/files/2023-06/52951700532_df0e3916d9_k.jpg');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (1, 142, 7, 9, 1, 20, 'sodales sed tincidunt eu felis fusce posuere felis sed', '2/23/2023', '2/25/2023', 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque.', 'https://fastly.picsum.photos/id/307/1000/1000.jpg?hmac=RqjQGed4VG7OLUFXSfVvd7mv3AQhOm6vjkfHb8S1bLA');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (2, 27, 15, 8, null, 15, 'nulla dapibus dolor vel est donec odio justo sollicitudin ut', '7/31/2021', '7/31/2021', 'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio.', 'https://admin.live.ilo.org/sites/default/files/2023-06/52951700532_df0e3916d9_k.jpg');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (3, 120, 7, 8, 3, 11, 'nullam molestie nibh in lectus pellentesque at', '12/28/2021', '12/29/2021', 'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.', 'https://admin.live.ilo.org/sites/default/files/2023-06/52951700532_df0e3916d9_k.jpg');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (4, 246, 10, 7, null, 20, 'habitasse platea dictumst morbi vestibulum velit', '5/12/2024', '5/12/2024', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio.', 'https://fastly.picsum.photos/id/680/1000/1000.jpg?hmac=7jNvLJWmthBj60FeOzA0sefjBtlGhT4IWonkbnzpc9o');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (5, 302, 1, 5, 5, 6, 'volutpat erat quisque erat eros viverra eget congue eget', '12/11/2024', '12/12/2024', 'Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 'https://fastly.picsum.photos/id/680/1000/1000.jpg?hmac=7jNvLJWmthBj60FeOzA0sefjBtlGhT4IWonkbnzpc9o');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (2, 284, 6, 7, null, 10, 'sit amet eleifend pede libero quis', '12/12/2022', '12/13/2022', 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 'https://fastly.picsum.photos/id/613/1000/1000.jpg?hmac=dTp0kxYjZdZv9vdvwZFIGQCxYgjZYwxHVqOFroWZ7Ts');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (4, 174, 3, 4, 7, 24, 'phasellus in felis donec semper sapien a libero nam dui', '3/3/2020', '3/3/2020', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 'https://fastly.picsum.photos/id/614/1000/1000.jpg?hmac=7cWdSvP8FffWl4sO7ucrwov4hM-zCkllNvwTLrcGYEM');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (5, 283, 8, 3, null, 23, 'vehicula condimentum curabitur in libero ut massa', '11/5/2023', '11/5/2023', 'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 'https://fastly.picsum.photos/id/307/1000/1000.jpg?hmac=RqjQGed4VG7OLUFXSfVvd7mv3AQhOm6vjkfHb8S1bLA');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (5, 171, 9, 9, 9, 12, 'libero non mattis pulvinar nulla pede ullamcorper augue', '9/27/2023', '9/28/2023', 'Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat.', 'https://admin.live.ilo.org/sites/default/files/2023-06/52951700532_df0e3916d9_k.jpg');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (5, 100, 9, 5, null, 25, 'donec posuere metus vitae ipsum aliquam non mauris morbi non', '6/19/2022', '6/20/2022', 'Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum.', 'https://fastly.picsum.photos/id/613/1000/1000.jpg?hmac=dTp0kxYjZdZv9vdvwZFIGQCxYgjZYwxHVqOFroWZ7Ts');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (2, 80, 9, 1, null, 13, 'felis ut at dolor quis odio consequat', '6/24/2023', '6/24/2023', 'Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 'https://fastly.picsum.photos/id/614/1000/1000.jpg?hmac=7cWdSvP8FffWl4sO7ucrwov4hM-zCkllNvwTLrcGYEM');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (5, 6, 13, 4, null, 7, 'dui nec nisi volutpat eleifend donec ut', '10/27/2024', '10/28/2024', 'Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 'https://admin.live.ilo.org/sites/default/files/2023-06/52951700532_df0e3916d9_k.jpg');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (2, 302, 4, 3, null, 3, 'justo nec condimentum neque sapien placerat ante', '3/30/2024', '3/31/2024', 'Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo.', 'https://fastly.picsum.photos/id/14/1000/1000.jpg?hmac=oaPLPwNgk6TJdckR6XJ0nJZ37h4Lrk55bdBa6gHR9Fo');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (2, 217, 10, 5, null, 20, 'ac diam cras pellentesque volutpat dui maecenas tristique', '3/13/2022', '3/14/2022', 'Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 'https://fastly.picsum.photos/id/307/1000/1000.jpg?hmac=RqjQGed4VG7OLUFXSfVvd7mv3AQhOm6vjkfHb8S1bLA');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (5, 186, 1, 1, null, 11, 'mattis egestas metus aenean fermentum donec ut mauris', '2/5/2024', '2/6/2024', 'In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst.', 'https://fastly.picsum.photos/id/614/1000/1000.jpg?hmac=7cWdSvP8FffWl4sO7ucrwov4hM-zCkllNvwTLrcGYEM');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (1, 209, 13, 9, null, 26, 'vitae quam suspendisse potenti nullam porttitor lacus at', '6/16/2021', '6/18/2021', 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl.', 'https://fastly.picsum.photos/id/47/1000/1000.jpg?hmac=ghBkBcoiyod7COy0WPzvRkQQ98upvTzfuxR7RsOQL7A');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (1, 85, 11, 9, null, 9, 'in imperdiet et commodo vulputate justo in blandit ultrices enim', '4/27/2023', '4/28/2023', 'Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 'https://fastly.picsum.photos/id/614/1000/1000.jpg?hmac=7cWdSvP8FffWl4sO7ucrwov4hM-zCkllNvwTLrcGYEM');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (3, 130, 13, 1, null, 20, 'vitae nisl aenean lectus pellentesque eget nunc', '1/23/2024', '1/24/2024', 'Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat.', 'https://fastly.picsum.photos/id/47/1000/1000.jpg?hmac=ghBkBcoiyod7COy0WPzvRkQQ98upvTzfuxR7RsOQL7A');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (4, 99, 6, 9, null, 10, 'faucibus orci luctus et ultrices posuere cubilia curae donec pharetra', '9/4/2024', '9/4/2024', 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.', 'https://fastly.picsum.photos/id/47/1000/1000.jpg?hmac=ghBkBcoiyod7COy0WPzvRkQQ98upvTzfuxR7RsOQL7A');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (1, 125, 10, 9, null, 9, 'dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum', '5/27/2023', '5/29/2023', 'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.', 'https://fastly.picsum.photos/id/614/1000/1000.jpg?hmac=7cWdSvP8FffWl4sO7ucrwov4hM-zCkllNvwTLrcGYEM');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (5, 241, 7, 7, null, 24, 'neque libero convallis eget eleifend', '6/3/2020', '6/4/2020', 'Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim.', 'https://fastly.picsum.photos/id/613/1000/1000.jpg?hmac=dTp0kxYjZdZv9vdvwZFIGQCxYgjZYwxHVqOFroWZ7Ts');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (3, 200, 11, 6, null, 8, 'pede justo lacinia eget tincidunt eget tempus vel', '12/22/2021', '12/23/2021', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 'https://fastly.picsum.photos/id/875/1000/1000.jpg?hmac=xQk_HfpJGFk_XM0jTD2LbnFJWho25_dBuXxRG8T5ZF4');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (2, 22, 4, 1, null, 11, 'montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis', '1/22/2022', '1/22/2022', 'Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.', 'https://fastly.picsum.photos/id/14/1000/1000.jpg?hmac=oaPLPwNgk6TJdckR6XJ0nJZ37h4Lrk55bdBa6gHR9Fo');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (5, 95, 4, 2, null, 9, 'eget eros elementum pellentesque quisque porta volutpat erat quisque erat', '1/10/2023', '1/11/2023', 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl.', 'https://fastly.picsum.photos/id/307/1000/1000.jpg?hmac=RqjQGed4VG7OLUFXSfVvd7mv3AQhOm6vjkfHb8S1bLA');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (4, 206, 10, 3, null, 5, 'ac nibh fusce lacus purus aliquet at feugiat non pretium', '1/22/2022', '1/23/2022', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst.', 'https://fastly.picsum.photos/id/680/1000/1000.jpg?hmac=7jNvLJWmthBj60FeOzA0sefjBtlGhT4IWonkbnzpc9o');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (1, 302, 6, 5, null, 27, 'ut suscipit a feugiat et eros vestibulum ac est lacinia', '9/5/2020', '9/6/2020', 'Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 'https://fastly.picsum.photos/id/680/1000/1000.jpg?hmac=7jNvLJWmthBj60FeOzA0sefjBtlGhT4IWonkbnzpc9o');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (3, 26, 4, 4, null, 26, 'libero ut massa volutpat convallis morbi odio odio', '2/27/2021', '2/28/2021', 'Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat.', 'https://fastly.picsum.photos/id/875/1000/1000.jpg?hmac=xQk_HfpJGFk_XM0jTD2LbnFJWho25_dBuXxRG8T5ZF4');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (1, 66, 4, 6, null, 25, 'eget tincidunt eget tempus vel pede morbi porttitor lorem id', '11/3/2020', '11/3/2020', 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 'https://fastly.picsum.photos/id/47/1000/1000.jpg?hmac=ghBkBcoiyod7COy0WPzvRkQQ98upvTzfuxR7RsOQL7A');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (4, 32, 14, 4, null, 26, 'sapien sapien non mi integer', '1/11/2020', '1/11/2020', 'Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna.', 'https://fastly.picsum.photos/id/613/1000/1000.jpg?hmac=dTp0kxYjZdZv9vdvwZFIGQCxYgjZYwxHVqOFroWZ7Ts');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (6, 262, 15, 2, null, 2, 'nulla tempus vivamus in felis eu', '11/6/2024', '11/8/2024', 'Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst.', 'https://fastly.picsum.photos/id/613/1000/1000.jpg?hmac=dTp0kxYjZdZv9vdvwZFIGQCxYgjZYwxHVqOFroWZ7Ts');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (6, 292, 10, 7, null, 19, 'urna pretium nisl ut volutpat', '6/8/2021', '6/10/2021', 'Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti.', 'https://fastly.picsum.photos/id/614/1000/1000.jpg?hmac=7cWdSvP8FffWl4sO7ucrwov4hM-zCkllNvwTLrcGYEM');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (3, 84, 11, 3, null, 8, 'lectus vestibulum quam sapien varius', '7/23/2021', '7/25/2021', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 'https://fastly.picsum.photos/id/613/1000/1000.jpg?hmac=dTp0kxYjZdZv9vdvwZFIGQCxYgjZYwxHVqOFroWZ7Ts');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (4, 180, 10, 3, null, 20, 'interdum eu tincidunt in leo maecenas pulvinar lobortis', '12/9/2024', '12/9/2024', 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 'https://fastly.picsum.photos/id/47/1000/1000.jpg?hmac=ghBkBcoiyod7COy0WPzvRkQQ98upvTzfuxR7RsOQL7A');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (3, 5, 11, 4, null, 18, 'pede lobortis ligula sit amet', '4/3/2021', '4/4/2021', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 'https://admin.live.ilo.org/sites/default/files/2023-06/52951700532_df0e3916d9_k.jpg');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (1, 295, 13, 8, null, 23, 'sed tincidunt eu felis fusce posuere felis sed', '8/21/2023', '8/23/2023', 'Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus.', 'https://fastly.picsum.photos/id/307/1000/1000.jpg?hmac=RqjQGed4VG7OLUFXSfVvd7mv3AQhOm6vjkfHb8S1bLA');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (2, 287, 9, 8, null, 18, 'quam pede lobortis ligula sit amet', '2/5/2022', '2/5/2022', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 'https://admin.live.ilo.org/sites/default/files/2023-06/52951700532_df0e3916d9_k.jpg');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (2, 10, 7, 2, 37, 12, 'nullam sit amet turpis elementum', '9/3/2022', '9/4/2022', 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc.', 'https://fastly.picsum.photos/id/14/1000/1000.jpg?hmac=oaPLPwNgk6TJdckR6XJ0nJZ37h4Lrk55bdBa6gHR9Fo');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (6, 257, 6, 7, null, 6, 'eget semper rutrum nulla nunc purus phasellus in felis', '12/2/2021', '12/2/2021', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 'https://fastly.picsum.photos/id/680/1000/1000.jpg?hmac=7jNvLJWmthBj60FeOzA0sefjBtlGhT4IWonkbnzpc9o');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (2, 114, 3, 4, 39, 7, 'sollicitudin ut suscipit a feugiat et eros vestibulum', '9/25/2020', '9/26/2020', 'Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 'https://fastly.picsum.photos/id/47/1000/1000.jpg?hmac=ghBkBcoiyod7COy0WPzvRkQQ98upvTzfuxR7RsOQL7A');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (5, 98, 5, 1, null, 24, 'in blandit ultrices enim lorem ipsum dolor', '12/5/2024', '12/5/2024', 'Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus.', 'https://fastly.picsum.photos/id/680/1000/1000.jpg?hmac=7jNvLJWmthBj60FeOzA0sefjBtlGhT4IWonkbnzpc9o');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (3, 256, 13, 1, 41, 9, 'mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor', '6/4/2020', '6/5/2020', 'In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 'https://fastly.picsum.photos/id/613/1000/1000.jpg?hmac=dTp0kxYjZdZv9vdvwZFIGQCxYgjZYwxHVqOFroWZ7Ts');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (6, 222, 7, 6, null, 1, 'pede morbi porttitor lorem id ligula suspendisse ornare consequat', '2/25/2023', '2/26/2023', 'Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo.', 'https://fastly.picsum.photos/id/14/1000/1000.jpg?hmac=oaPLPwNgk6TJdckR6XJ0nJZ37h4Lrk55bdBa6gHR9Fo');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (5, 20, 11, 9, 43, 24, 'lacus curabitur at ipsum ac tellus semper interdum', '10/9/2021', '10/10/2021', 'Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio.', 'https://fastly.picsum.photos/id/613/1000/1000.jpg?hmac=dTp0kxYjZdZv9vdvwZFIGQCxYgjZYwxHVqOFroWZ7Ts');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (6, 285, 10, 2, null, 19, 'odio in hac habitasse platea', '10/24/2024', '10/25/2024', 'Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 'https://fastly.picsum.photos/id/47/1000/1000.jpg?hmac=ghBkBcoiyod7COy0WPzvRkQQ98upvTzfuxR7RsOQL7A');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (4, 35, 2, 1, 45, 3, 'luctus et ultrices posuere cubilia', '3/8/2022', '3/10/2022', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.', 'https://admin.live.ilo.org/sites/default/files/2023-06/52951700532_df0e3916d9_k.jpg');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (3, 178, 7, 4, null, 5, 'justo etiam pretium iaculis justo in hac', '7/29/2022', '7/30/2022', 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat.', 'https://fastly.picsum.photos/id/307/1000/1000.jpg?hmac=RqjQGed4VG7OLUFXSfVvd7mv3AQhOm6vjkfHb8S1bLA');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (5, 79, 2, 8, 47, 28, 'est quam pharetra magna ac consequat', '11/5/2022', '11/7/2022', 'Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus.', 'https://fastly.picsum.photos/id/614/1000/1000.jpg?hmac=7cWdSvP8FffWl4sO7ucrwov4hM-zCkllNvwTLrcGYEM');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (2, 105, 15, 9, null, 2, 'nec euismod scelerisque quam turpis adipiscing', '11/30/2023', '12/1/2023', 'Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue.', 'https://fastly.picsum.photos/id/875/1000/1000.jpg?hmac=xQk_HfpJGFk_XM0jTD2LbnFJWho25_dBuXxRG8T5ZF4');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (6, 159, 10, 6, 49, 10, 'ultrices aliquet maecenas leo odio condimentum id luctus', '12/20/2021', '12/21/2021', 'Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum.', 'https://fastly.picsum.photos/id/875/1000/1000.jpg?hmac=xQk_HfpJGFk_XM0jTD2LbnFJWho25_dBuXxRG8T5ZF4');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (5, 261, 12, 1, null, 23, 'pede ac diam cras pellentesque volutpat dui maecenas tristique est', '5/1/2022', '5/2/2022', 'Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.', 'https://fastly.picsum.photos/id/47/1000/1000.jpg?hmac=ghBkBcoiyod7COy0WPzvRkQQ98upvTzfuxR7RsOQL7A');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (3, 109, 11, 9, 51, 2, 'nisi volutpat eleifend donec ut dolor', '3/24/2023', '3/26/2023', 'Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 'https://fastly.picsum.photos/id/14/1000/1000.jpg?hmac=oaPLPwNgk6TJdckR6XJ0nJZ37h4Lrk55bdBa6gHR9Fo');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (6, 92, 8, 5, null, 24, 'dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum', '9/17/2022', '9/18/2022', 'Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 'https://admin.live.ilo.org/sites/default/files/2023-06/52951700532_df0e3916d9_k.jpg');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (3, 233, 12, 2, 53, 3, 'urna ut tellus nulla ut erat', '8/14/2024', '8/15/2024', 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla.', 'https://admin.live.ilo.org/sites/default/files/2023-06/52951700532_df0e3916d9_k.jpg');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (2, 89, 14, 1, null, 13, 'placerat praesent blandit nam nulla', '1/4/2021', '1/5/2021', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend.', 'https://fastly.picsum.photos/id/47/1000/1000.jpg?hmac=ghBkBcoiyod7COy0WPzvRkQQ98upvTzfuxR7RsOQL7A');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (6, 285, 9, 4, 55, 5, 'velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit', '5/22/2022', '5/23/2022', 'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 'https://fastly.picsum.photos/id/14/1000/1000.jpg?hmac=oaPLPwNgk6TJdckR6XJ0nJZ37h4Lrk55bdBa6gHR9Fo');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (2, 105, 15, 3, null, 9, 'fermentum justo nec condimentum neque sapien placerat ante', '12/30/2022', '12/31/2022', 'Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy.', 'https://fastly.picsum.photos/id/680/1000/1000.jpg?hmac=7jNvLJWmthBj60FeOzA0sefjBtlGhT4IWonkbnzpc9o');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (5, 250, 13, 6, 57, 18, 'natoque penatibus et magnis dis', '4/5/2022', '4/7/2022', 'Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque.', 'https://fastly.picsum.photos/id/47/1000/1000.jpg?hmac=ghBkBcoiyod7COy0WPzvRkQQ98upvTzfuxR7RsOQL7A');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (1, 262, 9, 9, null, 14, 'convallis duis consequat dui nec nisi volutpat eleifend donec ut', '9/24/2021', '9/24/2021', 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui.', 'https://admin.live.ilo.org/sites/default/files/2023-06/52951700532_df0e3916d9_k.jpg');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (6, 227, 4, 1, 59, 27, 'pede ullamcorper augue a suscipit nulla elit ac nulla', '2/28/2023', '3/2/2023', 'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam.', 'https://fastly.picsum.photos/id/875/1000/1000.jpg?hmac=xQk_HfpJGFk_XM0jTD2LbnFJWho25_dBuXxRG8T5ZF4');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (2, 146, 15, 1, null, 9, 'quis tortor id nulla ultrices aliquet', '5/3/2022', '5/4/2022', 'Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum.', 'https://fastly.picsum.photos/id/307/1000/1000.jpg?hmac=RqjQGed4VG7OLUFXSfVvd7mv3AQhOm6vjkfHb8S1bLA');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (3, 24, 9, 1, 61, 14, 'dapibus nulla suscipit ligula in lacus curabitur at ipsum', '9/20/2022', '9/21/2022', 'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 'https://fastly.picsum.photos/id/47/1000/1000.jpg?hmac=ghBkBcoiyod7COy0WPzvRkQQ98upvTzfuxR7RsOQL7A');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (1, 210, 6, 4, null, 18, 'mattis odio donec vitae nisi nam ultrices', '5/5/2022', '5/5/2022', 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus.', 'https://fastly.picsum.photos/id/307/1000/1000.jpg?hmac=RqjQGed4VG7OLUFXSfVvd7mv3AQhOm6vjkfHb8S1bLA');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (1, 126, 8, 8, 63, 12, 'neque duis bibendum morbi non quam nec dui luctus', '5/6/2021', '5/6/2021', 'Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.', 'https://fastly.picsum.photos/id/680/1000/1000.jpg?hmac=7jNvLJWmthBj60FeOzA0sefjBtlGhT4IWonkbnzpc9o');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (6, 292, 1, 3, null, 26, 'sodales scelerisque mauris sit amet eros suspendisse accumsan', '5/21/2021', '5/22/2021', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 'https://fastly.picsum.photos/id/307/1000/1000.jpg?hmac=RqjQGed4VG7OLUFXSfVvd7mv3AQhOm6vjkfHb8S1bLA');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (1, 243, 2, 5, 65, 15, 'leo odio condimentum id luctus', '8/31/2023', '9/1/2023', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 'https://fastly.picsum.photos/id/614/1000/1000.jpg?hmac=7cWdSvP8FffWl4sO7ucrwov4hM-zCkllNvwTLrcGYEM');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (6, 145, 15, 6, null, 1, 'tellus semper interdum mauris ullamcorper', '8/13/2023', '8/13/2023', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 'https://fastly.picsum.photos/id/307/1000/1000.jpg?hmac=RqjQGed4VG7OLUFXSfVvd7mv3AQhOm6vjkfHb8S1bLA');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (2, 163, 4, 8, 67, 13, 'quis lectus suspendisse potenti in eleifend quam a', '9/17/2020', '9/19/2020', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 'https://fastly.picsum.photos/id/875/1000/1000.jpg?hmac=xQk_HfpJGFk_XM0jTD2LbnFJWho25_dBuXxRG8T5ZF4');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (3, 304, 11, 6, null, 28, 'et ultrices posuere cubilia curae', '11/26/2020', '11/27/2020', 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 'https://fastly.picsum.photos/id/47/1000/1000.jpg?hmac=ghBkBcoiyod7COy0WPzvRkQQ98upvTzfuxR7RsOQL7A');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (5, 109, 12, 2, 69, 15, 'lectus pellentesque eget nunc donec quis', '11/13/2023', '11/13/2023', 'Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui.', 'https://admin.live.ilo.org/sites/default/files/2023-06/52951700532_df0e3916d9_k.jpg');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (3, 209, 5, 2, null, 1, 'vehicula consequat morbi a ipsum integer', '7/10/2024', '7/11/2024', 'Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.', 'https://admin.live.ilo.org/sites/default/files/2023-06/52951700532_df0e3916d9_k.jpg');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (6, 33, 13, 2, 71, 18, 'vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum', '7/25/2020', '7/26/2020', 'Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti.', 'https://fastly.picsum.photos/id/47/1000/1000.jpg?hmac=ghBkBcoiyod7COy0WPzvRkQQ98upvTzfuxR7RsOQL7A');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (4, 133, 4, 2, null, 27, 'orci luctus et ultrices posuere cubilia', '4/5/2020', '4/7/2020', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'https://fastly.picsum.photos/id/307/1000/1000.jpg?hmac=RqjQGed4VG7OLUFXSfVvd7mv3AQhOm6vjkfHb8S1bLA');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (4, 181, 12, 5, 73, 20, 'in magna bibendum imperdiet nullam orci pede venenatis non sodales', '4/6/2023', '4/7/2023', 'Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla.', 'https://fastly.picsum.photos/id/14/1000/1000.jpg?hmac=oaPLPwNgk6TJdckR6XJ0nJZ37h4Lrk55bdBa6gHR9Fo');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (3, 179, 15, 4, null, 5, 'risus dapibus augue vel accumsan tellus nisi', '3/1/2020', '3/1/2020', 'Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio.', 'https://admin.live.ilo.org/sites/default/files/2023-06/52951700532_df0e3916d9_k.jpg');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (2, 69, 1, 3, 75, 27, 'eu sapien cursus vestibulum proin eu mi nulla ac', '4/1/2021', '4/2/2021', 'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus.', 'https://fastly.picsum.photos/id/680/1000/1000.jpg?hmac=7jNvLJWmthBj60FeOzA0sefjBtlGhT4IWonkbnzpc9o');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (1, 168, 10, 7, null, 11, 'in lacus curabitur at ipsum', '3/20/2021', '3/21/2021', 'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 'https://fastly.picsum.photos/id/875/1000/1000.jpg?hmac=xQk_HfpJGFk_XM0jTD2LbnFJWho25_dBuXxRG8T5ZF4');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (4, 9, 9, 8, 77, 1, 'hac habitasse platea dictumst maecenas ut massa', '5/13/2020', '5/14/2020', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.', 'https://admin.live.ilo.org/sites/default/files/2023-06/52951700532_df0e3916d9_k.jpg');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (3, 243, 15, 7, null, 20, 'ligula suspendisse ornare consequat lectus in est risus', '5/20/2022', '5/21/2022', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 'https://fastly.picsum.photos/id/614/1000/1000.jpg?hmac=7cWdSvP8FffWl4sO7ucrwov4hM-zCkllNvwTLrcGYEM');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (5, 68, 11, 4, 79, 5, 'purus phasellus in felis donec semper sapien', '11/29/2020', '11/30/2020', 'Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius.', 'https://fastly.picsum.photos/id/613/1000/1000.jpg?hmac=dTp0kxYjZdZv9vdvwZFIGQCxYgjZYwxHVqOFroWZ7Ts');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (3, 115, 2, 8, null, 21, 'mus etiam vel augue vestibulum rutrum rutrum neque', '3/2/2022', '3/3/2022', 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat.', 'https://fastly.picsum.photos/id/875/1000/1000.jpg?hmac=xQk_HfpJGFk_XM0jTD2LbnFJWho25_dBuXxRG8T5ZF4');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (5, 116, 1, 5, 81, 19, 'ut massa volutpat convallis morbi odio odio elementum', '7/13/2021', '7/14/2021', 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 'https://fastly.picsum.photos/id/613/1000/1000.jpg?hmac=dTp0kxYjZdZv9vdvwZFIGQCxYgjZYwxHVqOFroWZ7Ts');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (3, 197, 10, 5, null, 24, 'felis donec semper sapien a', '11/18/2024', '11/19/2024', 'Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 'https://fastly.picsum.photos/id/307/1000/1000.jpg?hmac=RqjQGed4VG7OLUFXSfVvd7mv3AQhOm6vjkfHb8S1bLA');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (5, 158, 15, 4, 83, 25, 'dapibus duis at velit eu est', '8/10/2021', '8/11/2021', 'Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.', 'https://fastly.picsum.photos/id/680/1000/1000.jpg?hmac=7jNvLJWmthBj60FeOzA0sefjBtlGhT4IWonkbnzpc9o');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (6, 173, 3, 6, null, 27, 'justo in blandit ultrices enim lorem ipsum dolor sit amet', '9/13/2024', '9/14/2024', 'Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl.', 'https://fastly.picsum.photos/id/613/1000/1000.jpg?hmac=dTp0kxYjZdZv9vdvwZFIGQCxYgjZYwxHVqOFroWZ7Ts');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (3, 197, 5, 9, 85, 9, 'tincidunt eget tempus vel pede morbi porttitor lorem id ligula', '12/16/2021', '12/17/2021', 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo.', 'https://fastly.picsum.photos/id/613/1000/1000.jpg?hmac=dTp0kxYjZdZv9vdvwZFIGQCxYgjZYwxHVqOFroWZ7Ts');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (5, 82, 11, 4, null, 14, 'habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla', '4/8/2024', '4/10/2024', 'Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo.', 'https://fastly.picsum.photos/id/47/1000/1000.jpg?hmac=ghBkBcoiyod7COy0WPzvRkQQ98upvTzfuxR7RsOQL7A');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (4, 197, 14, 1, 87, 15, 'diam id ornare imperdiet sapien urna pretium nisl', '10/10/2024', '10/11/2024', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna.', 'https://fastly.picsum.photos/id/614/1000/1000.jpg?hmac=7cWdSvP8FffWl4sO7ucrwov4hM-zCkllNvwTLrcGYEM');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (6, 75, 12, 4, null, 10, 'ultrices mattis odio donec vitae nisi', '2/1/2022', '2/2/2022', 'Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 'https://fastly.picsum.photos/id/875/1000/1000.jpg?hmac=xQk_HfpJGFk_XM0jTD2LbnFJWho25_dBuXxRG8T5ZF4');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (3, 43, 9, 2, 89, 28, 'blandit ultrices enim lorem ipsum dolor sit amet consectetuer', '3/10/2024', '3/12/2024', 'Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 'https://fastly.picsum.photos/id/47/1000/1000.jpg?hmac=ghBkBcoiyod7COy0WPzvRkQQ98upvTzfuxR7RsOQL7A');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (3, 120, 9, 3, null, 1, 'dis parturient montes nascetur ridiculus mus etiam vel augue', '10/8/2023', '10/8/2023', 'Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 'https://fastly.picsum.photos/id/680/1000/1000.jpg?hmac=7jNvLJWmthBj60FeOzA0sefjBtlGhT4IWonkbnzpc9o');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (5, 59, 10, 1, 91, 8, 'commodo vulputate justo in blandit ultrices enim lorem ipsum', '2/8/2020', '2/9/2020', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.', 'https://admin.live.ilo.org/sites/default/files/2023-06/52951700532_df0e3916d9_k.jpg');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (3, 43, 12, 5, null, 13, 'amet eros suspendisse accumsan tortor quis turpis sed ante', '7/15/2024', '7/16/2024', 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy.', 'https://fastly.picsum.photos/id/680/1000/1000.jpg?hmac=7jNvLJWmthBj60FeOzA0sefjBtlGhT4IWonkbnzpc9o');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (3, 240, 2, 6, 93, 17, 'vestibulum ante ipsum primis in faucibus orci luctus', '12/27/2020', '12/28/2020', 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 'https://fastly.picsum.photos/id/14/1000/1000.jpg?hmac=oaPLPwNgk6TJdckR6XJ0nJZ37h4Lrk55bdBa6gHR9Fo');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (3, 139, 2, 8, null, 20, 'porta volutpat quam pede lobortis ligula', '3/1/2022', '3/3/2022', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', 'https://fastly.picsum.photos/id/680/1000/1000.jpg?hmac=7jNvLJWmthBj60FeOzA0sefjBtlGhT4IWonkbnzpc9o');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (5, 101, 3, 3, 95, 25, 'curae nulla dapibus dolor vel est donec odio justo sollicitudin', '8/22/2022', '8/22/2022', 'Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl.', 'https://fastly.picsum.photos/id/14/1000/1000.jpg?hmac=oaPLPwNgk6TJdckR6XJ0nJZ37h4Lrk55bdBa6gHR9Fo');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (6, 216, 3, 2, null, 13, 'aenean lectus pellentesque eget nunc', '10/13/2021', '10/14/2021', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam. Nam tristique tortor eu pede.', 'https://fastly.picsum.photos/id/680/1000/1000.jpg?hmac=7jNvLJWmthBj60FeOzA0sefjBtlGhT4IWonkbnzpc9o');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (5, 155, 2, 1, 97, 3, 'consequat metus sapien ut nunc', '7/12/2023', '7/13/2023', 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat.', 'https://admin.live.ilo.org/sites/default/files/2023-06/52951700532_df0e3916d9_k.jpg');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (4, 25, 3, 5, null, 13, 'nam dui proin leo odio porttitor id consequat in', '2/19/2020', '2/20/2020', 'Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.', 'https://fastly.picsum.photos/id/307/1000/1000.jpg?hmac=RqjQGed4VG7OLUFXSfVvd7mv3AQhOm6vjkfHb8S1bLA');
insert into conference (id_serie, id_ville, id_organisateur, id_editeur, id_conference_du_workshop, id_utilisateur, intitule, date_debut, date_fin, texte_introductif, image_url) values (5, 77, 3, 7, 99, 10, 'luctus tincidunt nulla mollis molestie lorem quisque', '7/13/2022', '7/14/2022', 'Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'https://admin.live.ilo.org/sites/default/files/2023-06/52951700532_df0e3916d9_k.jpg');


INSERT INTO categorie_soumission (id_conference, nom_categorie, nombre_maxi_pages, font, font_size, type_logiciel, date_soumission, date_notification_acceptation, date_limite_envoi_version_corrigee) VALUES
    (1, 'Category1', 10, 'Arial', 12, 'Word', '2023-01-04 16:41:24', CURRENT_DATE, '2014-01-04 16:41:24'),
    (1, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-02-15 10:30:00', CURRENT_DATE, '2014-02-28 18:00:00'),
    (1, 'Panel', 8, 'Helvetica', 10, 'PowerPoint', '2023-02-20 12:45:00', CURRENT_DATE, '2014-03-05 15:30:00'),
    (2, 'Tutorial', 15, 'Courier New', 16, 'Markdown', '2023-03-10 08:00:00', CURRENT_DATE, '2014-04-01 20:00:00'),
    (2, 'Workshop', 15, 'Courier New', 14, 'Markdown', '2023-03-10 08:00:00', CURRENT_DATE, '2014-04-01 20:00:00'),
    (2, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', CURRENT_DATE, '2014-04-01 20:00:00'),
    (3, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', CURRENT_DATE, '2014-04-01 20:00:00'),
    (3, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', CURRENT_DATE, '2014-04-01 20:00:00'),
    (3, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', CURRENT_DATE, '2014-04-01 20:00:00'),
    (4, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', CURRENT_DATE, '2014-04-01 20:00:00'),
    (4, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', CURRENT_DATE, '2014-04-01 20:00:00'),
    (4, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', CURRENT_DATE, '2014-04-01 20:00:00'),
    (5, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', CURRENT_DATE, '2014-04-01 20:00:00'),
    (6, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', '2023-03-10 08:00:00', '2014-04-01 20:00:00'),
    (7, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', '2023-03-10 08:00:00', '2014-04-01 20:00:00'),
    (6, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', '2023-03-10 08:00:00', '2014-04-01 20:00:00'),
    (8, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', '2023-03-10 08:00:00', '2014-04-01 20:00:00'),
    (9, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', '2023-03-10 08:00:00', '2014-04-01 20:00:00'),
    (10, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', '2023-03-10 08:00:00', '2014-04-01 20:00:00'),
    (11, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', '2023-03-10 08:00:00', '2014-04-01 20:00:00'),
    (12, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', '2023-03-10 08:00:00', '2014-04-01 20:00:00'),
    (13, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', '2023-03-10 08:00:00', '2014-04-01 20:00:00'),
    (14, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', '2023-04-01 20:00:00', '2014-04-01 20:00:00'),
    (15, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', '2024-04-01 20:00:00', '2014-04-01 20:00:00'),
    (16, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', '2025-04-01 20:00:00', '2014-04-01 20:00:00'),
    (17, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', CURRENT_DATE, '2014-04-01 20:00:00'),
    (18, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', CURRENT_DATE, '2014-04-01 20:00:00'),
    (19, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', CURRENT_DATE, '2014-04-01 20:00:00'),
    (20, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', CURRENT_DATE, '2014-04-01 20:00:00'),
    (21, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', CURRENT_DATE, '2014-04-01 20:00:00'),
    (22, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', CURRENT_DATE, '2014-04-01 20:00:00'),
    (23, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', '2023-04-01 20:00:00', '2014-04-01 20:00:00'),
    (24, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', '2023-04-01 20:00:00', '2014-04-01 20:00:00'),
    (25, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', '2023-04-01 20:00:00', '2014-04-01 20:00:00'),
    (26, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', '2023-04-01 20:00:00', '2014-04-01 20:00:00'),
    (27, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', '2023-04-01 20:00:00', '2014-04-01 20:00:00'),
    (28, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', '2023-04-01 20:00:00', '2014-04-01 20:00:00'),
    (29, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', CURRENT_DATE, '2014-04-01 20:00:00'),
    (30, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', CURRENT_DATE, '2014-04-01 20:00:00'),
    (31, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', '2024-04-01 20:00:00', '2014-04-01 20:00:00'),
    (32, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', '2025-04-01 20:00:00', '2014-04-01 20:00:00'),
    (33, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', CURRENT_DATE, '2014-04-01 20:00:00'),
    (34, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', '2023-04-01 20:00:00', '2014-04-01 20:00:00'),
    (35, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', '2024-04-01 20:00:00', '2014-04-01 20:00:00'),
    (36, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', '2025-04-01 20:00:00', '2014-04-01 20:00:00'),
    (37, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', CURRENT_DATE, '2014-04-01 20:00:00'),
    (38, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', CURRENT_DATE, '2014-04-01 20:00:00'),
    (39, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', '2024-04-01 20:00:00', '2014-04-01 20:00:00'),
    (40, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', '2025-04-01 20:00:00', '2014-04-01 20:00:00'),
    (41, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', CURRENT_DATE, '2014-04-01 20:00:00'),
    (42, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', CURRENT_DATE, '2014-04-01 20:00:00'),
    (43, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', '2024-04-01 20:00:00', '2014-04-01 20:00:00'),
    (44, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', '2025-04-01 20:00:00', '2014-04-01 20:00:00'),
    (45, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', CURRENT_DATE, '2014-04-01 20:00:00'),
    (46, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', CURRENT_DATE, '2014-04-01 20:00:00'),
    (47, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', '2024-04-01 20:00:00', '2014-04-01 20:00:00'),
    (47, 'Category1', 10, 'Arial', 12, 'Word', '2023-01-04 16:41:24', CURRENT_DATE, '2014-01-04 16:41:24'),
    (47, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-02-15 10:30:00', CURRENT_DATE, '2014-02-28 18:00:00'),
    (48, 'Panel', 8, 'Helvetica', 10, 'PowerPoint', '2023-02-20 12:45:00', CURRENT_DATE, '2014-03-05 15:30:00'),
    (48, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', '2025-04-01 20:00:00', '2014-04-01 20:00:00'),
    (49, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', CURRENT_DATE, '2014-04-01 20:00:00'),
    (49, 'Category1', 10, 'Arial', 12, 'Word', '2023-01-04 16:41:24', CURRENT_DATE, '2014-01-04 16:41:24'),
    (50, 'Panel', 8, 'Helvetica', 10, 'PowerPoint', '2023-02-20 12:45:00', CURRENT_DATE, '2014-03-05 15:30:00'),
    (50, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', CURRENT_DATE, '2014-04-01 20:00:00'),
    (51, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', CURRENT_DATE, '2014-04-01 20:00:00'),
    (52, 'Category1', 10, 'Arial', 12, 'Word', '2023-01-04 16:41:24', CURRENT_DATE, '2014-01-04 16:41:24'),
    (53, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-02-15 10:30:00', CURRENT_DATE, '2014-02-28 18:00:00'),
    (54, 'Panel', 8, 'Helvetica', 10, 'PowerPoint', '2023-02-20 12:45:00', CURRENT_DATE, '2014-03-05 15:30:00'),
    (53, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', '2025-04-01 20:00:00', '2014-04-01 20:00:00'),
    (55, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', '2025-04-01 20:00:00', '2014-04-01 20:00:00'),
    (56, 'Category1', 10, 'Arial', 12, 'Word', '2023-01-04 16:41:24', CURRENT_DATE, '2014-01-04 16:41:24'),
    (57, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-02-15 10:30:00', CURRENT_DATE, '2014-02-28 18:00:00'),
    (58, 'Panel', 8, 'Helvetica', 10, 'PowerPoint', '2023-02-20 12:45:00', CURRENT_DATE, '2014-03-05 15:30:00'),
    (59, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', '2025-04-01 20:00:00', '2014-04-01 20:00:00'),
    (60, 'Category1', 10, 'Arial', 12, 'Word', '2023-01-04 16:41:24', CURRENT_DATE, '2014-01-04 16:41:24'),
    (61, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-02-15 10:30:00', CURRENT_DATE, '2014-02-28 18:00:00'),
    (62, 'Panel', 8, 'Helvetica', 10, 'PowerPoint', '2023-02-20 12:45:00', CURRENT_DATE, '2014-03-05 15:30:00'),
    (63, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', '2025-04-01 20:00:00', '2014-04-01 20:00:00'),
    (64, 'Category1', 10, 'Arial', 12, 'Word', '2023-01-04 16:41:24', CURRENT_DATE, '2014-01-04 16:41:24'),
    (65, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-02-15 10:30:00', CURRENT_DATE, '2014-02-28 18:00:00'),
    (66, 'Panel', 8, 'Helvetica', 10, 'PowerPoint', '2023-02-20 12:45:00', CURRENT_DATE, '2014-03-05 15:30:00'),
    (67, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', '2025-04-01 20:00:00', '2014-04-01 20:00:00'),
    (68, 'Category1', 10, 'Arial', 12, 'Word', '2023-01-04 16:41:24', CURRENT_DATE, '2014-01-04 16:41:24'),
    (69, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-02-15 10:30:00', CURRENT_DATE, '2014-02-28 18:00:00'),
    (70, 'Panel', 8, 'Helvetica', 10, 'PowerPoint', '2023-02-20 12:45:00', CURRENT_DATE, '2014-03-05 15:30:00'),
    (71, 'Regular paper', 12, 'Times New Roman', 14, 'PDF', '2023-03-10 08:00:00', CURRENT_DATE, '2014-04-01 20:00:00');
    






INSERT INTO session (intitule, id_conference) VALUES
    ('Session1', 1), ('Session2', 1), ('Session1', 2), ('Session2', 2), 
    ('Session1', 3), ('Session2', 3), ('Session1', 4), ('Session2', 4), 
    ('Session1', 5), ('Session2', 5), ('Session1', 6), ('Session2', 6), 
    ('Session1', 7), ('Session2', 7), ('Session1', 8), ('Session2', 8),
    ('Session1', 9), ('Session2', 9), ('Session1', 10), ('Session2', 10),
    ('Session1', 11), ('Session2', 11), ('Session1', 12), ('Session2', 12),
    ('Session1', 13), ('Session2', 13), ('Session1', 14), ('Session2', 14),
    ('Session1', 15), ('Session2', 15), ('Session1', 16), ('Session2', 16),
    ('Session1', 17), ('Session2', 17), ('Session1', 18), ('Session2', 18),
    ('Session1', 19), ('Session2', 19), ('Session1', 20), ('Session2', 20),
    ('Session1', 21), ('Session2', 21), ('Session1', 22), ('Session2', 22),
    ('Session1', 23), ('Session2', 23), ('Session1', 24), ('Session2', 24),
    ('Session1', 25), ('Session2', 25), ('Session1', 26), ('Session2', 26),
    ('Session1', 27), ('Session2', 27), ('Session1', 28), ('Session2', 28),
    ('Session1', 29), ('Session2', 29), ('Session1', 30), ('Session2', 30),
    ('Session1', 31), ('Session2', 31), ('Session1', 32), ('Session2', 32),
    ('Session1', 33), ('Session2', 33), ('Session1', 34), ('Session2', 34),
    ('Session1', 35), ('Session2', 35), ('Session1', 36), ('Session2', 36),
    ('Session1', 37), ('Session2', 37), ('Session1', 38), ('Session2', 38),
    ('Session1', 39), ('Session2', 39), ('Session1', 40), ('Session2', 40),
    ('Session1', 41), ('Session2', 41), ('Session1', 42), ('Session2', 42),
    ('Session1', 43), ('Session2', 43), ('Session1', 44), ('Session2', 44),
    ('Session1', 45), ('Session2', 45), ('Session1', 46), ('Session2', 46),
    ('Session1', 47), ('Session2', 47), ('Session1', 48), ('Session2', 48),
    ('Session1', 49), ('Session2', 49), ('Session1', 50), ('Session2', 50),
    ('Session1', 51), ('Session2', 51), ('Session1', 52), ('Session2', 52),
    ('Session1', 53), ('Session2', 53), ('Session1', 54), ('Session2', 54),
    ('Session1', 55), ('Session2', 55), ('Session1', 56), ('Session2', 56),
    ('Session1', 57), ('Session2', 57), ('Session1', 58), ('Session2', 58),
    ('Session1', 59), ('Session2', 59), ('Session1', 60), ('Session2', 60),
    ('Session1', 61), ('Session2', 61), ('Session1', 62), ('Session2', 62),
    ('Session1', 63), ('Session2', 63), ('Session1', 64), ('Session2', 64),
    ('Session1', 65), ('Session2', 65), ('Session1', 66), ('Session2', 66),
    ('Session1', 67), ('Session2', 67), ('Session1', 68), ('Session2', 68),
    ('Session1', 69), ('Session2', 69), ('Session1', 70), ('Session2', 70),
    ('Session1', 71), ('Session2', 71), ('Session1', 72), ('Session2', 72),
    ('Session1', 73), ('Session2', 73), ('Session1', 74), ('Session2', 74),
    ('Session1', 75), ('Session2', 75), ('Session1', 76), ('Session2', 76),
    ('Session1', 77), ('Session2', 77), ('Session1', 78), ('Session2', 78),
    ('Session1', 79), ('Session2', 79), ('Session1', 80), ('Session2', 80),
    ('Session1', 81), ('Session2', 81), ('Session1', 82), ('Session2', 82),
    ('Session1', 83), ('Session2', 83), ('Session1', 84), ('Session2', 84),
    ('Session1', 85), ('Session2', 85), ('Session1', 86), ('Session2', 86),
    ('Session1', 87), ('Session2', 87), ('Session1', 88), ('Session2', 88),
    ('Session1', 89), ('Session2', 89), ('Session1', 90), ('Session2', 90),
    ('Session1', 91), ('Session2', 91), ('Session1', 92), ('Session2', 92),
    ('Session1', 93), ('Session2', 93), ('Session1', 94), ('Session2', 94),
    ('Session1', 95), ('Session2', 95), ('Session1', 96), ('Session2', 96),
    ('Session1', 97), ('Session2', 97), ('Session1', 98), ('Session2', 98),
    ('Session1', 99), ('Session2', 99), ('Session1', 100), ('Session2', 100);
    


INSERT INTO lien_conference_responsable (id_conference, id_responsable) VALUES
    (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9), (10, 10), (11, 11), (12, 12), (13, 13), (14, 14), (15, 15);
    



INSERT INTO lien_session_responsable (id_session, id_responsable) VALUES
    (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9), (10, 10), (11, 11), (12, 12), (13, 13), (14, 14), (15, 15),
    (16, 1), (17, 2), (18, 3), (19, 4), (20, 5), (21, 6), (22, 7), (23, 8), (24, 9), (25, 10), (26, 11), (27, 12), (28, 13), (29, 14), (30, 15),
    (31, 1), (32, 2), (33, 3), (34, 4), (35, 5), (36, 6), (37, 7), (38, 8), (39, 9), (40, 10), (41, 11), (42, 12), (43, 13), (44, 14), (45, 15),
    (46, 1), (47, 2), (48, 3), (49, 4), (50, 5), (51, 6), (52, 7), (53, 8), (54, 9), (55, 10), (56, 11), (57, 12), (58, 13), (59, 14), (60, 15),
    (61, 1), (62, 2), (63, 3), (64, 4), (65, 5), (66, 6), (67, 7), (68, 8), (69, 9), (70, 10), (71, 11), (72, 12), (73, 13), (74, 14), (75, 15),
    (76, 1), (77, 2), (78, 3), (79, 4), (80, 5), (81, 6), (82, 7), (83, 8), (84, 9), (85, 10), (86, 11), (87, 12), (88, 13), (89, 14), (90, 15),
    (91, 1), (92, 2), (93, 3), (94, 4), (95, 5), (96, 6), (97, 7), (98, 8), (99, 9), (100, 10), (101, 11), (102, 12), (103, 13), (104, 14), (105, 15),
    (106, 1), (107, 2), (108, 3), (109, 4), (110, 5), (111, 6), (112, 7), (113, 8), (114, 9), (115, 10), (116, 11), (117, 12), (118, 13), (119, 14), (120, 15),
    (121, 1), (122, 2), (123, 3), (124, 4), (125, 5), (126, 6), (127, 7), (128, 8), (129, 9), (130, 10), (131, 11), (132, 12), (133, 13), (134, 14), (135, 15),
    (136, 1), (137, 2), (138, 3), (139, 4), (140, 5), (141, 6), (142, 7), (143, 8), (144, 9), (145, 10), (146, 11), (147, 12), (148, 13), (149, 14), (150, 15),
    (151, 1), (152, 2), (153, 3), (154, 4), (155, 5), (156, 6), (157, 7), (158, 8), (159, 9), (160, 10), (161, 11), (162, 12), (163, 13), (164, 14), (165, 15),
    (166, 1), (167, 2), (168, 3), (169, 4), (170, 5), (171, 6), (172, 7), (173, 8), (174, 9), (175, 10), (176, 11), (177, 12), (178, 13), (179, 14), (180, 15),
    (181, 1), (182, 2), (183, 3), (184, 4), (185, 5), (186, 6), (187, 7), (188, 8), (189, 9), (190, 10), (191, 11), (192, 12), (193, 13), (194, 14), (195, 15),
    (196, 1), (197, 2), (198, 3), (199, 4), (200, 5);

    
    
    


INSERT INTO lien_session_theme (id_session, id_theme) VALUES
    (1, 1), (1, 11), (1,21), (2, 22), (2,32), (2,42),
    (3, 3), (3, 13), (3,23), (4, 24), (4,34), (4,44),
    (5, 5), (5, 15), (5,25), (6, 26), (6,36), (6,46),
    (7, 7), (7, 17), (7,27), (8, 28), (8,38), (8,48),
    (9, 9), (9, 19), (9,29), (10, 30), (10,40), (10,50),
    (11, 1), (11, 11), (11,21), (12, 22), (12,32), (12,42),
    (13, 3), (13, 13), (13,23), (14, 24), (14,34), (14,44),
    (15, 5), (15, 15), (15,25), (16, 26), (16,36), (16,46),
    (17, 7), (17, 17), (17,27), (18, 28), (18,38), (18,48),
    (19, 9), (19, 19), (19,29), (20, 30), (20,40), (20,50),
    (21, 1), (21, 11), (21,21), (22, 22), (22,32), (22,42),
    (23, 3), (23, 13), (23,23), (24, 24), (24,34), (24,44),
    (25, 5), (25, 15), (25,25), (26, 26), (26,36), (26,46),
    (27, 7), (27, 17), (27,27), (28, 28), (28,38), (28,48),
    (29, 9), (29, 19), (29,29), (30, 30), (30,40), (30,50),
    (31, 1), (31, 11), (31,21), (32, 22), (32,32), (32,42),
    (33, 3), (33, 13), (33,23), (34, 24), (34,34), (34,44),
    (35, 5), (35, 15), (35,25), (36, 26), (36,36), (36,46),
    (37, 7), (37, 17), (37,27), (38, 28), (38,38), (38,48),
    (39, 9), (39, 19), (39,29), (40, 30), (40,40), (40,50),
    (41, 1), (41, 11), (41,21), (42, 22), (42,32), (42,42),
    (43, 3), (43, 13), (43,23), (44, 24), (44,34), (44,44),
    (45, 5), (45, 15), (45,25), (46, 26), (46,36), (46,46),
    (47, 7), (47, 17), (47,27), (48, 28), (48,38), (48,48),
    (49, 9), (49, 19), (49,29), (50, 30), (50,40), (50,50),
    (51, 1), (51, 11), (51,21), (52, 22), (52,32), (52,42),
    (53, 3), (53, 13), (53,23), (54, 24), (54,34), (54,44),
    (55, 5), (55, 15), (55,25), (56, 26), (56,36), (56,46),
    (57, 7), (57, 17), (57,27), (58, 28), (58,38), (58,48),
    (59, 9), (59, 19), (59,29), (60, 30), (60,40), (60,50),
    (61, 1), (61, 11), (61,21), (62, 22), (62,32), (62,42),
    (63, 3), (63, 13), (63,23), (64, 24), (64,34), (64,44),
    (65, 5), (65, 15), (65,25), (66, 26), (66,36), (66,46),
    (67, 7), (67, 17), (67,27), (68, 28), (68,38), (68,48),
    (69, 9), (69, 19), (69,29), (70, 30), (70,40), (70,50),
    (71, 1), (71, 11), (71,21), (72, 22), (72,32), (72,42),
    (73, 3), (73, 13), (73,23), (74, 24), (74,34), (74,44),
    (75, 5), (75, 15), (75,25), (76, 26), (76,36), (76,46),
    (77, 7), (77, 17), (77,27), (78, 28), (78,38), (78,48),
    (79, 9), (79, 19), (79,29), (80, 30), (80,40), (80,50),
    (81, 1), (81, 11), (81,21), (82, 22), (82,32), (82,42),
    (83, 3), (83, 13), (83,23), (84, 24), (84,34), (84,44),
    (85, 5), (85, 15), (85,25), (86, 26), (86,36), (86,46),
    (87, 7), (87, 17), (87,27), (88, 28), (88,38), (88,48),
    (89, 9), (89, 19), (89,29), (90, 30), (90,40), (90,50),
    (91, 1), (91, 11), (91,21), (92, 22), (92,32), (92,42),
    (93, 3), (93, 13), (93,23), (94, 24), (94,34), (94,44),
    (95, 5), (95, 15), (95,25), (96, 26), (96,36), (96,46),
    (97, 7), (97, 17), (97,27), (98, 28), (98,38), (98,48),
    (99, 9), (99, 19), (99,29), (100, 30), (100,40), (100,50),
    (101, 1), (101, 11), (101,21), (102, 22), (102,32), (102,42),
    (103, 3), (103, 13), (103,23), (104, 24), (104,34), (104,44),
    (105, 5), (105, 15), (105,25), (106, 26), (106,36), (106,46),
    (107, 7), (107, 17), (107,27), (108, 28), (108,38), (108,48),
    (109, 9), (109, 19), (109,29), (110, 30), (110,40), (110,50),
    (111, 1), (111, 11), (111,21), (112, 22), (112,32), (112,42),
    (113, 3), (113, 13), (113,23), (114, 24), (114,34), (114,44),
    (115, 5), (115, 15), (115,25), (116, 26), (116,36), (116,46),
    (117, 7), (117, 17), (117,27), (118, 28), (118,38), (118,48),
    (119, 9), (119, 19), (119,29), (120, 30), (120,40), (120,50),
    (121, 1), (121, 11), (121,21), (122, 22), (122,32), (122,42),
    (123, 3), (123, 13), (123,23), (124, 24), (124,34), (124,44),
    (125, 5), (125, 15), (125,25), (126, 26), (126,36), (126,46),
    (127, 7), (127, 17), (127,27), (128, 28), (128,38), (128,48),
    (129, 9), (129, 19), (129,29), (130, 30), (130,40), (130,50),
    (131, 1), (131, 11), (131,21), (132, 22), (132,32), (132,42),
    (133, 3), (133, 13), (133,23), (134, 24), (134,34), (134,44),
    (135, 5), (135, 15), (135,25), (136, 26), (136,36), (136,46),
    (137, 7), (137, 17), (137,27), (138, 28), (138,38), (138,48),
    (139, 9), (139, 19), (139,29), (140, 30), (140,40), (140,50),
    (141, 1), (141, 11), (141,21), (142, 22), (142,32), (142,42),
    (143, 3), (143, 13), (143,23), (144, 24), (144,34), (144,44),
    (145, 5), (145, 15), (145,25), (146, 26), (146,36), (146,46),
    (147, 7), (147, 17), (147,27), (148, 28), (148,38), (148,48),
    (149, 9), (149, 19), (149,29), (150, 30), (150,40), (150,50),
    (151, 1), (151, 11), (151,21), (152, 22), (152,32), (152,42),
    (153, 3), (153, 13), (153,23), (154, 24), (154,34), (154,44),
    (155, 5), (155, 15), (155,25), (156, 26), (156,36), (156,46),
    (157, 7), (157, 17), (157,27), (158, 28), (158,38), (158,48),
    (159, 9), (159, 19), (159,29), (160, 30), (160,40), (160,50),
    (161, 1), (161, 11), (161,21), (162, 22), (162,32), (162,42),
    (163, 3), (163, 13), (163,23), (164, 24), (164,34), (164,44),
    (165, 5), (165, 15), (165,25), (166, 26), (166,36), (166,46),
    (167, 7), (167, 17), (167,27), (168, 28), (168,38), (168,48),
    (169, 9), (169, 19), (169,29), (170, 30), (170,40), (170,50),
    (171, 1), (171, 11), (171,21), (172, 22), (172,32), (172,42),
    (173, 3), (173, 13), (173,23), (174, 24), (174,34), (174,44),
    (175, 5), (175, 15), (175,25), (176, 26), (176,36), (176,46),
    (177, 7), (177, 17), (177,27), (178, 28), (178,38), (178,48),
    (179, 9), (179, 19), (179,29), (180, 30), (180,40), (180,50),
    (181, 1), (181, 11), (181,21), (182, 22), (182,32), (182,42),
    (183, 3), (183, 13), (183,23), (184, 24), (184,34), (184,44),
    (185, 5), (185, 15), (185,25), (186, 26), (186,36), (186,46),
    (187, 7), (187, 17), (187,27), (188, 28), (188,38), (188,48);
 
    

    

