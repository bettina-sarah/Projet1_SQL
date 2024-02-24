
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

-- ################################### ALTERS ###################################
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
		
-- ALTER TABLE capsule
-- 	ADD CONSTRAINT fk_avatars_capsule	
-- 		FOREIGN KEY (liste_avatars) REFERENCES avatars_capsule(id);
		

		







