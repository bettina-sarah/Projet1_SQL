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
('Aiguisouille', 'IAIG', 0.999, 'Aiguise ton crayon... si t"en a un');
('Perle noire', 'IPER', 0.001, 'Une perle rare qui équivaut 500000 moX!');
('Dent de mammut', 'IMAM', 0.010, 'Augmente ta dexterité de 100');
('Saphir', 'ISAP', 0.052, 'Augmente ton intelligence de 50');

INSERT INTO jeu (nom, sigle, description)
VALUES
('DeepHorizonX', 'DEEPHX', 'Étend ta conscience dans DeepHorizonX... 0_0');

INSERT INTO joueur (alias, courriel, mot_de_passe, genre, date_inscription, date_naissance)
	VALUES ('Bettina Janesch', 'patate@gmail.com', 'SQLmeTue1234', 'f', CURRENT_DATE, '1992-08-08'); 







INSERT INTO liste_coefs_habilete (id, coef1, coef2, coef3) VALUES (2000008, 0.4, 0.8, 1.2);


INSERT INTO liste_couleurs(id, couleur1, couleur2, couleur3) VALUES (2000008,'4026761247', NULL, NULL);

INSERT INTO liste_phrases(id, phrase) VALUES (2000008,'Va chier mon pti criss');


INSERT INTO liste_habiletes_avatar(id, date_obtention, niveau_actuel, habilete) VALUES 
(2000008, CURRENT_TIMESTAMP, 1, 'Auto guérison'),
(2000008, CURRENT_TIMESTAMP, 1, 'Implant d"un zoom oculaire');

INSERT INTO liste_items_avatar (id, date_obtention, quantite, item)
VALUES 	
(2000008, CURRENT_TIMESTAMP, 1, 'Emeraude'),
(2000008, CURRENT_TIMESTAMP, 2, 'Noix de coco'),
(2000008, CURRENT_TIMESTAMP, 200000, 'Aiguisouille'),
(2000008, CURRENT_TIMESTAMP, 1, 'Perle noire'),
(2000008, CURRENT_TIMESTAMP, 2, 'Dent de mammut'),
(2000008, CURRENT_TIMESTAMP, 1, 'Saphir');


INSERT INTO liste_items_monde (id, item)
VALUES 
(4488844, 'Emeraude'),
(4488844, 'Noix de coco'),
(4488844, 'Aiguisouille'),
(4488844, 'Perle noire'),
(4488844, 'Dent de mammut'),
(4488844, 'Saphir');
 
INSERT INTO liste_habilete_monde (id, habilete)
VALUES 
(4488844, 'Auto guérison'),
(4488844, 'Implant d"un zoom oculaire');


INSERT INTO monde_duree (id, monde, duree ) VALUES (1000005,'DeepHorizonX', 15000);

INSERT INTO liste_monde_duree (id, monde_duree ) VALUES (4488844,9000);

INSERT INTO liste_avatars_capsule (id, avatar, visite ) VALUES (2000008, 'Guylaine Gagnon', 2000008);

