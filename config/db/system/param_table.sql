/*********************************************************
**********************************************************
**********************************************************
**********************************************************
*************   Uncomment ADMIN Account  *****************
**********************************************************
**********************************************************
**********************************************************
**********************************************************
*********************************************************/



DROP TABLE IF EXISTS uac_param;
CREATE TABLE IF NOT EXISTS uac_param (
  `key_code` CHAR(7) NOT NULL,
  `description` VARCHAR(50) NOT NULL,
  `par_int` INT NULL,
  `par_code` VARCHAR(50) NULL,
  `par_date` DATE NULL,
  `par_value` VARCHAR(500) NULL,
  `par_time` TIME NULL,
  `last_update` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`key_code`));



INSERT IGNORE INTO uac_param (key_code, description, par_value) VALUES ('MSGASSI', 'Message to display for dash assiduite', 'Les Absences et Quittés des L2, L3, M1 et M2 ont été remises à zéro pour la rentrée de Jeudi 13 Avril 2023.');

INSERT IGNORE INTO uac_param (key_code, description, par_value, par_int, par_code) VALUES ('SYURLIE', 'URL Internet', 'https://www.maviescolaire.com', NULL, NULL);
INSERT IGNORE INTO uac_param (key_code, description, par_int, par_code) VALUES ('SCANXXX', 'Flow retard', NULL, NULL);
INSERT IGNORE INTO uac_param (key_code, description, par_int, par_code) VALUES ('MLWELCO', 'Mail Welcome qui envoie details', NULL, NULL);
INSERT IGNORE INTO uac_param (key_code, description, par_int, par_code) VALUES ('ASSIDUI', 'Compute assiduite agains scan edt', NULL, NULL);
INSERT IGNORE INTO uac_param (key_code, description, par_int, par_code) VALUES ('RESASSI', 'Reset Assiduite for the day', NULL, NULL);


INSERT IGNORE INTO uac_param (key_code, description, par_int, par_code) VALUES ('MANLODU', 'Manual load MDL user', NULL, NULL);
INSERT IGNORE INTO uac_param (key_code, description, par_int, par_code) VALUES ('MANMDLU', 'Manual creation MDL user', NULL, NULL);

-- both following will be deprecated
INSERT IGNORE INTO uac_param (key_code, description, par_value, par_int, par_code) VALUES ('ASSLATE', 'Late maximum consideration', ':15:00', NULL, NULL);
INSERT IGNORE INTO uac_param (key_code, description, par_value, par_int, par_code) VALUES ('ASSWAIT', 'Attente script avant compute', ':25:00', NULL, NULL);

INSERT IGNORE INTO uac_param (key_code, description, par_int, par_code) VALUES ('ASSHLAT', 'Half late consideration minute LAT', 15, NULL);
INSERT IGNORE INTO uac_param (key_code, description, par_int, par_code) VALUES ('ASSHVLA', 'Half Very late consideration minute VLA', 59, NULL);
INSERT IGNORE INTO uac_param (key_code, description, par_int, par_code) VALUES ('ASSHWAI', 'Half late consideration minute', 25, NULL);

INSERT IGNORE INTO uac_param (key_code, description, par_value, par_int, par_code) VALUES ('ASSWAIT', 'Attente script avant compute', ':25:00', NULL, NULL);

INSERT IGNORE INTO uac_param (key_code, description, par_int, par_code) VALUES ('SCANPRG', 'Flow purge scan', 5, NULL);
INSERT IGNORE INTO uac_param (key_code, description, par_int, par_code) VALUES ('ASSIPRG', 'Flow purge assiduite', 10, NULL);
INSERT IGNORE INTO uac_param (key_code, description, par_int, par_code) VALUES ('GENEPRG', 'Flow purge generic', 10, NULL);

