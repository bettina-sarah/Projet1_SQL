-- REQUEST FRANK

--Requete #1
--Donnez la liste de tous les joueurs en présentant : alias, courriel, date d’inscription. 
--François
--Fonctionnel: OUI
SELECT alias, courriel, date_inscription FROM joueur;

--Requete #4
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

--Requete #7
--Détermine le cps(cactus par seconde) de chaque avatar, 
--Affiche le joueur associées à l'avatars, le temps de jeu total(converti en minute) par avatar ainsi que le nombre de cactus qu'il possède, 
--montre aussi le nombre d'activité total du joueur, les rangées sont classé par le cps le plus élevés. Nous avons maintenant le leaderboard global des joueurs ayant le meilleur rendement de cultivation de cactus
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




