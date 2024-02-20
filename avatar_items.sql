DROP TABLE IF EXISTS liste_phrases;
DROP TABLE IF EXISTS liste_couleurs;
DROP TABLE IF EXISTS item;
DROP TABLE IF EXISTS avatar;
DROP TABLE IF EXISTS liste_items_avatar;



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
	probabilite		NUMERIC(1,3)		DEFAULT 0,025,
	description		VARCHAR(1024)		DEFAULT NULL,
	
	CONSTRAINT sig CHECK (sigle WHERE 'I%'),
	CONSTRAINT prob CHECK (probabilite > 0,000 AND probabilite < 1,000)
);


CREATE TABLE avatar (
	nom							VARCHAR(32)		PRIMARY KEY,
	liste_phrases_avatar		NUMERIC(7,0),
	liste_couleurs_avatar		NUMERIC(7,0),
	date_creation				DATE			CHECK (date_creation >= CURRENT_DATE),
	moX							BIGINT			CHECK (moX BETWEEN -1000000000000 AND 1000000000000),
	liste_habiletes_avatar		NUMERIC(7,0),
	liste_items_avatar			NUMERIC(7,0),
);

CREATE TABLE liste_items_avatar (
	id							NUMERIC(7,0)		PRIMARY KEY,
	date_obtention				TIMESTAMP 			DEFAULT CURRENT_TIMESTAMP,
	quantite					BIGINT				DEFAULT 1
	item						NUMERIC(7,0),
	
	CONSTRAINT quant CHECK (quantite BETWEEN 1 AND 1000000),
	CONSTRAINT fk_item_avatar FOREIGN KEY (item) REFERENCES nom(item)
);




ALTER TABLE avatar
    ADD CONSTRAINT fk_av_phrases FOREIGN KEY (liste_phrases) REFERENCES id(liste_phrases);
	ADD CONSTRAINT fk_av_couleurs FOREIGN KEY (liste_couleurs) REFERENCES id(liste_couleurs);
	-- ADD CONSTRAINT fk_av_habiletes FOREIGN KEY (liste_habiletes) REFERENCES id(liste_habiletes);
	ADD CONSTRAINT fk_av_items FOREIGN KEY (liste_phrases) REFERENCES id(liste_phrases);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
