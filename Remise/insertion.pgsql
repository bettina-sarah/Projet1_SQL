-- INSERT FRANK
INSERT INTO avatar (nom, date_creation, moX)
	VALUES	('Jacque Bling*', CURRENT_DATE, 3),
			('Time Minister', CURRENT_DATE, 9000000);


INSERT INTO habilete(nom, sigle, energie_maximum, description)
	VALUES	('Visée automatique', 'SF1', 500.500, 'Améliore grandement la précision'),
			('Ubiquité', 'SF2', 900.000, 'Améliore la durée de la multiprésence');

INSERT INTO item (nom, sigle, description, probabilite)
	VALUES	('Gros gun', 'IFZ1', 'Gros gun qui tue', 0.5),
		('Épice magique', 'IFZ2', 'Poudre qui fait de la magie', 0.1),
		('Cactus', 'IFZ3', 'Ça pique ayoye', 0.4),
		('Anneau de santé', 'IFZ4', 'Meilleur que mon assurance vie', 0.2), 
		('Bouteille vide', 'IFZ5', 'null..!', 0.9),
		('Jeu de twister', 'IFZ6', 'Toute une twist!', 0.23);

INSERT INTO joueur (alias, courriel, mot_de_passe, genre, date_inscription, date_naissance)
	VALUES ('Francois Bouchard*','masterfrank21@hotmail.com', 'aaaAAA123', 'h', CURRENT_DATE, '1997-02-09'); 

INSERT INTO jeu (nom, sigle, description)
	VALUES	('FreeZoneX', 'FZONEX', 'ZONEX LIBRE! VIVRE LE ZONEX');

INSERT INTO activite (id, debut_activite)
	VALUES	(1111111, CURRENT_TIMESTAMP),
			(1112222, CURRENT_TIMESTAMP),
			(2223333, CURRENT_TIMESTAMP);

-- INSERT BETTINA
INSERT INTO avatar (nom, date_creation, moX)
VALUES
('Guylaine Gagnon', CURRENT_DATE, 666666);

INSERT INTO habilete (nom, sigle, energie_maximum, description)
VALUES
('Auto guérison', 'SD1', 8.999, 'Regenere la vie d"un personnage'),
('Implant d"un zoom oculaire', 'SD2', 5.999, 'Equipe un zoom oculaire');


INSERT INTO item (nom, sigle, probabilite, description)
VALUES
('Emeraude', 'IEME', 0.009, 'Une incroyable roche verte qui augmente ta santé de 10!!'),
('Noix de coco', 'INOI', 0.850, 'Regenere l"energie de moitié'),
('Aiguisouille', 'IAIG', 0.999, 'Aiguise ton crayon... si t"en a un'),
('Perle noire', 'IPER', 0.001, 'Une perle rare qui équivaut 500000 moX!'),
('Dent de mammouth', 'IMAM', 0.010, 'Augmente ta dexterité de 100'),
('Saphir', 'ISAP', 0.052, 'Augmente ton intelligence de 50');

INSERT INTO jeu (nom, sigle, description)
VALUES
('DeepHorizonX', 'DEEPHX', 'Étend ta conscience dans DeepHorizonX... 0_0');

INSERT INTO joueur (alias, courriel, mot_de_passe, genre, date_inscription, date_naissance)
	VALUES ('Bettina Janesch', 'patate@gmail.com', 'SQLmeTue1234', 'f', CURRENT_DATE, '1992-08-08'); 

INSERT INTO activite (id, debut_activite)
	VALUES	(8888881, CURRENT_TIMESTAMP),
			(8888882, CURRENT_TIMESTAMP),
			(8888883, CURRENT_TIMESTAMP);

-- INSERT YOSEF

INSERT INTO avatar (nom, date_creation, moX)
	VALUES	('Blue', CURRENT_DATE, 16374805);


INSERT INTO habilete (nom, sigle, energie_maximum, description)
VALUES
('Ralentir le temps', 'SP1', 9.999, 'Ralentit le temps pour une certaine durée'),
('Bouclier de proximité', 'SP2', 8.999,  'Protège des attaques directes'),
('Invisibilité', 'SP3', 7.999, 'Invisible pour une certaine durée');