INSERT IGNORE INTO uac_param (key_code, description, par_int, par_code) VALUES ('DMAILLI', 'Limit of max email per day', 50, NULL);
INSERT IGNORE INTO uac_param (key_code, description, par_int, par_code) VALUES ('DMAILCT', 'Counter limit of email per day', 0, NULL);
INSERT IGNORE INTO uac_param (key_code, description, par_int, par_code) VALUES ('DMAILBA', 'Batch email per day', 10, NULL);
INSERT IGNORE INTO uac_param (key_code, description, par_int, par_code) VALUES ('EDTLOAD', 'Integration des EDT', NULL, NULL);
INSERT IGNORE INTO uac_param (key_code, description, par_int, par_code) VALUES ('EDTPRGL', 'Flow purge edt load', 5, NULL);
INSERT IGNORE INTO uac_param (key_code, description, par_int, par_code) VALUES ('EDTPRGC', 'Flow purge edt core', 70, NULL);

INSERT IGNORE INTO uac_param (key_code, description, par_int, par_code) VALUES ('GRALOAD', 'Integration des notes', NULL, NULL);



INSERT IGNORE INTO uac_param (key_code, description, par_int, par_code) VALUES ('QUEASSI', 'Queue Assiduite', NULL, NULL);

-- Payment
INSERT IGNORE INTO uac_param (key_code, description, par_int, par_code) VALUES ('PAYDSHV', 'Frais de scolarite module active Y oui N non', NULL, 'Y');
INSERT IGNORE INTO uac_param (key_code, description, par_int, par_code) VALUES ('PAYPUBL', 'Frais de scolarite dashboard visible Y oui N non', NULL, 'Y');
INSERT IGNORE INTO uac_param (key_code, description, par_int, par_code) VALUES ('PAYLEXX', 'Frais de scolarite limite Lette Engagement en j', 40, NULL);

-- Daily Token for the Payment Date
INSERT IGNORE INTO uac_param (key_code, description) VALUES ('TOKPAYD', 'Token daily for payement TOKDAND Current Date');

-- Daily Token for EDT
INSERT IGNORE INTO uac_param (key_code, description) VALUES ('TOKEDTD', 'Token daily for EDT TOKEDTD Current Date');

-- Daily Token Generic
INSERT IGNORE INTO uac_param (key_code, description) VALUES ('TOKEGEN', 'Token daily generic operation Current Date');

INSERT IGNORE INTO uac_param (key_code, description, par_int, par_code) VALUES ('MVOLOAD', 'Integration Mvola', NULL, NULL);
INSERT IGNORE INTO uac_param (key_code, description, par_int, par_code) VALUES ('MVOLUPD', 'Last update Mvola', NULL, NULL);
-- INSERT IGNORE INTO uac_param (key_code, description, par_int, par_code) VALUES ('TELMVOL', 'Mvola phone number', NULL, '346776199');
-- PROD
INSERT IGNORE INTO uac_param (key_code, description, par_int, par_code) VALUES ('MVOLTEL', 'Mvola phone number', NULL, '344960000');

INSERT IGNORE INTO uac_param (key_code, description, par_int, par_date) VALUES ('TECYEAR', 'Start of Year', NULL, '2023-11-01');


-- Grade
INSERT IGNORE INTO uac_param (key_code, description, par_int, par_code) VALUES ('GRAMODV', 'Notes module visible Y oui N non', NULL, 'Y');
INSERT IGNORE INTO uac_param (key_code, description, par_int, par_code) VALUES ('GRAPUBL', 'Notes dashboard visible etudiant Y oui N non', NULL, 'Y');
INSERT IGNORE INTO uac_param (key_code, description, par_int, par_code) VALUES ('GRASTUL', 'Limite nombre student par page', 32, NULL);
INSERT IGNORE INTO uac_param (key_code, description, par_int, par_code) VALUES ('GRAJPGL', 'Taille limite fichier JPG en ko', 300, NULL);


INSERT IGNORE INTO uac_param (key_code, description, par_value, par_code) VALUES ('GRACSBK', 'Default cross bookmark', '1428.61/-771px/-144px/0', NULL);



INSERT IGNORE INTO uac_param (key_code, description, par_value) VALUES ('CYEARTC', 'Current year technical', '2024');

