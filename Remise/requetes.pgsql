-- REQUEST FRANK

--- Requete #1 ---

--Donnez la liste de tous les joueurs en présentant : alias, courriel, date d’inscription. 
--François
--Fonctionnel: OUI
SELECT alias AS "Alias", courriel AS "Courriel", date_inscription AS "Inscription"
 	FROM joueur;

--- REQUETE 2 ---
-- ENONCÉ: Donnez la liste des avatars d’un joueur quelconque (pour l’exemple, prendre le joueur principal),
--en donnant : nom, la couleur préférée transformée en trois composantes rouge-vert-bleu, date
--de création suivant le format 2000 | 12 | 25, le nombre de moX.
--AUTEUR: JUSTIN
--Fonctionelle: OUI

SELECT a.avatar AS Avatar,
	CONCAT(
        ((a.couleur1 >> 16) & 255),
        '-',
        ((a.couleur1 >> 8) & 255),
        '-',
        (a.couleur1 & 255)
    ) AS "couleur préféré en RGB",
    TO_CHAR(avatar.date_creation, 'YYYY | MM | DD') AS "Date de création",
    avatar.mox AS "Nombre de moX", laj.joueur 
FROM liste_couleur_avatar as a
	JOIN
    avatar as avatar ON a.avatar = avatar.nom
	JOIN 
	liste_avatar_joueur as laj ON a.id = laj.id
WHERE laj.joueur ='Francois Bouchard*';

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

--- Requete #4 ---

--Pour l’avatar principal, donnez la valeur totale des tous les items(quantité totale) et habilete(valeur totale en moX) qu’il possède (les habilités
--considérant le niveau et les items considérant la quantité).  
--François
--Fonctionnel: OUI

SELECT 
(SELECT SUM(ch.coef1*ha.niveau_actuel+ch.coef2*ha.niveau_actuel+ch.coef3) AS "Valeur des habiletés"
	FROM liste_habilete_avatar AS ha
	    LEFT OUTER JOIN liste_coef_habilete	AS ch	
		    ON ch.habilete = ha.habilete WHERE ha.avatar = 'Jacque Bling*'),
			
(SELECT SUM(quantite) AS "Valeur totale (quantité) des items"
	FROM liste_item_avatar
		WHERE avatar = 'Jacque Bling*');

---- REQUETE-5 --------

--No de la requête: 5
--Énoncé de la requête: Pour le joueur principal, donnez le nombre total d’heures passées dans chaque jeu joué.
--Auteur: Yosef 
--Fonctionnelle: Oui
 
SELECT jeu.nom AS Monde, ROUND((SUM(lmd.duree)/3600),2) || ' ' ||'heure(s)' AS "Heures Totales"
FROM joueur AS jp
	INNER JOIN liste_activite_joueur AS laj
		ON jp.alias = laj.joueur
	INNER JOIN capsule AS cps
		ON laj.activite = cps.activite
	INNER JOIN liste_monde_duree AS lmd
		ON cps.id = lmd.capsule
	INNER JOIN jeu 
		ON lmd.jeu = jeu.nom
WHERE jp.alias = 'Francois Bouchard*'
GROUP BY jeu.nom;

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
--Requete personnelle: Selectionner tous les capsules qui sont de plus qu'une heur 
-- en durée et les ordonner en decroissance, et montrer les 3 capsules les plus longues
--AUTEUR: BETTINA
--Fonctionelle: OUI

	SELECT c.id AS "ID capsule",
		c.duree AS "Durée capsule",
		a.nom AS "Avatar",
		a.moX AS "moX"
	FROM capsule AS c
	INNER JOIN avatar AS a ON c.avatar = a.nom
	INNER JOIN liste_activite_joueur AS ac ON c.activite = ac.activite
	AND c.duree >= 3600
	ORDER BY c.duree DESC
	LIMIT 3;

--Requete #7B (4 tables)
--auteur: Francois
--Fonctionelle: oui
-- 
--Affiche chaque avatar possedant des cactus ainsi que le joueur associé et le nombre de cactus en inventaire, affiche le temps de jeu total(converti en minute) et le nombre d'activité total du joueur
--Détermine le cps(cactus par seconde) de chaque avatar. La table est classée par le cps le plus élevés. Nous avons maintenant le leaderboard global des joueurs ayant le meilleur rendement de cultivation de cactus avec leurs nombres d'activité.

