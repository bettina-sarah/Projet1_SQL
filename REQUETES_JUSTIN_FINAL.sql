--- REQUETE 2 ---
-- ENONCÉ: Donnez la liste des avatars d’un joueur quelconque (pour l’exemple, prendre le joueur principal),
--en donnant : nom, la couleur préférée transformée en trois composantes rouge-vert-bleu, date
--de création suivant le format 2000 | 12 | 25, le nombre de moX.
--AUTEUR: JUSTIN
--Fonctionelle: OUI

SELECT
    a.avatar AS Avatar,
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
	
Where laj.joueur ='Francois Bouchard*';

-- REQUETE 7 (3 tables)
--Requete personnelle: Selectionner les 3 joueurs avec les plus de items, les ordonner en décroissance tout en montrant
-- le joueur assigné ainsi que la date de création de l'avatar
--AUTEUR: JUSTIN 
--Fonctionelle: OUI

SELECT SUM(items.quantite)AS Items, items.avatar, liste_avatar_joueur.joueur, avatar.date_creation
FROM liste_item_avatar as items
INNER JOIN liste_avatar_joueur on liste_avatar_joueur.avatar = items.avatar
INNER JOIN avatar on avatar.nom = liste_avatar_joueur.avatar
GROUP BY items.avatar, liste_avatar_joueur.joueur, avatar.date_creation
HAVING SUM(items.quantite) > 50
ORDER by Items DESC 
LIMIT 3
