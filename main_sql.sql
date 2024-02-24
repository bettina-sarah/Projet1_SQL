-- ******************************** BETTINA --

DROP TABLE IF EXISTS liste_phrase_avatar CASCADE;
DROP TABLE IF EXISTS liste_couleur_avatar CASCADE;
DROP TABLE IF EXISTS item CASCADE;
DROP TABLE IF EXISTS avatar CASCADE;
DROP TABLE IF EXISTS liste_item_avatar CASCADE;
DROP TABLE IF EXISTS liste_habilete_avatar CASCADE;

CREATE TABLE liste_phrase_avatar (
	id			NUMERIC(7,0)		PRIMARY KEY,
	phrase		VARCHAR(64)			DEFAULT NULL,
	avatar		VARCHAR(32)
);

CREATE TABLE liste_couleur_avatar (
	id				NUMERIC(7,0)		PRIMARY KEY,
	couleur1		INTEGER				NOT NULL,
	couleur2		INTEGER				DEFAULT NULL,
	couleur3		INTEGER				DEFAULT NULL,
	avatar			VARCHAR(32)
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
	nom			VARCHAR(32)		PRIMARY KEY,
	date_creation		DATE			CHECK (date_creation >= CURRENT_DATE),
	moX			BIGINT			CHECK (moX BETWEEN -1000000000000 AND 1000000000000)
);

CREATE TABLE liste_item_avatar (
	id					NUMERIC(7,0)		PRIMARY KEY,
	date_obtention				TIMESTAMP 			DEFAULT CURRENT_TIMESTAMP,
	quantite				BIGINT				DEFAULT 1,
	item					VARCHAR(32),
	avatar					VARCHAR(32),

	CONSTRAINT quant CHECK (quantite BETWEEN 1 AND 1000000)
);

CREATE TABLE liste_habilete_avatar (
	id					NUMERIC(7,0)		PRIMARY KEY,
	date_obtention				TIMESTAMP 		DEFAULT CURRENT_TIMESTAMP,
	niveau_actuel				INTEGER			DEFAULT 1,
	habilete				VARCHAR(32),
	avatar					VARCHAR(32),

	CONSTRAINT niv CHECK (niveau_actuel BETWEEN 1 AND 100)
);



-- ******************************** YOSEF--



DROP TABLE IF EXISTS jeu CASCADE;
DROP TABLE IF EXISTS liste_habilete_monde CASCADE;
DROP TABLE IF EXISTS habilete CASCADE;
DROP TABLE IF EXISTS liste_coef_habilete CASCADE;
DROP TABLE IF EXISTS liste_item_monde CASCADE;
DROP TABLE IF EXISTS capsule CASCADE;
DROP TABLE IF EXISTS liste_monde_duree CASCADE;


CREATE TABLE jeu(
nom VARCHAR(16),
sigle CHAR(6),
description TEXT,

CONSTRAINT Pk_Jeu PRIMARY KEY (nom),
CONSTRAINT cc_jeu_text CHECK(LENGTH(description)<=2048),
CONSTRAINT cc_jeu_nom UNIQUE(nom),
CONSTRAINT cc_jeu_sigUN UNIQUE(sigle)
);

CREATE TABLE habilete(
nom VARCHAR(32),
sigle CHAR(3),
energie_maximum NUMERIC(7,3),
description VARCHAR(1024),

CONSTRAINT Pk_Habilete PRIMARY KEY (nom),
CONSTRAINT cc_hab_nom UNIQUE(nom),
CONSTRAINT cc_hab_ener CHECK(energie_maximum BETWEEN 0 AND 1000),
CONSTRAINT cc_hab_sig CHECK(sigle LIKE 'S%'),
CONSTRAINT cc_hab_sigUN UNIQUE(sigle)
);

CREATE TABLE liste_coef_habilete(
id NUMERIC(7,0),
coef1 DOUBLE PRECISION DEFAULT 0,
coef2 DOUBLE PRECISION DEFAULT 0,
coef3 DOUBLE PRECISION DEFAULT 1,
habilete VARCHAR(32),
	
CONSTRAINT Pk_ListCoef PRIMARY KEY (id)
);

CREATE TABLE liste_habilete_monde(
id NUMERIC(7,0),
habilete VARCHAR(32),
jeu VARCHAR(16),
	
CONSTRAINT Pk_ListHabilete PRIMARY KEY (id)
);

