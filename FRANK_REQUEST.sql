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
--Fonctionnel: OUI

-- SELECT 
-- (SELECT SUM(ch.coef1*ha.niveau_actuel+ch.coef2*ha.niveau_actuel+ch.coef3) AS "Valeur des habiletés"
-- 	FROM liste_habilete_avatar AS ha
-- 	    LEFT OUTER JOIN liste_coef_habilete	AS ch	
-- 		    ON ch.habilete = ha.habilete WHERE ha.avatar = 'Jacque Bling*'),
			
-- (SELECT SUM(quantite) AS "Valeur totale (quantité) des items"
-- 	FROM liste_item_avatar
-- 		WHERE avatar = 'Jacque Bling*');

--Requete #7


-- SELECT SUM(cap.duree)AS "Temps en seconde" FROM capsule AS cap
-- 	WHERE avatar = (SELECT ia.avatar FROM liste_item_avatar AS ia
	-- WHERE item = 'Cactus')


	-- SELECT SUM(ia.quantite) AS "Cactus" FROM liste_item_avatar AS ia
	-- WHERE item = 'Cactus'

SELECT 
SUM(cap.duree)AS "Temps en seconde",
(SELECT SUM(ia.quantite) AS "Cactus" FROM liste_item_avatar AS ia WHERE item = 'Cactus')
	FROM capsule AS cap
	INNER JOIN liste_item_avatar AS ia
	ON ia.avatar = cap.avatar 
	INNER JOIN liste_avatar_joueur AS ja
	ON ja.avatar = ia.avatar WHERE ia.item = 'Cactus'