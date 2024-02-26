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
('Dent de mammut', 'IMAM', 0.010, 'Augmente ta dexterité de 100'),
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
-- 			(3000002, 'SpaceX'			, 5400, 2000001),
-- 			(3000003, 'FreeZoneX'	    , 2000, 2000001),
-- 			(3000004, 'SpaceX'  		, 7000, 2000001),
			(3000005, 'DeepHorizonX'	, 1800, 2000002);
--			(3000006, 'SpaceX'		    , 3600, 2000003);


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
(1100005, 'Dent de mammut', 'DeepHorizonX'),
(1100006, 'Saphir', 'DeepHorizonX');

INSERT INTO liste_item_avatar (id, date_obtention, quantite, item, avatar)
VALUES 	
(9000001, CURRENT_TIMESTAMP, 1, 'Emeraude', 'Guylaine Gagnon'),
(9000002, CURRENT_TIMESTAMP, 2, 'Noix de coco', 'Guylaine Gagnon'),
(9000003, CURRENT_TIMESTAMP, 200000, 'Aiguisouille', 'Guylaine Gagnon'),
(9000004, CURRENT_TIMESTAMP, 1, 'Perle noire', 'Guylaine Gagnon'),
(9000005, CURRENT_TIMESTAMP, 2, 'Dent de mammut', 'Guylaine Gagnon'),
(9000006, CURRENT_TIMESTAMP, 1, 'Saphir', 'Guylaine Gagnon');