INSERT INTO item (nom, sigle, description, probabilite)
VALUES
('Diamant', 'ISP1',  'Un diamant pas comme les autres!', 0.325),
('Épée', 'ISP2', 'Épée utilisée par l''ancien chef de cette planète' ,0.225),
('Oeuf', 'ISP3', 'Oeuf inconnu!', 0.005),
('Fusil d''Assault', 'ISP4', 'Fusil d''Assault Standard', 0.405),
('Objet', 'ISP5', 'Objet inconnu!', 0.125),
('Map', 'ISP6', 'Une map de la planète', 0.999);

INSERT INTO jeu (nom, sigle, description)
VALUES
('SpaceX', 'XSPACE', 'Explorez les différentes planètes et survivez!');

INSERT INTO activite (id, debut_activite) VALUES (1000005, CURRENT_TIMESTAMP);

INSERT INTO joueur (alias, courriel, mot_de_passe, genre, date_inscription, date_naissance)
VALUES
('Yosef', 'yosef@gmail.com','mdp', 'h', CURRENT_DATE, '2000-12-15');

-- INSERT FRANK LISTES

-- Link les 3 activités(login) au joueur Francois
INSERT INTO liste_activite_joueur (id, activite, joueur)
	VALUES	(1111111, 1111111, 'Francois Bouchard*'),
			(1112222, 1112222, 'Francois Bouchard*'),
			(2223333, 2223333, 'Francois Bouchard*');

-- 6 capsules de temps (toutes 1 heure chaque sauf une à 1h30) liées à l'avatar Jacque Bling dont 3 liées à la première activité(login) et 3 liées à la 2e activité
-- 2 capsules de temps (1 heure chaque) liées à l'avatar Time Minister, les 2 liées à la 3e activité
INSERT INTO capsule (id, activite, avatar ,duree)
	VALUES	(1111111, 1111111,'Jacque Bling*' 	,3600), 	
			(1112222, 1111111,'Jacque Bling*' 	,5400),
			(1113333, 1111111,'Jacque Bling*' 	,3600),
			(1114444, 1112222,'Jacque Bling*' 	,3600),
			(1115555, 1112222,'Jacque Bling*' 	,3600),
			(1116666, 1112222,'Jacque Bling*' 	,3600),
			(2227777, 2223333,'Time Minister' 	,3600),
			(2228888, 2223333,'Time Minister' 	,3600);

-- 1ere capsule à visité 2 mondes (30min chaque)
-- 2ere capsule à visité 3 mondes (30min chaque)
-- 3ere capsule à visité 2 mondes (30min chaque)
-- 4ere capsule à visité 1 monde  (1 heure)
-- 5ere capsule à visité 1 monde  (1 heure)
-- 6ere capsule à visité 1 monde  (1 heure)
-- 7ere capsule à visité 2 mondes (30min chaque)
-- 8ere capsule à visité 1 monde  (1 heure)
INSERT INTO liste_monde_duree (id, jeu, duree, capsule)
	VALUES 	(1112222, 'FreeZoneX'		, 1800, 1111111),
			(1113333, 'SpaceX'			, 1800, 1111111),
			(1114444, 'DeepHorizonX'	, 1800, 1112222),
			(1115555, 'FreeZoneX'		, 1800, 1112222),
			(1116666, 'SpaceX'			, 1800, 1112222),
			(1117777, 'FreeZoneX'		, 1800, 1113333),
			(1118888, 'DeepHorizonX'	, 1800, 1113333),
			(2222222, 'FreeZoneX'		, 3600, 1114444),
			(2223333, 'SpaceX'			, 3600, 1115555),
			(2224444, 'DeepHorizonX'	, 3600, 1116666),
			(2225555, 'FreeZoneX'		, 1800, 2227777),
			(3336666, 'SpaceX'			, 1800, 2227777),
			(3337777, 'FreeZoneX'		, 3600, 2228888);


INSERT INTO liste_coef_habilete (id, coef1, coef2, coef3, habilete)
	VALUES	(1112222, 0.5, 1.5, 2.0, 'Visée automatique'),
	      	(1113333, 0.5, 1.5, 2.0, 'Ubiquité');


INSERT INTO liste_habilete_monde (id, habilete, jeu)
	VALUES	(1112222, 'Visée automatique','FreeZoneX'),
			(1113333, 'Ubiquité','FreeZoneX');

INSERT INTO liste_habilete_avatar (id, date_obtention, niveau_actuel, habilete, avatar)
	VALUES	(1112222, CURRENT_TIMESTAMP, 15,'Visée automatique', 'Jacque Bling*'),
			(1113333, CURRENT_TIMESTAMP, 5,'Ubiquité','Jacque Bling*'),
			(2224444, CURRENT_TIMESTAMP, 1,'Visée automatique', 'Time Minister'),
			(2225555, CURRENT_TIMESTAMP, 1,'Ubiquité','Time Minister');