INSERT IGNORE INTO uac_param (key_code, description, par_value) VALUES ('PYEARTC', 'Previous year technical', '2023');
INSERT IGNORE INTO uac_param (key_code, description, par_value) VALUES ('PYEARAA', 'Previous year verbose', '2022-23');
INSERT IGNORE INTO uac_param (key_code, description, par_value) VALUES ('APPLNKL', 'Google app link form licence new', 'https://forms.gle/4HyFVNyeEm1ZkPkF8');
INSERT IGNORE INTO uac_param (key_code, description, par_value) VALUES ('APPLNKM', 'Google app link form master new', 'https://forms.gle/bC2FyQCWMZtUL9GPA');


INSERT IGNORE INTO uac_param (key_code, description, par_time) VALUES ('LSTCRSD', 'Last course time end of the day', '18:00:00');

INSERT IGNORE INTO uac_param (key_code, description, par_int) VALUES ('MINAMOU', 'Minimum amount to pay', 100);
INSERT IGNORE INTO uac_param (key_code, description, par_value) VALUES ('YEARAAA', 'Yearly verbose', '2023-24');






DROP TABLE IF EXISTS uac_working_flow;
CREATE TABLE IF NOT EXISTS uac_working_flow (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `flow_code` CHAR(7) NOT NULL,
  `status` CHAR(3) NOT NULL,
  `working_date` DATE NULL,
  `working_part` TINYINT NOT NULL DEFAULT 0,
  `filename` VARCHAR(300) NULL,
  `comment` VARCHAR(500) NULL,
  `last_update` DATETIME NULL,
  `create_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`));


-- Cohort System

DROP TABLE IF EXISTS uac_ref_mention;
CREATE TABLE IF NOT EXISTS uac_ref_mention (
  `par_code` CHAR(5) NOT NULL,
  `title` VARCHAR(50) NULL,
  `description` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`par_code`));

INSERT IGNORE INTO uac_ref_mention (par_code, title, description) VALUES ('GRAD6', '6TH', '6TH GRADE');
INSERT IGNORE INTO uac_ref_mention (par_code, title, description) VALUES ('GRAD7', '7TH', '7TH GRADE');
INSERT IGNORE INTO uac_ref_mention (par_code, title, description) VALUES ('GRAD8', '8TH', '8TH GRADE');
INSERT IGNORE INTO uac_ref_mention (par_code, title, description) VALUES ('GRAD9', '9TH', '9TH GRADE');
INSERT IGNORE INTO uac_ref_mention (par_code, title, description) VALUES ('GRA10', '10TH', '10TH GRADE');
INSERT IGNORE INTO uac_ref_mention (par_code, title, description) VALUES ('GRA11', '11TH', '11TH GRADE');
INSERT IGNORE INTO uac_ref_mention (par_code, title, description) VALUES ('GRA12', '12TH', '12TH GRADE');
INSERT IGNORE INTO uac_ref_mention (par_code, title, description) VALUES ('GRA13', '13TH', '13TH GRADE');


DROP TABLE IF EXISTS uac_ref_niveau;
CREATE TABLE IF NOT EXISTS uac_ref_niveau (
  `par_code` CHAR(2) NOT NULL,
  `title` VARCHAR(50) NULL,
  PRIMARY KEY (`par_code`));

INSERT IGNORE INTO uac_ref_niveau (par_code, title) VALUES ('AX', 'A');
INSERT IGNORE INTO uac_ref_niveau (par_code, title) VALUES ('BX', 'B');
INSERT IGNORE INTO uac_ref_niveau (par_code, title) VALUES ('CX', 'C');
INSERT IGNORE INTO uac_ref_niveau (par_code, title) VALUES ('DX', 'D');
INSERT IGNORE INTO uac_ref_niveau (par_code, title) VALUES ('EX', 'E');

DROP TABLE IF EXISTS uac_ref_parcours;
CREATE TABLE IF NOT EXISTS uac_ref_parcours (
  `id` INT UNSIGNED NOT NULL,
  `title` VARCHAR(50) NOT NULL,
  `description` VARCHAR(100) NULL,
  PRIMARY KEY (`id`));

INSERT IGNORE INTO uac_ref_parcours (id, title) VALUES (1, 'na');

DROP TABLE IF EXISTS uac_ref_groupe;
CREATE TABLE IF NOT EXISTS uac_ref_groupe (
  `id` INT UNSIGNED NOT NULL,
  `title` VARCHAR(50) NULL,
  PRIMARY KEY (`id`));

