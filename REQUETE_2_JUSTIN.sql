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
	
Where laj.joueur ='Francois Bouchard*'

