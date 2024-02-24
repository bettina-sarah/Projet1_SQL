INSERT INTO avatar (nom, date_de_creation, moX)
	VALUES	('Jacque Bling*', CURRENT_DATE, 3),
			('Time Minister', CURRENT_DATE, 9000000);


INSERT INTO habilete(nom, sigle, energie_maximum, description)
	VALUES	('Visée automatique', SF1, 500.500, 'Améliore grandement la précision'),
			('Ubiquité', SF2, 900.000, 'Améliore la durée de la multiprésence');

INSERT INTO item (nom, sigle, description, probabilite)
	VALUES	('Gros gun', IFZ1, 'Gros gun qui tue', 0.5),
		('Épice magique', IFZ2, 'Poudre qui fait de la magie', 0.1),
		('Cactus', IFZ3, 'Ça pique ayoye', 0.4),
		('Anneau de santé', IFZ4, 'Meilleur que mon assurance vie', 0.2), 
		('Bouteille vide', IFZ5, 'vide...', 0.9),
		('Jeu de twister', IFZ6, 'Toute une twist!', 0.23);

INSERT INTO joueur (alias, courriel, mot_de_passe, genre, date_inscription, date_naissance)
	VALUES ('Francois Bouchard*', masterfrank21@hotmail.com, 'h', CURRENT_DATE, '1997-02-09'); 

INSERT INTO jeu (nom, sigle, description)
	VALUES	('FreeZoneX', FZONEX, 'ZONEX LIBRE! VIVRE LE ZONEX');

INSERT INTO activite (id, debut_activite)
	VALUES	(1111111, CURRENT_TIMESTAMP),
			(1112222, CURRENT_TIMESTAMP),
			(2223333, CURRENT_TIMESTAMP);

-- Link les 3 activités(login) au joueur Francois
INSERT INTO liste_activite_joueur (id, activite, joueur)
	VALUES	(1111111, 1111111, 'Francois Bouchard'),
			(1112222, 1112222, 'Francois Bouchard'),
			(2223333, 2223333, 'Francois Bouchard');

-- 6 capsules de temps (toutes 1 heure chaque sauf une à 1h30) liées à l'avatar Jacque Bling dont 3 liées à la première activité(login) et 3 liées à la 2e activité
-- 2 capsules de temps (1 heure chaque) liées à l'avatar Time Minister, les 2 liées à la 3e activité
INSERT INTO capsule (id, activite, avatar ,duree)
	VALUES	(1111111, 1111111,'Jacque Bling' 	,3600), 	
			(1112222, 1111111,'Jacque Bling' 	,5400),
			(1113333, 1111111,'Jacque Bling' 	,3600),
			(1114444, 1112222,'Jacque Bling' 	,3600),
			(1115555, 1112222,'Jacque Bling' 	,3600),
			(1116666, 1112222,'Jacque Bling' 	,3600),
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
INSERT INTO liste_monde_duree (id, monde, duree, capsule)
	VALUES 	(1112222, 'FreeZoneX'		, 1800, 1111111),
			(1113333, 'SpaceX'			, 1800, 1111111),
			(1114444, 'DeepHorizonX'	, 1800, 1112222),
			(1115555, 'FreeZoneX'		, 1800, 1112222),
			(1116666, 'SpaceX'			, 1800, 1112222),
			(2223333, 'FreeZoneX'		, 1800, 1113333),
			(2224444, 'DeepHorizonX'	, 1800, 1113333),
			(1112222, 'FreeZoneX'		, 3600, 1114444),
			(1113333, 'SpaceX'			, 3600, 1115555),
			(1114444, 'DeepHorizonX'	, 3600, 1116666),
			(1115555, 'FreeZoneX'		, 1800, 2227777),
			(1116666, 'SpaceX'			, 1800, 2227777),
			(2223333, 'FreeZoneX'		, 3600, 2228888);


INSERT INTO liste_coef_habilete (id, coef1, coef2, coef3, habilete)
	VALUES	(1112222, 0.5, 1.5, 2.0, 'Visée automatique'),
	      	(1113333, 0.5, 1.5, 2.0, 'Ubiquité');


INSERT INTO liste_habilete_monde (id, habilete, jeu)
	VALUES	(1112222, 'Visée automatique','FreeZoneX"'),
			(1113333, 'Ubiquité',"FreeZoneX");

INSERT INTO liste_habilite_avatar (id, date_obtention, niveau_actuel, habilite, avatar)
	VALUES	(1112222, CURRENT_TIMESTAMP, 15,'Visée automatique', 'Jacque Bling*'),
			(1113333, CURRENT_TIMESTAMP, 5,'Ubiquité','Jacque Bling*');
			(2224444, CURRENT_TIMESTAMP, 1,'Visée automatique', 'Time Minister'),
			(2225555, CURRENT_TIMESTAMP, 1,'Ubiquité','Time Minister');

INSERT INTO liste_item_monde (id, item, jeu)
	VALUES	(1112222, 'Gros gun','FreeZoneX'),
			(1113333, 'Épice magique','FreeZoneX'),
			(1114444, 'Anneau de santé','FreeZoneX'),
			(1115555, 'Bouteille vide','FreeZoneX'),
			(1116666, 'Jeu de twister','FreeZoneX'),

INSERT INTO item_avatar (id, date_obtention, quantite, item, avatar)
	VALUES	(1112222, CURRENT_TIMESTAMP, 10000, 'Épice magique', 'Jacque Bling*'),
			(1113333, CURRENT_TIMESTAMP, 11873, 'Cactus', 'Jacque Bling*'),
			(1114444, CURRENT_TIMESTAMP, 1, 'Anneau de santé', 'Jacque Bling*');
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
			(2227777, 'I AM NOT THE MAIN CHARACTER', 'Time Minister*'),
			(2228888, 'Les absents seront punis', 'Time Minister*'),

INSERT INTO liste_avatar_joueur (id, avatar, joueur)
	VALUES	(1112222,'Jacque Bling', 'Francois Bouchard'),
			(2223333,'Time Minister', 'Francois Bouchard');



  	
	    


 
 
		
		
	