INSERT IGNORE INTO uac_ref_groupe (id, title) VALUES (1, 'na');
INSERT IGNORE INTO uac_ref_groupe (id, title) VALUES (2, 'Groupe 1');
INSERT IGNORE INTO uac_ref_groupe (id, title) VALUES (3, 'Groupe 2');
INSERT IGNORE INTO uac_ref_groupe (id, title) VALUES (4, 'Groupe 3');
INSERT IGNORE INTO uac_ref_groupe (id, title) VALUES (5, 'Groupe 4');

DROP TABLE IF EXISTS uac_cohort;
CREATE TABLE IF NOT EXISTS uac_cohort (
  `id` INT UNSIGNED NOT NULL,
  `mention` CHAR(5) NOT NULL,
  `niveau` CHAR(2) NOT NULL,
  `parcours_id` INT NOT NULL,
  `groupe_id` INT NOT NULL,
  PRIMARY KEY (`id`));



  -- INSERT IGNORE INTO uac_cohort (id, mention, niveau, parcours_id, groupe_id) VALUES (1, (SELECT par_code FROM uac_ref_mention WHERE title = 'COMMUNICATION'), 'L1', (SELECT id FROM uac_ref_parcours WHERE title = 'na'), (SELECT id FROM uac_ref_groupe WHERE title = 'na'));

  INSERT IGNORE INTO uac_cohort (id, mention, niveau, parcours_id, groupe_id) VALUES (1,'GRAD6','AX',1,1);
  INSERT IGNORE INTO uac_cohort (id, mention, niveau, parcours_id, groupe_id) VALUES (2,'GRAD6','BX',1,1);
  INSERT IGNORE INTO uac_cohort (id, mention, niveau, parcours_id, groupe_id) VALUES (3,'GRAD6','CX',1,1);
  INSERT IGNORE INTO uac_cohort (id, mention, niveau, parcours_id, groupe_id) VALUES (4,'GRAD7','AX',1,1);
  INSERT IGNORE INTO uac_cohort (id, mention, niveau, parcours_id, groupe_id) VALUES (5,'GRAD7','BX',1,1);
  INSERT IGNORE INTO uac_cohort (id, mention, niveau, parcours_id, groupe_id) VALUES (6,'GRAD7','CX',1,1);
  INSERT IGNORE INTO uac_cohort (id, mention, niveau, parcours_id, groupe_id) VALUES (7,'GRAD8','AX',1,1);
  INSERT IGNORE INTO uac_cohort (id, mention, niveau, parcours_id, groupe_id) VALUES (8,'GRAD8','BX',1,1);
  INSERT IGNORE INTO uac_cohort (id, mention, niveau, parcours_id, groupe_id) VALUES (9,'GRAD8','CX',1,1);
  INSERT IGNORE INTO uac_cohort (id, mention, niveau, parcours_id, groupe_id) VALUES (10,'GRAD9','AX',1,1);
  INSERT IGNORE INTO uac_cohort (id, mention, niveau, parcours_id, groupe_id) VALUES (11,'GRAD9','BX',1,1);
  INSERT IGNORE INTO uac_cohort (id, mention, niveau, parcours_id, groupe_id) VALUES (12,'GRAD9','CX',1,1);
  INSERT IGNORE INTO uac_cohort (id, mention, niveau, parcours_id, groupe_id) VALUES (13,'GRA10','AX',1,1);
  INSERT IGNORE INTO uac_cohort (id, mention, niveau, parcours_id, groupe_id) VALUES (14,'GRA10','BX',1,1);
  INSERT IGNORE INTO uac_cohort (id, mention, niveau, parcours_id, groupe_id) VALUES (15,'GRA10','CX',1,1);
  INSERT IGNORE INTO uac_cohort (id, mention, niveau, parcours_id, groupe_id) VALUES (16,'GRA11','AX',1,1);
  INSERT IGNORE INTO uac_cohort (id, mention, niveau, parcours_id, groupe_id) VALUES (17,'GRA11','BX',1,1);
  INSERT IGNORE INTO uac_cohort (id, mention, niveau, parcours_id, groupe_id) VALUES (18,'GRA11','CX',1,1);
  INSERT IGNORE INTO uac_cohort (id, mention, niveau, parcours_id, groupe_id) VALUES (19,'GRA12','AX',1,2);
  INSERT IGNORE INTO uac_cohort (id, mention, niveau, parcours_id, groupe_id) VALUES (20,'GRA12','BX',1,3);
  INSERT IGNORE INTO uac_cohort (id, mention, niveau, parcours_id, groupe_id) VALUES (21,'GRA12','CX',1,4);
  INSERT IGNORE INTO uac_cohort (id, mention, niveau, parcours_id, groupe_id) VALUES (22,'GRA13','AX',1,2);
  INSERT IGNORE INTO uac_cohort (id, mention, niveau, parcours_id, groupe_id) VALUES (23,'GRA13','BX',1,3);
  INSERT IGNORE INTO uac_cohort (id, mention, niveau, parcours_id, groupe_id) VALUES (24,'GRA13','CX',1,4);

  /*

  DELETE FROM uac_cohort WHERE id = 10;
  INSERT IGNORE INTO uac_cohort (id, mention, niveau, parcours_id, groupe_id) VALUES (10, (SELECT par_code FROM uac_ref_mention WHERE title = 'DROIT'), 'L2', (SELECT id FROM uac_ref_parcours WHERE title = 'D3'), (SELECT id FROM uac_ref_groupe WHERE title = 'na'));

  -- L3 Groupe 1 & 2
  INSERT IGNORE INTO uac_cohort (id, mention, niveau, parcours_id, groupe_id) VALUES (49, (SELECT par_code FROM uac_ref_mention WHERE title = 'DROIT'), 'L3', (SELECT id FROM uac_ref_parcours WHERE title = 'PRIVE'), (SELECT id FROM uac_ref_groupe WHERE title = 'Groupe 2'));

  -- L1 Groupe 2 D4
  INSERT IGNORE INTO uac_cohort (id, mention, niveau, parcours_id, groupe_id)
  VALUES
  (50, (SELECT par_code FROM uac_ref_mention WHERE title = 'DROIT'), 'L1', (SELECT id FROM uac_ref_parcours WHERE title = 'D4'), (SELECT id FROM uac_ref_groupe WHERE title = 'Groupe 2'));


  UPDATE uac_cohort SET groupe_id = (SELECT id FROM uac_ref_groupe WHERE title = 'Groupe 1') WHERE id = 11;
  UPDATE uac_cohort SET groupe_id = (SELECT id FROM uac_ref_groupe WHERE title = 'Groupe 1') WHERE id = 12;

  UPDATE uac_cohort SET groupe_id = (SELECT id FROM uac_ref_groupe WHERE title = 'Groupe 1') WHERE id = 22;
  UPDATE uac_cohort SET groupe_id = (SELECT id FROM uac_ref_groupe WHERE title = 'Groupe 1') WHERE id = 23;
  UPDATE uac_cohort SET groupe_id = (SELECT id FROM uac_ref_groupe WHERE title = 'Groupe 2') WHERE id = 24;


  UPDATE uac_cohort SET groupe_id = (SELECT id FROM uac_ref_groupe WHERE title = 'Groupe 1') WHERE id = 25;
  UPDATE uac_cohort SET groupe_id = (SELECT id FROM uac_ref_groupe WHERE title = 'Groupe 2') WHERE id = 26;

  UPDATE uac_cohort SET groupe_id = (SELECT id FROM uac_ref_groupe WHERE title = 'Groupe 2') WHERE id = 10;

  */

