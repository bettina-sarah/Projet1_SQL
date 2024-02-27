-- REQUEST FRANK

--Requete #1
--Donnez la liste de tous les joueurs en présentant : alias, courriel, date d’inscription. 
--François
--Fonctionnel: OUI
--SELECT alias, courriel, date_inscription FROM joueur;

--Requete #4
--Pour l’avatar principal, donnez la valeur totale des tous les items(quantité totale) et habilete(valeur totale en moX) qu’il possède (les habilités
--considérant le niveau et les items considérant la quantité).  
--François
--Fonctionnel: 

SELECT SUM(quantite) AS "Valeur totale (quantité) des items"
	FROM liste_item_avatar
		WHERE avatar = 'Jacque Bling*';

--coef1 * niveau2 + coef2 * niveau + coef3
		
INSERT INTO liste_coef_habilete (id, coef1, coef2, coef3, habilete)
	VALUES	(1112222, 0.5, 1.5, 2.0, 'Visée automatique'),
	      	(1113333, 0.5, 1.5, 2.0, 'Ubiquité');


INSERT INTO liste_habilete_avatar (id, date_obtention, niveau_actuel, habilete, avatar)
	VALUES	(1112222, CURRENT_TIMESTAMP, 15,'Visée automatique', 'Jacque Bling*'),
			(1113333, CURRENT_TIMESTAMP, 5,'Ubiquité','Jacque Bling*'),
			(2224444, CURRENT_TIMESTAMP, 1,'Visée automatique', 'Time Minister'),
			(2225555, CURRENT_TIMESTAMP, 1,'Ubiquité','Time Minister');

INSERT INTO liste_item_avatar (id, date_obtention, quantite, item, avatar)
	VALUES	(1112222, CURRENT_TIMESTAMP, 10000, 'Épice magique', 'Jacque Bling*'),
			(1113333, CURRENT_TIMESTAMP, 11873, 'Cactus', 'Jacque Bling*'),
			(1114444, CURRENT_TIMESTAMP, 1, 'Anneau de santé', 'Jacque Bling*'),
			(2225555, CURRENT_TIMESTAMP, 16, 'Bouteille vide', 'Time Minister'),
			(2226666, CURRENT_TIMESTAMP, 1566, 'Cactus', 'Time Minister');



SELECT SUM(ch.coef1*ha.niveau_actuel+ch.coef2*ha.niveau_actuel+ch.coef3) AS "Valeur des habiletés"
	FROM liste_habilete_avatar AS ha
	    LEFT OUTER JOIN liste_coef_habilete	AS ch	
		    ON ch.habilete = ha.habilete WHERE ha.avatar = 'Jacque Bling*'

SELECT SUM(ch.coef1*ha.niveau_actuel+ch.coef2*ha.niveau_actuel+ch.coef3) AS "Valeur des habiletés", SUM(quantite) AS "Valeur totale (quantité) des items"
	FROM liste_habilete_avatar AS ha
	    LEFT OUTER JOIN liste_coef_habilete	AS ch	
		    ON ch.habilete = ha.habilete WHERE ha.avatar = 'Jacque Bling*'


SELECT SUM(ch.coef1*ha.niveau_actuel+ch.coef2*ha.niveau_actuel+ch.coef3) AS "Valeur des habiletés", SUM(ia.quantite) AS "Valeur totale (quantité) des items"
	FROM liste_habilete_avatar AS ha
	LEFT OUTER JOIN liste_coef_habilete	AS ch	
		ON ch.habilete = ha.habilete WHERE ha.avatar = 'Jacque Bling*'
    LEFT OUTER JOIN liste_item_avatar	AS ia
        ON ha.avatar = ia.avatar
UNION
SELECT SUM(quantite) AS "Valeur totale (quantité) des items"
	FROM liste_item_avatar
		WHERE avatar = 'Jacque Bling*';
        