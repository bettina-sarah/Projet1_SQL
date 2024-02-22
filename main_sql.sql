-- ******************************** BETTINA --

DROP TABLE IF EXISTS liste_phrases CASCADE;
DROP TABLE IF EXISTS liste_couleurs CASCADE;
DROP TABLE IF EXISTS item CASCADE;
DROP TABLE IF EXISTS avatar CASCADE;
DROP TABLE IF EXISTS liste_items_avatar CASCADE;
DROP TABLE IF EXISTS liste_habiletes_avatar CASCADE;

CREATE TABLE liste_phrases (
	id			NUMERIC(7,0)		PRIMARY KEY,
	phrase		VARCHAR(64)			DEFAULT NULL
);

CREATE TABLE liste_couleurs (
	id				NUMERIC(7,0)		PRIMARY KEY,
	couleur1		INTEGER				NOT NULL,
	couleur2		INTEGER				DEFAULT NULL,
	couleur3		INTEGER				DEFAULT NULL
);

CREATE TABLE item (
	nom				VARCHAR(32)			PRIMARY KEY,
	sigle			CHAR(4)				UNIQUE,
	probabilite		NUMERIC(4,3)		DEFAULT 0.025,
	description		VARCHAR(1024)		DEFAULT NULL,
	
	CONSTRAINT sig CHECK (sigle LIKE 'I%'),
	CONSTRAINT prob CHECK (probabilite > 0.000 AND probabilite < 1.000)
);


CREATE TABLE avatar (
	nom							VARCHAR(32)		PRIMARY KEY,
	liste_phrases_avatar		NUMERIC(7,0),
	liste_couleurs_avatar		NUMERIC(7,0),
	date_creation				DATE			CHECK (date_creation >= CURRENT_DATE),
	moX							BIGINT			CHECK (moX BETWEEN -1000000000000 AND 1000000000000),
	liste_habiletes				NUMERIC(7,0),
	liste_items					NUMERIC(7,0)
);

CREATE TABLE liste_items_avatar (
	id							NUMERIC(7,0)		PRIMARY KEY,
	date_obtention				TIMESTAMP 			DEFAULT CURRENT_TIMESTAMP,
	quantite					BIGINT				DEFAULT 1,
	item						VARCHAR(32),
	
	CONSTRAINT quant CHECK (quantite BETWEEN 1 AND 1000000)
);

CREATE TABLE liste_habiletes_avatar (
	id							NUMERIC(7,0)		PRIMARY KEY,
	date_obtention				TIMESTAMP 			DEFAULT CURRENT_TIMESTAMP,
	niveau_actuel				INTEGER				DEFAULT 1,
	habilete					VARCHAR(32),
	
	CONSTRAINT niv CHECK (niveau_actuel BETWEEN 1 AND 100)
);



-- ******************************** YOSEF--

ALTER TABLE IF EXISTS jeu DROP CONSTRAINT IF EXISTS fk_jeu_items;
ALTER TABLE IF EXISTS jeu DROP CONSTRAINT IF EXISTS fk_jeu_habiletes;
ALTER TABLE IF EXISTS habilete DROP CONSTRAINT IF EXISTS fk_hab_lsCoef;
ALTER TABLE IF EXISTS liste_habilete_monde DROP CONSTRAINT IF EXISTS fk_habMon_hab;
ALTER TABLE IF EXISTS liste_items_monde DROP CONSTRAINT IF EXISTS fk_ItemMon_item;
ALTER TABLE IF EXISTS liste_avatars_capsule DROP CONSTRAINT IF EXISTS fk_avt_avt;
ALTER TABLE IF EXISTS liste_avatars_capsule DROP CONSTRAINT IF EXISTS fk_avt_vis;
ALTER TABLE IF EXISTS liste_monde_duree DROP CONSTRAINT IF EXISTS fk_mon_dur;
ALTER TABLE IF EXISTS monde_duree DROP CONSTRAINT IF EXISTS fk_mon_duree;

DROP TABLE IF EXISTS jeu CASCADE;
DROP TABLE IF EXISTS liste_habilete_monde CASCADE;
DROP TABLE IF EXISTS habilete CASCADE;
DROP TABLE IF EXISTS liste_coefs_habilete CASCADE;
DROP TABLE IF EXISTS liste_items_monde CASCADE;
DROP TABLE IF EXISTS liste_avatars_capsule CASCADE;
DROP TABLE IF EXISTS liste_monde_duree CASCADE;
DROP TABLE IF EXISTS monde_duree CASCADE;