CREATE TABLE liste_item_monde(
id NUMERIC(7,0),
item VARCHAR(32),
jeu VARCHAR(16),

CONSTRAINT Pk_ListItems PRIMARY KEY (id)
);



CREATE TABLE liste_monde_duree(
id NUMERIC(7,0),
duree BIGINT,
jeu VARCHAR(16),
capsule NUMERIC(7,0), 

CONSTRAINT Pk_List_monde PRIMARY KEY (id),
CONSTRAINT cc_duree	CHECK(duree > 0)
);


-- -- ******************************** FRANK


DROP TABLE IF EXISTS joueur CASCADE;
DROP TABLE IF EXISTS activite CASCADE;
DROP TABLE IF EXISTS capsule CASCADE;
DROP TABLE IF EXISTS liste_activite_joueur CASCADE;
DROP TABLE IF EXISTS liste_avatar_joueur CASCADE;


-- ################################### Creation de la table Joueur ###################################
DROP TYPE IF EXISTS genre_joueur;
CREATE TYPE genre_joueur AS ENUM
	('f','h','x');
CREATE TABLE joueur(
	alias			VARCHAR(128),
	mot_de_passe		VARCHAR(32),
	courriel		VARCHAR(32) 	UNIQUE,
	genre			genre_joueur	NULL,
	date_inscription	DATE,
	date_naissance		DATE,

	CONSTRAINT pk_alias		PRIMARY KEY (alias),
	CONSTRAINT cins	 		CHECK(date_inscription > TO_DATE('2020-01-01', 'yyyy-mm-dd')),
	CONSTRAINT cnai	 		CHECK(date_naissance > TO_DATE('1900-01-01', 'yyyy-mm-dd')),
	CONSTRAINT cage	 		CHECK((date_inscription - date_naissance) >= 13)								
);

-- ################################### Creation de la table activité ###################################
CREATE TABLE activite(
	id					NUMERIC(7,0),
	debut_activite		TIMESTAMP,
	
	CONSTRAINT pk_id_act	PRIMARY KEY (id)
);

-- ################################### Creation de la table Capsule ###################################

CREATE TABLE capsule(
	id 			NUMERIC(7,0),
	avatar 		VARCHAR(32),
	activite 	NUMERIC(7,0),
	duree		BIGINT,
	
CONSTRAINT Pk_List_avatars PRIMARY KEY (id),
CONSTRAINT cap_duree	CHECK(duree > 0)
);

-- ################################### Creation de la table intermédiaire activité-joueur ###################################
CREATE TABLE liste_activite_joueur(
	id				NUMERIC(7,0),
	activite			NUMERIC(7,0),
	joueur				VARCHAR(32),
	CONSTRAINT pk_id		PRIMARY KEY (id)
);

-- ################################### Creation de la table intermédiaire avatar-joueur ###################################
CREATE TABLE liste_avatar_joueur(
	id						NUMERIC(7,0),
	avatar						VARCHAR(32),
	joueur						VARCHAR(32),
	CONSTRAINT pk_id_ava_jou			PRIMARY KEY(id)
);


-- ******************************** FOREIGN KEYS **********

-- FOREIGN KEYS BETTINA

ALTER TABLE IF EXISTS liste_phrase_avatar DROP CONSTRAINT IF EXISTS fk_av_phrases;
ALTER TABLE IF EXISTS liste_couleur_avatar DROP CONSTRAINT IF EXISTS fk_av_couleurs;
ALTER TABLE IF EXISTS liste_item_avatar DROP CONSTRAINT IF EXISTS fk_ia_item;
ALTER TABLE IF EXISTS liste_item_avatar DROP CONSTRAINT IF EXISTS fk_ia_avatar;
ALTER TABLE IF EXISTS liste_habilete_avatar DROP CONSTRAINT IF EXISTS fk_ha_habilete;
ALTER TABLE IF EXISTS liste_habilete_avatar DROP CONSTRAINT IF EXISTS fk_hab_avatar;

ALTER TABLE liste_phrase_avatar
    ADD CONSTRAINT fk_av_phrases FOREIGN KEY (avatar) REFERENCES avatar(nom);
ALTER TABLE liste_couleur_avatar
	ADD CONSTRAINT fk_av_couleurs FOREIGN KEY (avatar) REFERENCES avatar(nom);

ALTER TABLE liste_item_avatar
	ADD CONSTRAINT fk_ia_item FOREIGN KEY (item) REFERENCES item(nom),
	ADD CONSTRAINT fk_ia_avatar FOREIGN KEY (avatar) REFERENCES avatar(nom);
	
