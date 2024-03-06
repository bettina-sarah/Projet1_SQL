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

-- REQUETE 7D (5 tables)
--Requete personnelle: Selectionner les 3 avatars avec les plus de items, les ordonner en décroissance tout en montrant
-- le joueur assigné ainsi que la date de création de l'avatar, la phrase favorite de l'avatar ainsi que sa couleur préféré
--AUTEUR: JUSTIN 
--Fonctionelle: OUI

SELECT 
    SUM(items.quantite) AS Items, 
    items.avatar, 
    MAX(liste_phrase_avatar.phrase) AS phrase, 
    CONCAT(
        ((a.couleur1 >> 16) & 255),
        '-',
        ((a.couleur1 >> 8) & 255),
        '-',
        (a.couleur1 & 255)
    ) AS "couleur préféré en RGB", 
    liste_avatar_joueur.joueur, 
    avatar.date_creation
FROM 
    liste_item_avatar AS items
INNER JOIN 
    liste_avatar_joueur ON liste_avatar_joueur.avatar = items.avatar
INNER JOIN 
    avatar ON avatar.nom = liste_avatar_joueur.avatar
INNER JOIN 
    liste_couleur_avatar AS a ON a.avatar = items.avatar
INNER JOIN 
    (SELECT avatar, MAX(phrase) AS phrase FROM liste_phrase_avatar GROUP BY avatar) AS liste_phrase_avatar 
    ON liste_phrase_avatar.avatar = items.avatar
GROUP BY 
    items.avatar, a.couleur1, avatar.date_creation, liste_avatar_joueur.joueur
HAVING 
    SUM(items.quantite) > 50
ORDER BY 
    Items DESC 
LIMIT 3;