DROP TABLE IF EXISTS uac_ref_room;
CREATE TABLE IF NOT EXISTS uac_ref_room (
  `id` SMALLINT UNSIGNED NOT NULL,
  `name` VARCHAR(50) NULL,
  `capacity` INT UNSIGNED NOT NULL,
  `category` VARCHAR(45) NULL,
  `size` CHAR(1) NOT NULL DEFAULT 'S',
  `is_video` CHAR(1) NOT NULL DEFAULT 'N' COMMENT 'N is for Not Video and Y is for Video',
  `rm_order` SMALLINT UNSIGNED NOT NULL,
  `available` CHAR(1) NULL DEFAULT 'Y',
  `create_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`));



  INSERT INTO uac_ref_room (id,name, capacity, category, size, is_video, rm_order) VALUES (0,'Non spécifiée',10000,'NA','L','N',1);
  INSERT INTO uac_ref_room (id,name, capacity, category, size, is_video, rm_order) VALUES (1,'001',40,'PETITE','S','N',2);
  INSERT INTO uac_ref_room (id,name, capacity, category, size, is_video, rm_order) VALUES (2,'002',40,'PETITE','S','N',2);
  INSERT INTO uac_ref_room (id,name, capacity, category, size, is_video, rm_order) VALUES (3,'101',30,'PETITE','S','N',2);
  INSERT INTO uac_ref_room (id,name, capacity, category, size, is_video, rm_order) VALUES (4,'102',30,'PETITE','S','Y',2);
  INSERT INTO uac_ref_room (id,name, capacity, category, size, is_video, rm_order) VALUES (5,'103',40,'PETITE','S','Y',2);
  INSERT INTO uac_ref_room (id,name, capacity, category, size, is_video, rm_order) VALUES (6,'104',46,'PETITE','S','Y',2);
  INSERT INTO uac_ref_room (id,name, capacity, category, size, is_video, rm_order) VALUES (7,'105',50,'PETITE','S','Y',2);
  INSERT INTO uac_ref_room (id,name, capacity, category, size, is_video, rm_order) VALUES (8,'203',35,'PETITE','S','Y',2);
  INSERT INTO uac_ref_room (id,name, capacity, category, size, is_video, rm_order) VALUES (9,'302',46,'PETITE','S','Y',2);
  INSERT INTO uac_ref_room (id,name, capacity, category, size, is_video, rm_order) VALUES (10,'303',54,'PETITE','S','N',2);
  INSERT INTO uac_ref_room (id,name, capacity, category, size, is_video, rm_order) VALUES (11,'304',54,'PETITE','S','Y',2);
  INSERT INTO uac_ref_room (id,name, capacity, category, size, is_video, rm_order) VALUES (12,'305',58,'PETITE','S','N',2);
  INSERT INTO uac_ref_room (id,name, capacity, category, size, is_video, rm_order) VALUES (13,'306',40,'PETITE','S','N',2);
  INSERT INTO uac_ref_room (id,name, capacity, category, size, is_video, rm_order) VALUES (14,'307',44,'PETITE','S','Y',2);
  INSERT INTO uac_ref_room (id,name, capacity, category, size, is_video, rm_order) VALUES (15,'405',36,'PETITE','S','Y',2);
  INSERT INTO uac_ref_room (id,name, capacity, category, size, is_video, rm_order) VALUES (16,'406',48,'PETITE','S','Y',2);
  INSERT INTO uac_ref_room (id,name, capacity, category, size, is_video, rm_order) VALUES (17,'504',41,'PETITE','S','Y',2);
  INSERT INTO uac_ref_room (id,name, capacity, category, size, is_video, rm_order) VALUES (18,'201-202',100,'GRANDE','L','N',2);
  INSERT INTO uac_ref_room (id,name, capacity, category, size, is_video, rm_order) VALUES (19,'205-206',150,'GRANDE','L','Y',2);
  INSERT INTO uac_ref_room (id,name, capacity, category, size, is_video, rm_order) VALUES (20,'502-503',100,'GRANDE','L','Y',2);
  INSERT INTO uac_ref_room (id,name, capacity, category, size, is_video, rm_order) VALUES (21,'301',30,'LABO','S','Y',2);
  INSERT INTO uac_ref_room (id,name, capacity, category, size, is_video, rm_order) VALUES (22,'401',40,'LABO','S','N',2);
  INSERT INTO uac_ref_room (id,name, capacity, category, size, is_video, rm_order) VALUES (23,'402',20,'LABO','S','N',2);
  INSERT INTO uac_ref_room (id,name, capacity, category, size, is_video, rm_order) VALUES (24,'403',40,'LABO','S','N',2);
  INSERT INTO uac_ref_room (id,name, capacity, category, size, is_video, rm_order) VALUES (25,'101',12,'ANNEXE','S','N',2);
  INSERT INTO uac_ref_room (id,name, capacity, category, size, is_video, rm_order) VALUES (26,'102',24,'ANNEXE','S','N',2);
  INSERT INTO uac_ref_room (id,name, capacity, category, size, is_video, rm_order) VALUES (27,'103',15,'ANNEXE','S','N',2);
  INSERT INTO uac_ref_room (id,name, capacity, category, size, is_video, rm_order) VALUES (28,'201',8,'ANNEXE','S','N',2);
  INSERT INTO uac_ref_room (id,name, capacity, category, size, is_video, rm_order) VALUES (29,'202',42,'ANNEXE','S','N',2);