ALTER TABLE liste_habilete_avatar
	ADD CONSTRAINT fk_ha_habilete FOREIGN KEY (habilete) REFERENCES habilete(nom),
	ADD CONSTRAINT fk_hab_avatar  FOREIGN KEY (avatar) REFERENCES avatar(nom);
	
-- FOREIGN KEYS YOSEF

ALTER TABLE IF EXISTS habilete DROP CONSTRAINT IF EXISTS fk_hab_lsCoef;
ALTER TABLE IF EXISTS liste_habilete_monde DROP CONSTRAINT IF EXISTS fk_habMon_hab;
ALTER TABLE IF EXISTS liste_habilete_monde DROP CONSTRAINT IF EXISTS  fk_habMon_jeu;
ALTER TABLE IF EXISTS liste_item_monde DROP CONSTRAINT IF EXISTS fk_ItemMon_item;
ALTER TABLE IF EXISTS liste_item_monde DROP CONSTRAINT IF EXISTS fk_ItemMon_jeu;
ALTER TABLE IF EXISTS liste_monde_duree DROP CONSTRAINT IF EXISTS fk_mon_dur_cap;
ALTER TABLE IF EXISTS liste_monde_duree DROP CONSTRAINT IF EXISTS fk_mon_dur_jeu;


ALTER TABLE liste_coef_habilete
	ADD CONSTRAINT fk_hab_lsCoef FOREIGN KEY (habilete) REFERENCES habilete(nom)
	ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE liste_habilete_monde
	ADD CONSTRAINT fk_habMon_hab FOREIGN KEY (habilete) REFERENCES habilete(nom)
	ON DELETE CASCADE ON UPDATE CASCADE,
	ADD CONSTRAINT fk_habMon_jeu FOREIGN KEY (jeu) REFERENCES jeu(nom)
	ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE liste_item_monde
 	ADD CONSTRAINT fk_ItemMon_item FOREIGN KEY (item) REFERENCES item(nom)
 	ON DELETE CASCADE ON UPDATE CASCADE,
	ADD CONSTRAINT fk_ItemMon_jeu FOREIGN KEY (jeu) REFERENCES jeu(nom)
	ON DELETE CASCADE ON UPDATE CASCADE;



ALTER TABLE liste_monde_duree
	ADD CONSTRAINT fk_mon_dur_cap FOREIGN KEY (capsule) REFERENCES capsule(id)
	ON DELETE CASCADE ON UPDATE CASCADE,
	ADD CONSTRAINT fk_mon_dur_jeu FOREIGN KEY (jeu) REFERENCES jeu(nom)
	ON DELETE CASCADE ON UPDATE CASCADE;


-- FOREIGN KEYS frank

ALTER TABLE IF EXISTS liste_activite_joueur DROP CONSTRAINT IF EXISTS fk_acjo_ac;
ALTER TABLE IF EXISTS liste_activite_joueur DROP CONSTRAINT IF EXISTS fk_acjo_jo;
ALTER TABLE IF EXISTS capsule DROP CONSTRAINT IF EXISTS fk_cap_avt;
ALTER TABLE IF EXISTS capsule DROP CONSTRAINT IF EXISTS fk_cap_act;
ALTER TABLE IF EXISTS liste_avatar_joueur DROP CONSTRAINT IF EXISTS fk_aj_avatar;
ALTER TABLE IF EXISTS liste_avatar_joueur DROP CONSTRAINT IF EXISTS fk_aj_joueur;
		
ALTER TABLE liste_activite_joueur
	ADD CONSTRAINT fk_acjo_ac	
		FOREIGN KEY(activite) REFERENCES activite(id),
	ADD CONSTRAINT fk_acjo_jo	
		FOREIGN KEY(joueur) REFERENCES joueur(alias);
		
ALTER TABLE liste_avatar_joueur
	ADD CONSTRAINT fk_aj_avatar 
		FOREIGN KEY (avatar) REFERENCES avatar(nom),
	ADD CONSTRAINT fk_aj_joueur	
		FOREIGN KEY(joueur) REFERENCES joueur(alias);
		
ALTER TABLE capsule
	ADD CONSTRAINT fk_cap_avt 
		FOREIGN KEY (avatar) REFERENCES avatar(nom);
ALTER TABLE capsule		
		ADD CONSTRAINT fk_cap_act 
		FOREIGN KEY (activite) REFERENCES activite(id);


		

	