INSERT INTO liste_item_monde (id, item, jeu)
	VALUES	(1112222, 'Gros gun','FreeZoneX'),
			(1113333, 'Épice magique','FreeZoneX'),
			(1114444, 'Anneau de santé','FreeZoneX'),
			(1115555, 'Bouteille vide','FreeZoneX'),
			(1116666, 'Jeu de twister','FreeZoneX'),
            (1117777, 'Cactus','FreeZoneX');

INSERT INTO liste_item_avatar (id, date_obtention, quantite, item, avatar)
	VALUES	(1112222, CURRENT_TIMESTAMP, 10000, 'Épice magique', 'Jacque Bling*'),
			(1113333, CURRENT_TIMESTAMP, 11873, 'Cactus', 'Jacque Bling*'),
			(1114444, CURRENT_TIMESTAMP, 1, 'Anneau de santé', 'Jacque Bling*'),
			(2225555, CURRENT_TIMESTAMP, 16, 'Bouteille vide', 'Time Minister'),
			(2226666, CURRENT_TIMESTAMP, 1566, 'Cactus', 'Time Minister');


INSERT INTO liste_couleur_avatar (id, couleur1, couleur2, couleur3, avatar)
	VALUES	(1112222,13378888,143744400,211111120,'Jacque Bling*'),
			(2223333,13999988,143767740,213233320,'Time Minister');

INSERT INTO liste_phrase_avatar(id, phrase, avatar)
	VALUES	(1112222, 'OK!', 'Jacque Bling*'),
			(1113333, 'NEVER TRUST A TABLE!', 'Jacque Bling*'),
			(1114444, 'NEVER ACCEPT A REQUEST!', 'Jacque Bling*'),
			(1115555, 'I WILL BREAK YOUR JOINTURE!', 'Jacque Bling*'),
			(1116666, 'ÇA MARCHE PAS PARCE QUE MON DO WHILE EST DANS LE DO!', 'Jacque Bling*'),
			(2227777, 'I AM NOT THE MAIN CHARACTER', 'Time Minister'),
			(2228888, 'Les absents seront punis', 'Time Minister');

INSERT INTO liste_avatar_joueur (id, avatar, joueur)
	VALUES	(1112222,'Jacque Bling*', 'Francois Bouchard*'),
			(2223333,'Time Minister', 'Francois Bouchard*');


-- INSERT BETTINA LISTES


--3 activités pour le joueur
INSERT INTO liste_activite_joueur (id, activite, joueur)
	VALUES	(1000001, 8888881, 'Bettina Janesch'),
			(1000002, 8888882, 'Bettina Janesch'),
			(1000003, 8888883, 'Bettina Janesch');

--3 capsules de durée varié:5h, 30 minutes et 1h de gameplay total
INSERT INTO capsule (id, activite, avatar ,duree)
	VALUES	(2000001, 8888881,'Guylaine Gagnon',18000), 	
			(2000002, 8888882,'Guylaine Gagnon',1800),
			(2000003, 8888883,'Guylaine Gagnon',3600);


--plusieurs mondes visités pour la capsule de 5h total
INSERT INTO liste_monde_duree (id, jeu, duree, capsule)
	VALUES 	(3000001, 'DeepHorizonX'    , 3600, 2000001),
 			(3000002, 'SpaceX'			, 5400, 2000001),
 			(3000003, 'FreeZoneX'	    , 2000, 2000001),
 			(3000004, 'SpaceX'  		, 7000, 2000001),
			(3000005, 'DeepHorizonX'	, 1800, 2000002),
			(3000006, 'SpaceX'		    , 3600, 2000003);


INSERT INTO liste_coef_habilete (id, coef1, coef2, coef3, habilete)
    VALUES (4000001, 0.4, 0.8, 1.2, 'Auto guérison'),
     		(4000002, 0.3, 0.9, 1.8, 'Implant d"un zoom oculaire');


INSERT INTO liste_couleur_avatar(id, couleur1, couleur2, couleur3, avatar)
	VALUES (5000001,402676124, NULL, NULL, 'Guylaine Gagnon');

INSERT INTO liste_phrase_avatar (id, phrase, avatar)
	VALUES (6000001,'Va chier mon pti criss', 'Guylaine Gagnon'),
		 (6000002,'On fait le party a soir', 'Guylaine Gagnon');
	