DROP TABLE IF EXISTS uac_calendar;
CREATE TABLE IF NOT EXISTS uac_calendar (
  `id` SMALLINT UNSIGNED NOT NULL,
  `calendar` CHAR(7) NOT NULL,
  `semester` CHAR(1) NOT NULL,
  `display_date` VARCHAR(60) NOT NULL,
  `display_info` VARCHAR(250) NOT NULL,
  `observation` VARCHAR(250) NULL,
  `is_displayed` CHAR(1) NOT NULL DEFAULT 'Y',
  `create_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`));


/*************
SELECTION COHORT !

select * from uac_cohort uc
				JOIN uac_ref_mention urm ON urm.par_code = uc.mention
					JOIN uac_ref_niveau urn ON urn.par_code = uc.niveau
					JOIN uac_ref_parcours urp ON urp.id = uc.parcours_id
					JOIN uac_ref_groupe urg ON urg.id = uc.groupe_id;

*******/


  DROP TABLE IF EXISTS uac_class_cohort_param;
  CREATE TABLE IF NOT EXISTS uac_class_cohort_param (
    `id` INT UNSIGNED NOT NULL,
    `display_temp_grade` CHAR(1) NOT NULL DEFAULT 'Y' COMMENT 'We display temp grade until jury did not deliberate yet',
    `last_update` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `create_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`));

    INSERT IGNORE INTO uac_class_cohort_param (id) VALUES (1);
    INSERT IGNORE INTO uac_class_cohort_param (id) VALUES (2);
    INSERT IGNORE INTO uac_class_cohort_param (id) VALUES (3);
    INSERT IGNORE INTO uac_class_cohort_param (id) VALUES (4);
    INSERT IGNORE INTO uac_class_cohort_param (id) VALUES (5);
    INSERT IGNORE INTO uac_class_cohort_param (id) VALUES (6);
    INSERT IGNORE INTO uac_class_cohort_param (id) VALUES (7);
    INSERT IGNORE INTO uac_class_cohort_param (id) VALUES (8);
    INSERT IGNORE INTO uac_class_cohort_param (id) VALUES (9);
    INSERT IGNORE INTO uac_class_cohort_param (id) VALUES (10);
    INSERT IGNORE INTO uac_class_cohort_param (id) VALUES (11);
    INSERT IGNORE INTO uac_class_cohort_param (id) VALUES (12);
    INSERT IGNORE INTO uac_class_cohort_param (id) VALUES (13);
    INSERT IGNORE INTO uac_class_cohort_param (id) VALUES (14);
    INSERT IGNORE INTO uac_class_cohort_param (id) VALUES (15);
    INSERT IGNORE INTO uac_class_cohort_param (id) VALUES (16);
    INSERT IGNORE INTO uac_class_cohort_param (id) VALUES (17);
    INSERT IGNORE INTO uac_class_cohort_param (id) VALUES (18);
    INSERT IGNORE INTO uac_class_cohort_param (id) VALUES (19);
    INSERT IGNORE INTO uac_class_cohort_param (id) VALUES (20);
    INSERT IGNORE INTO uac_class_cohort_param (id) VALUES (21);
    INSERT IGNORE INTO uac_class_cohort_param (id) VALUES (22);
    INSERT IGNORE INTO uac_class_cohort_param (id) VALUES (23);
    INSERT IGNORE INTO uac_class_cohort_param (id) VALUES (24);