SELECT 
	ja.joueur AS "Joueur", 
	ja.avatar AS "Avatar",
	ia.quantite AS "Cactus par Avatar",
	ROUND(SUM(cap.duree)/60,0)|| ' ' ||'minutes' AS "Temps de jeu total",
	ROUND(ia.quantite / SUM(cap.duree), 3)|| ' ' ||'c/s' AS "Cactus par seconde",
	COUNT(DISTINCT aj.activite) AS "Activités"
		FROM capsule AS cap
			INNER JOIN liste_item_avatar AS ia 
			ON ia.avatar = cap.avatar
			INNER JOIN liste_avatar_joueur AS ja 
			ON ja.avatar = ia.avatar 
			INNER JOIN liste_activite_joueur AS aj 
			ON aj.joueur = ja.joueur
				WHERE ia.item = 'Cactus'
					GROUP BY ja.avatar, ja.joueur, ia.quantite
					ORDER BY "Cactus par seconde" DESC, ja.joueur, ja.avatar


---- REQUETE-7C -------------------
--No de la requête: 7 (5 tables)
--Énoncé de la requête: 
--a. il doit avoir au minimum 5 tables dans l’une de votre requête
--b. vous devez utiliser ces clauses: LIMIT, GROUP BY, ORDER BY, HAVING. 
--Auteur: Yosef 
--Fonctionnelle: Oui
--Permet de voir les mondes en fonction de leur nombre de visites,de leur moyenne de temps par visite(doit être plus grand que 5 minutes)
--ainsi que le joueur qui a visité ce monde le plus de fois avec son nombre de visites.

SELECT 
  jeu.nom AS "Monde",
  jeu.sigle AS "Sigle",
  COUNT(DISTINCT lmd.id) AS "Nombres de visites par monde",
  
  (SELECT laj.joueur || ' ' || COUNT(*) || ' visite(s)'
   FROM liste_activite_joueur AS laj
   		INNER JOIN activite AS act
   			ON laj.activite = act.id
   		INNER JOIN capsule AS cps
   			ON act.id = cps.activite
   		INNER JOIN liste_monde_duree AS lmd
   			ON cps.id = lmd.capsule
   WHERE lmd.jeu = jeu.nom
   GROUP BY laj.joueur
   ORDER BY COUNT(*) DESC LIMIT 1
  ) AS "Joueur le plus actif/visites",
  
  ROUND((AVG(lmd.duree)/60),2) AS "Moyenne du temps passé (minutes)/Joueur" 
FROM jeu	
	INNER JOIN liste_monde_duree AS lmd 
		ON jeu.nom = lmd.jeu
	INNER JOIN capsule AS cps 
		ON lmd.capsule = cps.id
	INNER JOIN activite AS act 
		ON cps.activite = act.id
GROUP BY jeu.nom, jeu.sigle
HAVING ROUND(AVG(lmd.duree)/60, 2) > 5
ORDER BY "Nombres de visites par monde" DESC
LIMIT 3;

-- REQUETE 7D (5 tables)
--Requete personnelle: Selectionner les 3 avatars avec les plus de items, les ordonner en décroissance tout en montrant
-- le joueur assigné ainsi que la date de création de l'avatar, la phrase favorite de l'avatar ainsi que la duree de jeu total de l'avatar
--AUTEUR: JUSTIN 
--Fonctionelle: OUI

SELECT 
    SUM(items.quantite) AS Items, 
    items.avatar, 
    capsule.duree as "DUREE DE JEU",
    liste_avatar_joueur.joueur, 
    avatar.date_creation
FROM 
    liste_item_avatar AS items
INNER JOIN 
    liste_avatar_joueur ON liste_avatar_joueur.avatar = items.avatar
INNER JOIN 
    avatar ON avatar.nom = liste_avatar_joueur.avatar
INNER JOIN 
    (SELECT avatar, SUM(duree) AS duree FROM capsule GROUP BY avatar) AS capsule 
    ON capsule.avatar = items.avatar
INNER JOIN 
    (SELECT avatar, MAX(phrase) AS phrase FROM liste_phrase_avatar GROUP BY avatar) AS liste_phrase_avatar 
    ON liste_phrase_avatar.avatar = items.avatar
GROUP BY 
    items.avatar, avatar.date_creation, liste_avatar_joueur.joueur, capsule.duree
HAVING 
    SUM(items.quantite) > 50
ORDER BY 
    Items DESC
LIMIT 3;




		 
		 