INSERT INTO liste_habilete_monde (id, habilete, jeu)
	VALUES (7000001, 'Auto guérison', 'DeepHorizonX'),
			(7000002, 'Implant d"un zoom oculaire', 'DeepHorizonX');


INSERT INTO liste_habilete_avatar (id, date_obtention, niveau_actuel, habilete, avatar)
VALUES 
(8000001, CURRENT_TIMESTAMP, 1, 'Auto guérison', 'Guylaine Gagnon'),
(8000002, CURRENT_TIMESTAMP, 1, 'Implant d"un zoom oculaire', 'Guylaine Gagnon');

INSERT INTO liste_item_monde  (id, item, jeu)
VALUES 
(1100001, 'Emeraude', 'DeepHorizonX'),
(1100002, 'Noix de coco', 'DeepHorizonX'),
(1100003, 'Aiguisouille', 'DeepHorizonX'),
(1100004, 'Perle noire', 'DeepHorizonX'),
(1100005, 'Dent de mammouth', 'DeepHorizonX'),
(1100006, 'Saphir', 'DeepHorizonX');

INSERT INTO liste_item_avatar (id, date_obtention, quantite, item, avatar)
VALUES 	
(9000001, CURRENT_TIMESTAMP, 1, 'Emeraude', 'Guylaine Gagnon'),
(9000002, CURRENT_TIMESTAMP, 2, 'Noix de coco', 'Guylaine Gagnon'),
(9000003, CURRENT_TIMESTAMP, 200000, 'Aiguisouille', 'Guylaine Gagnon'),
(9000004, CURRENT_TIMESTAMP, 1, 'Perle noire', 'Guylaine Gagnon'),
(9000005, CURRENT_TIMESTAMP, 2, 'Dent de mammouth', 'Guylaine Gagnon'),
(9000006, CURRENT_TIMESTAMP, 1, 'Saphir', 'Guylaine Gagnon');

INSERT INTO liste_avatar_joueur (id, avatar, joueur)
VALUES	
(9060001,'Guylaine Gagnon', 'Bettina Janesch');


-- INSERT YOSEF LISTES

INSERT INTO liste_phrase_avatar(id, phrase,avatar) VALUES (1000005,'TROP FACILE!!!', 'Blue');


INSERT INTO liste_couleur_avatar(id, couleur1, couleur2, couleur3,avatar) 
    VALUES (1000005,01270000,01870000,01970000,'Blue');


INSERT INTO liste_coef_habilete (id, coef1, coef2, coef3, habilete) VALUES 

(1000005, 0.5, 1.5, 2.0, 'Ralentir le temps'),
(1000006, 0.5, 1.5, 2.0, 'Bouclier de proximité'),
(1000007, 0.5, 1.5, 2.0, 'Invisibilité');



INSERT INTO liste_habilete_avatar(id, date_obtention, niveau_actuel, habilete, avatar) VALUES 
(1000005, CURRENT_TIMESTAMP, 1, 'Ralentir le temps', 'Blue'),
(1000006, CURRENT_TIMESTAMP, 1, 'Bouclier de proximité', 'Blue'),
(1000007, CURRENT_TIMESTAMP, 1, 'Invisibilité', 'Blue');


INSERT INTO liste_item_avatar (id, date_obtention, quantite, item, avatar)
VALUES 
(1000005, CURRENT_TIMESTAMP, 1, 'Diamant', 'Blue'),
(1000006, CURRENT_TIMESTAMP, 2, 'Épée', 'Blue'),
(1000007, CURRENT_TIMESTAMP, 3, 'Oeuf', 'Blue'),
(1000008, CURRENT_TIMESTAMP, 1, 'Fusil d''Assault', 'Blue'),
(1000009, CURRENT_TIMESTAMP, 1, 'Objet', 'Blue'),
(1000010, CURRENT_TIMESTAMP, 1, 'Map', 'Blue');

INSERT INTO liste_habilete_monde (id, habilete, jeu)
VALUES 
(1000005, 'Ralentir le temps', 'SpaceX'),
(1000006, 'Bouclier de proximité', 'SpaceX'),
(1000007, 'Invisibilité', 'SpaceX');


INSERT INTO liste_item_monde (id, item, jeu)
VALUES 
(1000005, 'Diamant', 'SpaceX'),
(1000006, 'Épée','SpaceX'),
(1000007, 'Oeuf','SpaceX'),
(1000008, 'Fusil d''Assault','SpaceX'),
(1000009, 'Objet','SpaceX'),
(1000010, 'Map','SpaceX');