CREATE TABLE jeu(
nom VARCHAR(16),
sigle CHAR(6),
description TEXT,
liste_item_rare NUMERIC(7,0),
liste_habiletes NUMERIC(7,0),

CONSTRAINT Pk_Jeu PRIMARY KEY (nom),
CONSTRAINT cc_jeu_text CHECK(LENGTH(description)<=2048),
CONSTRAINT cc_jeu_nom UNIQUE(nom),
CONSTRAINT cc_jeu_sigUN UNIQUE(sigle)
);

CREATE TABLE habilete(
nom VARCHAR(32),
sigle CHAR(3),
energie_maximum NUMERIC(7,3),
liste_de_coef NUMERIC(7,0),
description VARCHAR(1024),

CONSTRAINT Pk_Habilete PRIMARY KEY (nom),
CONSTRAINT cc_hab_nom UNIQUE(nom),
CONSTRAINT cc_hab_ener CHECK(energie_maximum BETWEEN 0 AND 1000),
CONSTRAINT cc_hab_sig CHECK(sigle LIKE 'S%'),
CONSTRAINT cc_hab_sigUN UNIQUE(sigle)
);

CREATE TABLE liste_coefs_habilete(
id NUMERIC(7,0),
coef1 DOUBLE PRECISION DEFAULT 0,
coef2 DOUBLE PRECISION DEFAULT 0,
coef3 DOUBLE PRECISION DEFAULT 1,
	
CONSTRAINT Pk_ListCoef PRIMARY KEY (id)
);

CREATE TABLE liste_habilete_monde(
id NUMERIC(7,0),
habilete VARCHAR(32),	
	
CONSTRAINT Pk_ListHabilete PRIMARY KEY (id)
);

CREATE TABLE liste_items_monde(
id NUMERIC(7,0),
item VARCHAR(32),

CONSTRAINT Pk_ListItems PRIMARY KEY (id)

);

CREATE TABLE liste_avatars_capsule(
id NUMERIC(7,0),
avatar VARCHAR(32),
visite NUMERIC(7,0),
	
CONSTRAINT Pk_List_avatars PRIMARY KEY (id)
);

CREATE TABLE liste_monde_duree(
id NUMERIC(7,0),
monde_duree NUMERIC(7,0),

CONSTRAINT Pk_List_monde PRIMARY KEY (id)
);

CREATE TABLE monde_duree(
id NUMERIC(7,0),
monde VARCHAR(16),
duree BIGINT,

CONSTRAINT Pk_mon_duree PRIMARY KEY (id),
CONSTRAINT cc_duree	CHECK(duree > 0)
);



-- -- ******************************** FRANK


DROP TABLE IF EXISTS joueur CASCADE;
DROP TABLE IF EXISTS activite CASCADE;
DROP TABLE IF EXISTS capsule CASCADE;
DROP TABLE IF EXISTS activite_joueur CASCADE;
DROP TABLE IF EXISTS capsule_activite CASCADE;
DROP TABLE IF EXISTS avatar_joueur CASCADE;


-- ################################### Creation de la table Joueur ###################################
DROP TYPE IF EXISTS genre_joueur;
CREATE TYPE genre_joueur AS ENUM
	('f','h','x');
CREATE TABLE joueur(
	alias				VARCHAR(128),
	courriel			VARCHAR(32) 	UNIQUE,
	genre				genre_joueur	NULL,
	date_inscription	DATE,
	date_naissance		DATE,
	liste_activites		NUMERIC(7,0),
	liste_avatars		NUMERIC(7,0),
	
	CONSTRAINT pk_alias		PRIMARY KEY (alias),
	CONSTRAINT cins	 		CHECK(date_inscription > TO_DATE('2020-01-01', 'yyyy-mm-dd')),
	CONSTRAINT cnai	 		CHECK(date_naissance > TO_DATE('1900-01-01', 'yyyy-mm-dd')),
	CONSTRAINT cage	 		CHECK((date_inscription - date_naissance) >= 13)								
);

-- ################################### Creation de la table activité ###################################
CREATE TABLE activite(
	id							NUMERIC(7,0),
	debut_activite				TIMESTAMP,
	liste_capsules_activite		NUMERIC(7,0),
	
	CONSTRAINT pk_id_act	PRIMARY KEY (id)
);

-- ################################### Creation de la table Capsule ###################################
CREATE TABLE capsule(
	id							NUMERIC(7,0),
	liste_avatars				NUMERIC(7,0),
	duree						BIGINT,

	CONSTRAINT pk_id_cap	PRIMARY KEY (id),
	CONSTRAINT c_duree		CHECK(duree > 0)
);

-- ################################### Creation de la table intermédiaire activité-joueur ###################################
CREATE TABLE activite_joueur(
	id						NUMERIC(7,0),
	activite				NUMERIC(7,0),
	CONSTRAINT pk_id		PRIMARY KEY (id)
);

