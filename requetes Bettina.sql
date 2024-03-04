----------------------- REQUETES BETTINA ----------------------------------

--- REQUETE 3 ---
-- ENONCÉ: Pour l’avatar principal, donnez toutes les habiletés qu’il possède en présentant : le sigle et le nom
--entre crochets dans la même colonne, la date d’obtention, le niveau courant, la valeur en moX
--du niveau courant et le coût en moX pour acheter le prochain niveau. 
--AUTEUR: BETTINA
--Fonctionelle: OUI


SELECT avatar AS "Avatar", 
	'[' || habilete.sigle || ' - ' || habilete.nom || ']' AS "Sigle et nom",
	liste_av.date_obtention AS "Date d''obtention",
	liste_av.niveau_actuel AS "Niveau actuel",
	((liste_coef.coef1*liste_av.niveau_actuel*liste_av.niveau_actuel)
	+ (liste_coef.coef2*liste_av.niveau_actuel) + liste_coef.coef3) AS "moX du niveau courant",
	((liste_coef.coef1*(liste_av.niveau_actuel+1)*(liste_av.niveau_actuel+1))
	+ (liste_coef.coef2*(liste_av.niveau_actuel+1)) + liste_coef.coef3) AS "moX du prochain niveau"
	FROM liste_habilete_avatar AS liste_av INNER JOIN habilete
	ON liste_av.habilete = habilete.nom
	INNER JOIN liste_coef_habilete AS liste_coef
	ON liste_coef.habilete = habilete.nom
		 WHERE avatar LIKE '%*';   
		 
		 
--- REQUETE 6 ---
-- ENONCÉ: Donnez la liste de tous les avatars qui possèdent plus de 1 item : nom du joueur,
--nom de l’avatar et nombre d’items.
--AUTEUR: BETTINA
--Fonctionelle: OUI

SELECT jo.alias AS "Joueur", liste_av.avatar AS "Avatar", liste_it.quantite AS "Nombre d''items",
liste_it.item AS "Item"
FROM liste_avatar_joueur AS liste_av
INNER JOIN joueur AS jo
ON liste_av.joueur = jo.alias
INNER JOIN avatar AS av
ON liste_av.avatar = av.nom
INNER JOIN liste_item_avatar AS liste_it
ON av.nom = liste_it.avatar
WHERE liste_it.quantite > 1;

-- REQUETE 7A (3 tables)
--Requete personnelle: Selectionner tous les capsules qui appartiennent a l'avatar Guylaine Gagnon qui
--sont de plus qu'une heur en durée et les ordonner en decroissance, et montrer les 2 capsules plus longues
--AUTEUR: BETTINA
--Fonctionelle: OUI

	SELECT c.id,
		c.duree,
		a.nom AS avatar_name,
		a.moX,
		ac.debut_activite
	FROM capsule AS c
	INNER JOIN avatar AS a ON c.avatar = a.nom
	INNER JOIN liste_activite_joueur AS ac ON c.activite = ac.activite
	WHERE a.nom = 'Guylaine Gagnon'
	AND c.duree > 3600  -- Capsules with a duration greater than 1 hour
	ORDER BY c.duree DESC
	LIMIT 2;
