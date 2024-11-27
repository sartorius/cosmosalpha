DROP TABLE IF EXISTS uac_admin;
CREATE TABLE IF NOT EXISTS uac_admin (
  `id` BIGINT NOT NULL,
  `pwd` VARCHAR(255) NOT NULL,
  `last_connection` DATETIME NULL,
  `scale_right` TINYINT(1) NOT NULL DEFAULT 0,
  `role` VARCHAR(60) NOT NULL,
  `accounting_write` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`));

/*********************************************************
**********************************************************
**********************************************************
**********************************************************
******************   WARNING  ****************************
**********************************************************
**********************************************************
**********************************************************
**********************************************************
*********************************************************/


-- SHOW USERS
-- This drop table is to not have to review all secret
-- We need to drop it if needed

DROP TABLE IF EXISTS uac_showuser;
CREATE TABLE IF NOT EXISTS uac_showuser (
  `username` VARCHAR(30) NOT NULL,
  `roleid` TINYINT UNSIGNED NOT NULL,
  `secret` INT UNSIGNED NULL,
  `cohort_id` INT NULL,
  `last_update` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`username`));




DROP VIEW IF EXISTS v_showuser;
CREATE VIEW v_showuser AS
SELECT
		mu.id AS ID,
          mu.username AS USERNAME,
           uas.secret AS SECRET,
           CONCAT(CAST(uas.secret AS CHAR), UPPER(uas.username)) AS PAGE,
           UPPER(mu.firstname) AS FIRSTNAME,
           UPPER(mu.lastname) AS LASTNAME,
           uas.cohort_id AS COHORT_ID,
           mu.email AS EMAIL,
           mu.phone1 AS PHONE,
           mu.address AS ADDRESS,
           mu.city AS CITY,
           mu.phone_par1 AS PARENT_PHONE,
           mu.adresse_par1 AS PARENT_ADDR,
           mu.genre AS GENRE,
           mu.matricule AS MATRICULE,
           TIMESTAMPDIFF(YEAR, mu.datedenaissance, CURDATE()) AS AGE,
           mu.lieu_de_naissance AS PL_BIRTH,
           mu.serie_bac AS BAC,
           mu.annee_bac AS YEAR_BAC,
           mu.still_alive AS STU_STILL_ALIVE,
           DATE_FORMAT(mu.datedenaissance, "%d/%m/%Y") AS BIRTHDAY,
           DATE_FORMAT(mu.datedenaissance, "%m") AS MONTHBDAY,
           vcc.short_classe AS SHORTCLASS,
           IFNULL(mu.autre_prenom, '') AS OTHER_FIRSTNAME,
           IFNULL(mu.phone_par2, '') AS PARENT_ALT_PHONE,
           IFNULL(mu.city_par1, '') AS PARENT_CITY
  FROM mdl_user mu JOIN uac_showuser uas ON mu.username = uas.username
                  JOIN v_class_cohort vcc ON vcc.id = uas.cohort_id;

DROP TABLE IF EXISTS uac_connection_log;
CREATE TABLE IF NOT EXISTS uac_connection_log (
 `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
 `user_id` BIGINT NOT NULL,
 `create_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 PRIMARY KEY (`id`));

DROP VIEW IF EXISTS v_connection_log;
CREATE VIEW v_connection_log AS
SELECT
     mu.username AS USERNAME,
     UPPER(mu.firstname) AS FIRSTNAME,
     UPPER(mu.lastname) AS LASTNAME,
     ucl.create_date AS CREATION_DATE
FROM mdl_user mu JOIN  uac_connection_log ucl ON ucl.user_id = mu.id ORDER BY ucl.create_date DESC;

DROP TABLE IF EXISTS uac_studashboard_log;
CREATE TABLE IF NOT EXISTS uac_studashboard_log (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT NOT NULL,
  `origin` CHAR(1) NOT NULL,
  `admin_id` BIGINT NULL,
  `create_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`));

DROP VIEW IF EXISTS v_studashboard_log;
CREATE VIEW v_studashboard_log AS
SELECT
     mu.username AS USERNAME,
     UPPER(mu.firstname) AS FIRSTNAME,
     UPPER(mu.lastname) AS LASTNAME,
     CASE WHEN usl.origin = 'A' THEN 'Admin' ELSE 'Student' END AS ORIGIN,
     UPPER(muadmin.firstname) AS ADMINFIRSTNAME,
     usl.create_date AS CREATION_DATE
FROM mdl_user mu JOIN uac_studashboard_log usl ON usl.user_id = mu.id
                 LEFT JOIN mdl_user muadmin ON usl.admin_id = muadmin.id
ORDER BY usl.create_date DESC;


DROP VIEW IF EXISTS v_showadmin;
CREATE VIEW v_showadmin AS
SELECT mu.id AS mu_id,
		mu.username,
		mu.firstname,
		mu.lastname,
		ua.*
FROM mdl_user mu JOIN uac_admin ua on mu.id = ua.id;


DROP TABLE IF EXISTS uac_sp_log;
CREATE TABLE IF NOT EXISTS uac_sp_log (
 `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
 `sp_log` VARCHAR(150) NOT NULL,
 `create_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (`id`));

-- INSERT INTO uac_sp_log (sp_log) VALUES ('This is a test');


DROP TABLE IF EXISTS uac_mvoline_attr_log;
CREATE TABLE IF NOT EXISTS uac_mvoline_attr_log (
 `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
 `log_agent_id` BIGINT,
 `log_username` CHAR(10),
 `log_mvola_id` BIGINT,
 `log_attribution` CHAR(1),
 `log_case_operation` CHAR(1),
 `create_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (`id`));

-- If a line does not exists then we run it else we log

-- This is for teacher
DROP TABLE IF EXISTS uac_teacher;
CREATE TABLE IF NOT EXISTS uac_teacher (
  `id` BIGINT NOT NULL,
  `mention_code` CHAR(5) NOT NULL,
  `teacher_level` CHAR(1) NOT NULL DEFAULT 'P' COMMENT 'C is for Chef de Mention and P is for Professeur',
  `description` VARCHAR(60) NOT NULL,
  `last_connection` DATETIME NULL,
  PRIMARY KEY (`id`));

INSERT INTO uac_teacher (`id`, `mention_code`, `teacher_level`, `description`)
VALUES (1827, 'GESTI', 'C', 'Chef de mention');
INSERT INTO uac_teacher (`id`, `mention_code`, `teacher_level`, `description`)
VALUES (1828, 'ECONO', 'C', 'Chef de mention');
INSERT INTO uac_teacher (`id`, `mention_code`, `teacher_level`, `description`)
VALUES (1829, 'SIENS', 'C', 'Chef de mention');
INSERT INTO uac_teacher (`id`, `mention_code`, `teacher_level`, `description`)
VALUES (1830, 'INFOE', 'C', 'Chef de mention');
INSERT INTO uac_teacher (`id`, `mention_code`, `teacher_level`, `description`)
VALUES (1831, 'DROIT', 'C', 'Chef de mention');
INSERT INTO uac_teacher (`id`, `mention_code`, `teacher_level`, `description`)
VALUES (1832, 'COMMU', 'C', 'Chef de mention');
INSERT INTO uac_teacher (`id`, `mention_code`, `teacher_level`, `description`)
VALUES (1833, 'RIDXX', 'C', 'Chef de mention');
INSERT INTO uac_teacher (`id`, `mention_code`, `teacher_level`, `description`)
VALUES (1834, 'MBSXX', 'C', 'Chef de mention');


DROP VIEW IF EXISTS v_showteacher;
CREATE VIEW v_showteacher AS
SELECT mu.id AS mu_id,
		mu.username,
		mu.firstname,
		mu.lastname,
    ut.mention_code,
    ut.teacher_level,
    ut.description,
		ua.*
FROM mdl_user mu JOIN uac_admin ua on mu.id = ua.id
                 JOIN uac_teacher ut on ut.id = ua.id;
