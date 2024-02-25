INSERT INTO liste_coefs_habilete (id, coef1, coef2, coef3) VALUES (2000008, 0.4, 0.8, 1.2);

INSERT INTO habilete (nom, sigle, energie_maximum, liste_de_coef, description)
VALUES
('Auto guérison', 'DH1', 8.999, 2000008, 'Regenere la vie d"un personnage'),
('Implant d"un zoom oculaire', 'DH2', 5.999, 2000008, 'Equipe un zoom oculaire');

INSERT INTO liste_couleurs(id, couleur1, couleur2, couleur3) VALUES (2000008,'4026761247', NULL, NULL);

INSERT INTO liste_phrases(id, phrase) VALUES (2000008,'Va chier mon pti criss');

INSERT INTO item (nom, sigle, probabilite, description)
VALUES
('Emeraude', 'IEME', 0.009, 'Une incroyable roche verte qui augmente ta santé de 10px'),
('Noix de coco', 'INOI', 0.850, 'Regenere l"energie de moitié'),
('Aiguisouille', 'IAIG', 0.999, 'Aiguise ton crayon... si t"en a un');
('Perle noire', 'IPER', 0.001, 'Une perle rare qui équivaut 500000 moX');
('Dent de mammut', 'IMAM', 0.010, 'Augmente ta dexterité de 100');
('Saphir', 'ISAP', 0.052, 'Augmente ton intelligence de 50');

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

INSERT INTO avatar (nom, liste_phrases_avatar, liste_couleurs_avatar, date_creation, moX, liste_habiletes, liste_items)
VALUES
('Guylaine Gagnon', 2000008, 2000008, CURRENT_DATE, 666666, 2000008, 2000008);

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

INSERT INTO jeu (nom, sigle, description, liste_item_rare, liste_habiletes)
VALUES
('DeepHorizonX', 'DEEPHO', 'Étend tes limites dans DeepHorizonX!', 4488844, 4488844);

INSERT INTO monde_duree (id, monde, duree ) VALUES (1000005,'DeepHorizonX', 15000);

INSERT INTO liste_monde_duree (id, monde_duree ) VALUES (4488844,9000);

INSERT INTO liste_avatars_capsule (id, avatar, visite ) VALUES (2000008, 'Guylaine Gagnon', 2000008);

INSERT INTO capsule (id, liste_avatars, duree) VALUES (2000009, 2000008, 80000);
INSERT INTO capsule_activite(id, capsule) VALUES (2000008, 2000009);

INSERT INTO activite (id, debut_activite, liste_capsules_activite) VALUES (2000008, CURRENT_TIMESTAMP,2000008);
INSERT INTO activite_joueur (id, activite) VALUES (1000005, 1000005);
INSERT INTO avatar_joueur (id, avatar) VALUES (1000005, 'Avatar1');

INSERT INTO joueur (alias, courriel, genre, date_inscription, date_naissance, liste_activites, liste_avatars)
VALUES
('Joueur2', 'joueur2@gmail.com', 'h', CURRENT_DATE, '2000-12-15', 1000005, 1000005);
 

INSERT INTO liste_monde_duree (id, monde_duree ) VALUES (1000005,1000005);

INSERT INTO monde_duree (id, monde, duree ) VALUES (1000005,'SpaceX', 15000);