DROP VIEW IF EXISTS v_class_cohort;
CREATE VIEW v_class_cohort AS
SELECT 	uc.id AS id, urm.title AS mention, urm.par_code AS mention_code, uc.niveau AS niveau, urp.title AS parcours, urg.title AS groupe, uccp.display_temp_grade AS param_diplay_temp_gra, CONCAT(SUBSTRING(urm.title, 1, 5), '/', uc.niveau, '/', SUBSTRING(urp.title, 1, 5), '/', SUBSTRING(urg.title, 1, 10)) AS short_classe
                        FROM uac_cohort uc
              				  JOIN uac_ref_mention urm ON urm.par_code = uc.mention
              					JOIN uac_ref_niveau urn ON urn.par_code = uc.niveau
              					JOIN uac_ref_parcours urp ON urp.id = uc.parcours_id
              					JOIN uac_ref_groupe urg ON urg.id = uc.groupe_id
                        JOIN uac_class_cohort_param uccp ON uccp.id = uc.id
			ORDER BY uc.id;


DROP TABLE IF EXISTS tech_number;
CREATE TABLE IF NOT EXISTS tech_number (
  `id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`));
INSERT IGNORE INTO tech_number (id) VALUES (1);
INSERT IGNORE INTO tech_number (id) VALUES (2);
INSERT IGNORE INTO tech_number (id) VALUES (3);
INSERT IGNORE INTO tech_number (id) VALUES (4);
INSERT IGNORE INTO tech_number (id) VALUES (5);
INSERT IGNORE INTO tech_number (id) VALUES (6);
INSERT IGNORE INTO tech_number (id) VALUES (7);


