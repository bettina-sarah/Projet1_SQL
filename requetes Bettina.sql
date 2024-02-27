----------------------- REQUETES BETTINA ----------------------------------

--- REQUETE 3 ---
--Enoncé: Pour l’avatar principal, donnez toutes les habiletés qu’il possède en présentant : 
--le sigle et le nom (habilete) || '[' ||
--entre crochets dans la même colonne, la date d’obtention, le niveau courant, la valeur en moX
--liste_habilete_avatar: date_obtention, niveau_actuel, ||
--liste_coef_habilete: valeur en mox = coef1 × niveau_actuel**niveau_actuel + coef2 × niveau_actuel + coef3 ||']';

--du niveau courant et le coût en moX pour acheter le prochain niveau. 
--cout mox prochain niveau: mox prochain niv = coef1 × (niveau_actuel+1)**(niveau_actuel+1) +
	-- coef2 × (niveau_actuel+1) + coef3;
--cout en mox pour acheter: mox_niv_prochain - mox_niv_actuel




SELECT habilete AS "Habilete", habilete.sigle AS "Sigle", avatar AS "Avatar"
	FROM liste_habilete_avatar INNER JOIN habilete 
		ON liste_habilete_avatar.habilete = habilete.nom WHERE avatar LIKE '%*'                            
		


-- INSERT INTO avatar (nom, date_creation, moX)
-- 	VALUES	('Jacque Bling*', CURRENT_DATE, 3),
-- 			('Time Minister', CURRENT_DATE, 9000000);

-- INSERT INTO habilete(nom, sigle, energie_maximum, description)
-- 	VALUES	('Visée automatique', 'SF1', 500.500, 'Améliore grandement la précision'),
-- 			('Ubiquité', 'SF2', 900.000, 'Améliore la durée de la multiprésence');
			
-- INSERT INTO liste_coef_habilete (id, coef1, coef2, coef3, habilete)
-- 	VALUES	(1112222, 0.5, 1.5, 2.0, 'Visée automatique'),
-- 	      	(1113333, 0.5, 1.5, 2.0, 'Ubiquité');

-- INSERT INTO liste_habilete_avatar (id, date_obtention, niveau_actuel, habilete, avatar)
-- 	VALUES	(1112222, CURRENT_TIMESTAMP, 15,'Visée automatique', 'Jacque Bling*'),
-- 			(1113333, CURRENT_TIMESTAMP, 5,'Ubiquité','Jacque Bling*'),
-- 			(2224444, CURRENT_TIMESTAMP, 1,'Visée automatique', 'Time Minister'),
-- 			(2225555, CURRENT_TIMESTAMP, 1,'Ubiquité','Time Minister');

		
-- SELECT  nom AS "Nom", 
--         prenom AS "Prénom", 
--         TO_CHAR(date_embauche, 'DD/MM/YYYY') AS "Date d'embauche", 
--         departement AS "Numéro de département"
--     FROM employe
--     WHERE superviseur = (SELECT nas FROM employe WHERE nom = 'Dupuis' AND prenom = 'Lancelot')
--     ORDER BY date_embauche DESC;
		