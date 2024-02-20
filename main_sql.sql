DROP TABLE IF EXISTS liste_phrases CASCADE;
DROP TABLE IF EXISTS liste_couleurs CASCADE;
DROP TABLE IF EXISTS item CASCADE;
DROP TABLE IF EXISTS avatar CASCADE;
DROP TABLE IF EXISTS liste_items_avatar CASCADE;

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
	probabilite		NUMERIC(1,3)		DEFAULT 0.025,
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
	liste_habiletes_avatar		NUMERIC(7,0),
	liste_items_avatar			NUMERIC(7,0)
);

CREATE TABLE liste_items_avatar (
	id							NUMERIC(7,0)		PRIMARY KEY,
	date_obtention				TIMESTAMP 			DEFAULT CURRENT_TIMESTAMP,
	quantite					BIGINT				DEFAULT 1,
	item						VARCHAR(32),
	
	CONSTRAINT quant CHECK (quantite BETWEEN 1 AND 1000000),
	CONSTRAINT fk_item_avatar FOREIGN KEY (item) REFERENCES item(nom)
);




ALTER TABLE avatar
    ADD CONSTRAINT fk_av_phrases FOREIGN KEY (liste_phrases_avatar) REFERENCES liste_phrases(id),
	ADD CONSTRAINT fk_av_couleurs FOREIGN KEY (liste_couleurs_avatar) REFERENCES liste_couleurs(id),
	-- ADD CONSTRAINT fk_av_habiletes FOREIGN KEY (liste_habiletes_avatar) REFERENCES liste_habiletes(id),
	ADD CONSTRAINT fk_av_items FOREIGN KEY (liste_items_avatar) REFERENCES liste_items_avatar(id);
	
	
	
	
-------- YOSEF

-- ALTER TABLE IF EXISTS Jeu DROP CONSTRAINT IF EXISTS fk_jeu_items;
ALTER TABLE IF EXISTS Jeu DROP CONSTRAINT IF EXISTS fk_jeu_habiletes;
ALTER TABLE IF EXISTS Habilete DROP CONSTRAINT IF EXISTS fk_hab_lsCoef;
ALTER TABLE IF EXISTS ListeHabileteMonde DROP CONSTRAINT IF EXISTS fk_habMon_hab;

DROP TABLE IF EXISTS Jeu;
DROP TABLE IF EXISTS ListeHabileteMonde;
DROP TABLE IF EXISTS Habilete;
DROP TABLE IF EXISTS ListeCoefsHabilete;

CREATE TABLE Jeu(
nom VARCHAR(16),
sigle VARCHAR(6),
description TEXT,
listeItemRare NUMERIC(7,0),
listeHabiletes NUMERIC(7,0),

CONSTRAINT Pk_Jeu PRIMARY KEY (nom),
CONSTRAINT cc_jeu_text CHECK(LENGTH(description)<=2048),
CONSTRAINT cc_jeu_nom UNIQUE(nom),
CONSTRAINT cc_jeu_sigUN UNIQUE(sigle)
);

CREATE TABLE Habilete(
nom VARCHAR(32),
sigle VARCHAR(3),
energieMaximum NUMERIC(4,3),
listeDeCoef NUMERIC(7,0),
description VARCHAR(1024),

CONSTRAINT Pk_Habilete PRIMARY KEY (nom),
CONSTRAINT cc_hab_nom UNIQUE(nom),
CONSTRAINT cc_hab_ener CHECK(energieMaximum BETWEEN 0 AND 1000),
CONSTRAINT cc_hab_sig CHECK(sigle LIKE 'S%'),
CONSTRAINT cc_hab_sigUN UNIQUE(sigle)
);

CREATE TABLE ListeCoefsHabilete(
id NUMERIC(7,0),
coef1 DOUBLE PRECISION DEFAULT 0,
coef2 DOUBLE PRECISION DEFAULT 0,
coef3 DOUBLE PRECISION DEFAULT 1,
	
CONSTRAINT Pk_ListCoef PRIMARY KEY (id)
);

CREATE TABLE ListeHabileteMonde(
id NUMERIC(7,0),
habilete VARCHAR(32),	
	
CONSTRAINT Pk_ListHabilete PRIMARY KEY (id)
);

ALTER TABLE Jeu
-- 	ADD CONSTRAINT fk_jeu_items FOREIGN KEY (listeItemRare) REFERENCES listeItemsMonde(id)
-- 	ON DELETE CASCADE ON UPDATE CASCADE,
	ADD CONSTRAINT fk_jeu_habiletes FOREIGN KEY (listeHabiletes) REFERENCES ListeHabileteMonde(id)
	ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Habilete
	ADD CONSTRAINT fk_hab_lsCoef FOREIGN KEY (listeDeCoef) REFERENCES ListeCoefsHabilete(id)
	ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE ListeHabileteMonde
	ADD CONSTRAINT fk_habMon_hab FOREIGN KEY (habilete) REFERENCES Habilete(nom)
	ON DELETE CASCADE ON UPDATE CASCADE;



--------FRANC

-- ################################### Creation de la table Joueur ###################################
DROP TABLE IF EXISTS joueur CASCADE;
DROP TABLE IF EXISTS activite CASCADE;
DROP TABLE IF EXISTS capsule CASCADE;
DROP TABLE IF EXISTS activite_joueur CASCADE;
DROP TABLE IF EXISTS capsule_activite CASCADE;

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

-- ################################### ALTERS ###################################
ALTER TABLE joueur
	ADD CONSTRAINT fk_liste_activite	
		FOREIGN KEY(liste_activites) REFERENCES activite_joueur(id);
		
ALTER TABLE activite_joueur
	ADD CONSTRAINT fk_activites	
		FOREIGN KEY(activite) REFERENCES activite(id);
		
ALTER TABLE activite
	ADD CONSTRAINT fk_capsule_activite	
		FOREIGN KEY (liste_capsules_activite) REFERENCES capsule_activite(id);
		
ALTER TABLE capsule_activite
	ADD CONSTRAINT fk_capsule	
		FOREIGN KEY (capsule) REFERENCES capsule(id);
		
-- ALTER TABLE capsule
-- 	ADD CONSTRAINT fk_avatars_capsule	
-- 		FOREIGN KEY (liste_avatars) REFERENCES avatars_capsule(id_ava_cap);
		
-- ALTER TABLE joueur
-- 	ADD CONSTRAINT fk_liste_avatars	
-- 		FOREIGN KEY(liste_avatars) REFERENCES avatars_joueur(id_ava_jou);
		








	
	
	
	
	
	
	
	