-- ----------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS uac_ref_ephemeride;
CREATE TABLE IF NOT EXISTS uac_ref_ephemeride (
  `eph_day` CHAR(5) NOT NULL,
  `eph_year` SMALLINT NOT NULL,
  `description` VARCHAR(300) NOT NULL,
  `day_366` SMALLINT UNSIGNED NOT NULL,
  `category` TINYINT NOT NULL DEFAULT 9,
  `create_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX (`eph_day`));

INSERT INTO uac_ref_ephemeride (eph_day, eph_year, description, day_366, category) VALUES (NULL, NULL, NULL, NULL);



DROP TABLE IF EXISTS mdl_user;
CREATE TABLE IF NOT EXISTS mdl_user (
  `id` bigint(20) unsigned NOT NULL,
  `username` char(10) NOT NULL,
  `last_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `still_alive` char(1) NOT NULL DEFAULT 'Y',
  `phone1` varchar(20) NOT NULL,
  `phone_mvola` varchar(20) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `matricule` varchar(45) NOT NULL,
  `autre_prenom` varchar(50) DEFAULT NULL,
  `genre` char(1) NOT NULL,
  `datedenaissance` date NOT NULL,
  `lieu_de_naissance` varchar(50) DEFAULT NULL,
  `situation_matrimoniale` char(1) DEFAULT NULL,
  `compte_fb` varchar(200) DEFAULT NULL,
  `etablissement_origine` varchar(200) DEFAULT NULL,
  `serie_bac` varchar(150) DEFAULT NULL,
  `annee_bac` smallint(6) DEFAULT NULL,
  `numero_cin` varchar(50) DEFAULT NULL,
  `date_cin` date DEFAULT NULL,
  `lieu_cin` varchar(50) DEFAULT NULL,
  `nom_pnom_par1` varchar(250) DEFAULT NULL,
  `email_par1` varchar(50) DEFAULT NULL,
  `phone_par1` varchar(20) DEFAULT NULL,
  `profession_par1` varchar(200) DEFAULT NULL,
  `adresse_par1` varchar(250) DEFAULT NULL,
  `city_par1` varchar(50) DEFAULT NULL,
  `nom_pnom_par2` varchar(250) DEFAULT NULL,
  `phone_par2` varchar(20) DEFAULT NULL,
  `profession_par2` varchar(200) DEFAULT NULL,
  `centres_interets` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
);