INSERT INTO capsule (id, activite , avatar, duree) VALUES (1000005, 1000005, 'Blue', 20000);

INSERT INTO liste_monde_duree (id, jeu,duree, capsule) VALUES (1000005 , 'SpaceX' , 20000, 1000005 );


INSERT INTO liste_activite_joueur (id, activite, joueur) VALUES (1000005, 1000005,'Yosef');

INSERT INTO liste_avatar_joueur (id, avatar, joueur)
	VALUES	(1000005,'Blue', 'Yosef');

---------------------------------------------------------------------------------------------------------------
	    
--------------------------------------------- INSERT JUSTIN ------------------------------------------------------------------


INSERT INTO avatar (nom, date_creation, moX)
VALUES
('John Smith', CURRENT_DATE, 654321);

INSERT INTO habilete (nom, sigle, energie_maximum, description)
VALUES
('Hot Sauce', 'SF3', 420.69, 'Crache du feu'),
('Drain de vie', 'SD3', 15.999, 'Draine la santé de ton ennemi');

INSERT INTO joueur (alias, courriel, mot_de_passe, genre, date_inscription, date_naissance)
	VALUES ('Justin Twarabimenye', 'justin123@gmail.com', 'MDP123abc', 'm', CURRENT_DATE, '1993-05-05'); 


INSERT INTO activite (id, debut_activite)
	VALUES	(2222220, CURRENT_TIMESTAMP),
			(2222221, CURRENT_TIMESTAMP),
			(2222222, CURRENT_TIMESTAMP);


INSERT INTO liste_activite_joueur (id, activite, joueur)
	VALUES	(1000011, 2222220, 'Justin Twarabimenye'),
			(1000012, 2222221, 'Justin Twarabimenye'),
			(1000013, 2222222, 'Justin Twarabimenye');

INSERT INTO capsule (id, activite, avatar ,duree)
	VALUES	(2000011, 2222220,'John Smith',12600), 	
			(2000012, 2222221,'John Smith',5400),
			(2000013, 2222222,'John Smith',3600);

INSERT INTO liste_monde_duree (id, jeu, duree, capsule)
	VALUES 	(4000001,'FreeZoneX', 5000, 2000011),
 			(4000002,'SpaceX', 1800, 2000011),
			(4000003,'DeepHorizonX', 4800, 2000011),


INSERT INTO liste_coef_habilete (id, coef1, coef2, coef3, habilete)
    VALUES (5000001, 0.2, 0.6, 1.1, 'Hot Sauce'),
     		(5000002, 0.4, 0.8, 1.3, 'Drain de vie');


INSERT INTO liste_couleur_avatar(id, couleur1, couleur2, couleur3, avatar)
	VALUES (7770001,123455550, 123455551, 123455552, 'John Smith');

INSERT INTO liste_phrase_avatar (id, phrase, avatar)
	VALUES (7000001,'C'est ça qui est ça', 'John Smith'),
		 (7000002,'On fait se qui faut', 'John Smith');
	
INSERT INTO liste_habilete_monde (id, habilete, jeu)
	VALUES (8000001, 'Drain de vie', 'DeepHorizonX'),
			(8000002, 'Hot Sauce', 'FreeZoneX');


INSERT INTO liste_habilete_avatar (id, date_obtention, niveau_actuel, habilete, avatar)
VALUES 
(9000011, CURRENT_TIMESTAMP, 1, 'Auto guérison', 'John Smith'),
(9000012, CURRENT_TIMESTAMP, 1, 'Hot Sauce', 'John Smith');


INSERT INTO liste_item_avatar (id, date_obtention, quantite, item, avatar)
VALUES 	
(3000001, CURRENT_TIMESTAMP, 2, 'Gros gun', 'John Smith'),
(3000002, CURRENT_TIMESTAMP, 5, 'Épice magique', 'John Smith'),
(3000003, CURRENT_TIMESTAMP, 4, 'Oeuf', 'John Smith'),
(3000004, CURRENT_TIMESTAMP, 40, 'Noix de coco', 'John Smith'),
(3000005, CURRENT_TIMESTAMP, 2, 'Dent de mammouth', 'John Smith'),
(3000006, CURRENT_TIMESTAMP, 20, 'Saphir', 'John Smith');

 
 
		
		
	