-- ################################### Creation de la table intermédiaire capsule-activite ###################################
CREATE TABLE capsule_activite(
	id							NUMERIC(7,0),
	capsule						NUMERIC(7,0),
	
	CONSTRAINT pk_id_cap_act	PRIMARY KEY(id)
);

-- ################################### Creation de la table intermédiaire avatar-joueur ###################################
CREATE TABLE avatar_joueur(
	id						NUMERIC(7,0),
	avatar						VARCHAR(32),
	
	CONSTRAINT pk_id_ava_jou			PRIMARY KEY(id)
);


-- ******************************** FOREIGN KEYS **********

-- FOREIGN KEYS BETTINA

ALTER TABLE IF EXISTS avatar DROP CONSTRAINT IF EXISTS fk_av_phrases;
ALTER TABLE IF EXISTS avatar DROP CONSTRAINT IF EXISTS fk_av_couleurs;
ALTER TABLE IF EXISTS avatar DROP CONSTRAINT IF EXISTS fk_av_habiletes;
ALTER TABLE IF EXISTS avatar DROP CONSTRAINT IF EXISTS fk_av_items;

ALTER TABLE avatar
    ADD CONSTRAINT fk_av_phrases FOREIGN KEY (liste_phrases_avatar) REFERENCES liste_phrases(id),
	ADD CONSTRAINT fk_av_couleurs FOREIGN KEY (liste_couleurs_avatar) REFERENCES liste_couleurs(id),
	ADD CONSTRAINT fk_av_habiletes FOREIGN KEY (liste_habiletes) REFERENCES liste_habiletes_avatar(id),
	ADD CONSTRAINT fk_av_items FOREIGN KEY (liste_items) REFERENCES liste_items_avatar(id);

ALTER TABLE liste_items_avatar
	ADD CONSTRAINT fk_item_avatar FOREIGN KEY (item) REFERENCES item(nom);
	
ALTER TABLE liste_habiletes_avatar
	ADD CONSTRAINT fk_hab_av FOREIGN KEY (habilete) REFERENCES habilete(nom);
	
-- FOREIGN KEYS YOSEF
	
ALTER TABLE jeu
	ADD CONSTRAINT fk_jeu_items FOREIGN KEY (liste_item_rare) REFERENCES liste_items_monde(id)
 	ON DELETE CASCADE ON UPDATE CASCADE,
	ADD CONSTRAINT fk_jeu_habiletes FOREIGN KEY (liste_habiletes) REFERENCES liste_habilete_monde(id)
	ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Habilete
	ADD CONSTRAINT fk_hab_lsCoef FOREIGN KEY (liste_de_coef) REFERENCES liste_coefs_habilete(id)
	ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE liste_habilete_monde
	ADD CONSTRAINT fk_habMon_hab FOREIGN KEY (habilete) REFERENCES habilete(nom)
	ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE liste_items_monde
 	ADD CONSTRAINT fk_ItemMon_item FOREIGN KEY (item) REFERENCES item(nom)
 	ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE liste_avatars_capsule
	ADD CONSTRAINT fk_avt_avt FOREIGN KEY (avatar) REFERENCES avatar(nom)
	ON DELETE CASCADE ON UPDATE CASCADE,
	ADD CONSTRAINT fk_avt_vis FOREIGN KEY (visite) REFERENCES liste_monde_duree(id)
	ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE liste_monde_duree
	ADD CONSTRAINT fk_mon_dur FOREIGN KEY (monde_duree) REFERENCES monde_duree(id)
	ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE monde_duree
	ADD CONSTRAINT fk_mon_duree FOREIGN KEY (monde) REFERENCES jeu(nom)
	ON DELETE CASCADE ON UPDATE CASCADE;



-- FOREIGN KEYS frank

ALTER TABLE joueur
	ADD CONSTRAINT fk_liste_activite	
		FOREIGN KEY(liste_activites) REFERENCES activite_joueur(id);

ALTER TABLE joueur
	ADD CONSTRAINT fk_liste_avatars	
 		FOREIGN KEY(liste_avatars) REFERENCES avatar_joueur(id);
		
ALTER TABLE activite_joueur
	ADD CONSTRAINT fk_activites	
		FOREIGN KEY(activite) REFERENCES activite(id);
		
ALTER TABLE activite
	ADD CONSTRAINT fk_capsule_activite	
		FOREIGN KEY (liste_capsules_activite) REFERENCES capsule_activite(id);
		
ALTER TABLE capsule_activite
	ADD CONSTRAINT fk_capsule	
		FOREIGN KEY (capsule) REFERENCES capsule(id);
		
ALTER TABLE capsule
 	ADD CONSTRAINT fk_avatars_capsule	
 		FOREIGN KEY (liste_avatars) REFERENCES liste_avatars_capsule(id);
		

		









	
	
	
	
	
	
	
	
	
	
	
