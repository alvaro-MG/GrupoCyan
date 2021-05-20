-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Laravel
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Laravel
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Laravel` DEFAULT CHARACTER SET utf8 ;
USE `Laravel` ;

-- -----------------------------------------------------
-- Table `Laravel`.`actividades`
-- -----------------------------------------------------
drop table if exists `Laravel`.`actividades` ;
CREATE TABLE IF NOT EXISTS `Laravel`.`actividades` (
  `idActividades` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `tipo` SET('Examen', 'Tarea', 'Opcional') NULL DEFAULT NULL,
  PRIMARY KEY (`idActividades`))
ENGINE = InnoDB
AUTO_INCREMENT = 26
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `Laravel`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Laravel`.`users`;

CREATE TABLE IF NOT EXISTS `Laravel`.`users` (
  `idUsers` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  `apellido1` VARCHAR(255) NOT NULL,
  `apellido2` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `numeroTel` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idUsers`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `Laravel`.`alumno`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `Laravel`.`alumno`;

CREATE TABLE IF NOT EXISTS `Laravel`.`alumno` (
  `idAlumno` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nota` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idAlumno`))
ENGINE = InnoDB
AUTO_INCREMENT = 31
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Laravel`.`contenido`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `Laravel`.`contenido`;

CREATE TABLE IF NOT EXISTS `Laravel`.`contenido` (
  `idContenido` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idContenido`))
ENGINE = InnoDB
AUTO_INCREMENT = 26
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Laravel`.`elemento`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `Laravel`.`elemento`;

CREATE TABLE IF NOT EXISTS `Laravel`.`elemento` (
  `idElemento` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idElemento`))
ENGINE = InnoDB
AUTO_INCREMENT = 26
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Laravel`.`elementoActividades`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `Laravel`.`elementoActividades`;

CREATE TABLE IF NOT EXISTS `Laravel`.`elementoActividades` (
  `idelementoActividades` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fk_idElemento` INT UNSIGNED NOT NULL,
  `fk_idActividades` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idelementoActividades`),
  INDEX `fk_idElemento` (`fk_idElemento` ASC) VISIBLE,
  INDEX `fk_idActividades` (`fk_idActividades` ASC) VISIBLE,
  CONSTRAINT `elementoActividades_ibfk_1`
    FOREIGN KEY (`fk_idElemento`)
    REFERENCES `Laravel`.`elemento` (`idElemento`),
  CONSTRAINT `elementoActividades_ibfk_2`
    FOREIGN KEY (`fk_idActividades`)
    REFERENCES `Laravel`.`actividades` (`idActividades`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Laravel`.`elementoContenido`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `Laravel`.`elementoContenido`;

CREATE TABLE IF NOT EXISTS `Laravel`.`elementoContenido` (
  `idelementoContenido` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fk_idElemento` INT UNSIGNED NOT NULL,
  `fk_idContenido` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idelementoContenido`),
  INDEX `fk_idElemento` (`fk_idElemento` ASC) VISIBLE,
  INDEX `fk_idContenido` (`fk_idContenido` ASC) VISIBLE,
  CONSTRAINT `elementoContenido_ibfk_1`
    FOREIGN KEY (`fk_idElemento`)
    REFERENCES `Laravel`.`elemento` (`idElemento`),
  CONSTRAINT `elementoContenido_ibfk_2`
    FOREIGN KEY (`fk_idContenido`)
    REFERENCES `Laravel`.`contenido` (`idContenido`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Laravel`.`multimedia`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `Laravel`.`multimedia`;

CREATE TABLE IF NOT EXISTS `Laravel`.`multimedia` (
  `idMultimedia` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `URL` VARCHAR(255) NOT NULL,
  `tipo` SET('Video', 'Imagen', 'Presentacion') NULL DEFAULT NULL,
  PRIMARY KEY (`idMultimedia`))
ENGINE = InnoDB
AUTO_INCREMENT = 35
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Laravel`.`elementoMultimedia`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `Laravel`.`elementoMultimedia`;

CREATE TABLE IF NOT EXISTS `Laravel`.`elementoMultimedia` (
  `elementoMultimedia` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fk_idElemento` INT UNSIGNED NOT NULL,
  `fk_idMultimedia` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`elementoMultimedia`),
  INDEX `fk_idElemento` (`fk_idElemento` ASC) VISIBLE,
  INDEX `fk_idMultimedia` (`fk_idMultimedia` ASC) VISIBLE,
  CONSTRAINT `elementoMultimedia_ibfk_1`
    FOREIGN KEY (`fk_idElemento`)
    REFERENCES `Laravel`.`elemento` (`idElemento`),
  CONSTRAINT `elementoMultimedia_ibfk_2`
    FOREIGN KEY (`fk_idMultimedia`)
    REFERENCES `Laravel`.`multimedia` (`idMultimedia`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Laravel`.`failed_jobs`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `Laravel`.`failed_jobs`;

CREATE TABLE IF NOT EXISTS `Laravel`.`failed_jobs` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` VARCHAR(255) NOT NULL,
  `connection` TEXT NOT NULL,
  `queue` TEXT NOT NULL,
  `payload` LONGTEXT NOT NULL,
  `exception` LONGTEXT NOT NULL,
  `failed_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `failed_jobs_uuid_unique` (`uuid` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `Laravel`.`migrations`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `Laravel`.`migrations`;

CREATE TABLE IF NOT EXISTS `Laravel`.`migrations` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` VARCHAR(255) NOT NULL,
  `batch` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `Laravel`.`modulo`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `Laravel`.`modulo`;

CREATE TABLE IF NOT EXISTS `Laravel`.`modulo` (
  `idModulo` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(20) NOT NULL,
  `nivel` INT NOT NULL,
  `ramaProfesional` SET('tipo1', 'tipo2', 'tipo3', 'tipo4', 'tipo5') NOT NULL,
  `duracion` SET('corto', 'medio', 'largo') NOT NULL,
  PRIMARY KEY (`idModulo`)
  )
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Laravel`.`password_resets`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `Laravel`.`password_resets`;

CREATE TABLE IF NOT EXISTS `Laravel`.`password_resets` (
  `email` VARCHAR(255) NOT NULL,
  `token` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  INDEX `password_resets_email_index` (`email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `Laravel`.`profesor`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `Laravel`.`profesor`;

CREATE TABLE IF NOT EXISTS `Laravel`.`profesor` (
  `idProfesor` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idProfesor`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Laravel`.`students`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `Laravel`.`students`;

CREATE TABLE IF NOT EXISTS `Laravel`.`students` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `studname` VARCHAR(255) NOT NULL,
  `course` VARCHAR(255) NOT NULL,
  `fee` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `Laravel`.`suscripcion`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `Laravel`.`suscripcion`;

CREATE TABLE IF NOT EXISTS `Laravel`.`suscripcion` (
  `idSuscripcion` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fechaInicio` DATE NOT NULL,
  `fechaRenovacion` DATE NOT NULL,
  PRIMARY KEY (`idSuscripcion`))
ENGINE = InnoDB
AUTO_INCREMENT = 31
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Laravel`.`usersModulo`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `Laravel`.`usersModulo`;

CREATE TABLE IF NOT EXISTS `Laravel`.`usersModulo` (
  `idUsersModulo` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fk_idProfesor` INT UNSIGNED NOT NULL,
  `fk_idModulo` INT UNSIGNED NOT NULL,
  `users_idUsers` BIGINT UNSIGNED NOT NULL ,
  PRIMARY KEY (`idUsersModulo`))
  
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

show tables;

insert into users (idUsers, nombre, apellido1, apellido2, email, numeroTel) values (1, 'Dane', 'Muggleton', 'Wegener', 'dwegener0@sphinn.com', '6268424147');
insert into users (idUsers, nombre, apellido1, apellido2, email, numeroTel) values (2, 'Elmira', 'Presman', 'Waterhouse', 'ewaterhouse1@blogspot.com', '6921610829');
insert into users (idUsers, nombre, apellido1, apellido2, email, numeroTel) values (3, 'Rebeca', 'Lathleiffure', 'Huckin', 'rhuckin2@usa.gov', '1182628502');
insert into users (idUsers, nombre, apellido1, apellido2, email, numeroTel) values (4, 'Brock', 'Riguard', 'Paling', 'bpaling3@mapquest.com', '7277378350');
insert into users (idUsers, nombre, apellido1, apellido2, email, numeroTel) values (5, 'Basilius', 'McCarlich', 'Crat', 'bcrat4@tamu.edu', '3565898926');
insert into users (idUsers, nombre, apellido1, apellido2, email, numeroTel) values (6, 'Chancey', 'Hintze', 'Kewley', 'ckewley5@cafepress.com', '2688245096');
insert into users (idUsers, nombre, apellido1, apellido2, email, numeroTel) values (7, 'Mickie', 'Goldsbrough', 'Perrin', 'mperrin6@goo.gl', '4686908731');
insert into users (idUsers, nombre, apellido1, apellido2, email, numeroTel) values (8, 'Raimondo', 'Brachell', 'Copperwaite', 'rcopperwaite7@cloudflare.com', '8621853038');
insert into users (idUsers, nombre, apellido1, apellido2, email, numeroTel) values (9, 'Clemens', 'Vince', 'McCartan', 'cmccartan8@cbc.ca', '1446926185');
insert into users (idUsers, nombre, apellido1, apellido2, email, numeroTel) values (10, 'Danni', 'Bonder', 'Mattson', 'dmattson9@redcross.org', '5718804370');
insert into users (idUsers, nombre, apellido1, apellido2, email, numeroTel) values (11, 'Katusha', 'Kemish', 'Denzey', 'kdenzeya@admin.ch', '4922098809');
insert into users (idUsers, nombre, apellido1, apellido2, email, numeroTel) values (12, 'Matteo', 'Marcus', 'Sheraton', 'msheratonb@flickr.com', '3948744876');
insert into users (idUsers, nombre, apellido1, apellido2, email, numeroTel) values (13, 'Jarrod', 'Harper', 'Coniam', 'jconiamc@slashdot.org', '9163909980');
insert into users (idUsers, nombre, apellido1, apellido2, email, numeroTel) values (14, 'Harry', 'Knott', 'Brinded', 'hbrindedd@springer.com', '7152980293');
insert into users (idUsers, nombre, apellido1, apellido2, email, numeroTel) values (15, 'Paolo', 'Warbey', 'Decreuze', 'pdecreuzee@ox.ac.uk', '9189757320');
insert into users (idUsers, nombre, apellido1, apellido2, email, numeroTel) values (16, 'Glori', 'Mehaffey', 'Orthmann', 'gorthmannf@nsw.gov.au', '8093751828');
insert into users (idUsers, nombre, apellido1, apellido2, email, numeroTel) values (17, 'Hartwell', 'Rawe', 'Rounsefell', 'hrounsefellg@booking.com', '9381692672');
insert into users (idUsers, nombre, apellido1, apellido2, email, numeroTel) values (18, 'Allyn', 'Stirley', 'Dron', 'adronh@archive.org', '9313849145');
insert into users (idUsers, nombre, apellido1, apellido2, email, numeroTel) values (19, 'Gertrud', 'Beneze', 'Jahnel', 'gjahneli@virginia.edu', '5618356735');
insert into users (idUsers, nombre, apellido1, apellido2, email, numeroTel) values (20, 'Nico', 'Digman', 'Theodore', 'ntheodorej@icq.com', '5762105282');
insert into users (idUsers, nombre, apellido1, apellido2, email, numeroTel) values (21, 'Amy', 'Hirth', 'Thorald', 'athoraldk@who.int', '7661380587');
insert into users (idUsers, nombre, apellido1, apellido2, email, numeroTel) values (22, 'Ashlie', 'Conisbee', 'Caulwell', 'acaulwelll@infoseek.co.jp', '8326086351');
insert into users (idUsers, nombre, apellido1, apellido2, email, numeroTel) values (23, 'Ines', 'Claxson', 'Kleanthous', 'ikleanthousm@shop-pro.jp', '6091889729');
insert into users (idUsers, nombre, apellido1, apellido2, email, numeroTel) values (24, 'Derrick', 'Mattiato', 'Rubenovic', 'drubenovicn@devhub.com', '5479170499');
insert into users (idUsers, nombre, apellido1, apellido2, email, numeroTel) values (25, 'Kurtis', 'Tours', 'Merredy', 'kmerredyo@home.pl', '9366627012');
insert into users (idUsers, nombre, apellido1, apellido2, email, numeroTel) values (26, 'Diana', 'Carreck', 'Ruger', 'drugerp@cbslocal.com', '6666843413');
insert into users (idUsers, nombre, apellido1, apellido2, email, numeroTel) values (27, 'Phillida', 'Drewett', 'MacMenamy', 'pmacmenamyq@comsenz.com', '1274048111');
insert into users (idUsers, nombre, apellido1, apellido2, email, numeroTel) values (28, 'Thornie', 'Calderwood', 'Elsmore', 'telsmorer@istockphoto.com', '4695547634');
insert into users (idUsers, nombre, apellido1, apellido2, email, numeroTel) values (29, 'Tommi', 'Belk', 'Britzius', 'tbritziuss@symantec.com', '2364006947');
insert into users (idUsers, nombre, apellido1, apellido2, email, numeroTel) values (30, 'Marissa', 'MacRonald', 'Ambrogioni', 'mambrogionit@ca.gov', '4506669122');

insert into suscripcion (idSuscripcion, fechaInicio, fechaRenovacion) values (1, '2020-06-18', '2020-11-13');
insert into suscripcion (idSuscripcion, fechaInicio, fechaRenovacion) values (2, '2018-01-08', '2016-09-22');
insert into suscripcion (idSuscripcion, fechaInicio, fechaRenovacion) values (3, '2018-08-12', '2016-09-20');
insert into suscripcion (idSuscripcion, fechaInicio, fechaRenovacion) values (4, '2020-07-26', '2015-09-05');
insert into suscripcion (idSuscripcion, fechaInicio, fechaRenovacion) values (5, '2019-12-27', '2015-10-15');
insert into suscripcion (idSuscripcion, fechaInicio, fechaRenovacion) values (6, '2016-01-13', '2017-10-08');
insert into suscripcion (idSuscripcion, fechaInicio, fechaRenovacion) values (7, '2015-10-08', '2014-07-12');
insert into suscripcion (idSuscripcion, fechaInicio, fechaRenovacion) values (8, '2020-04-19', '2017-09-14');
insert into suscripcion (idSuscripcion, fechaInicio, fechaRenovacion) values (9, '2018-03-07', '2020-06-30');
insert into suscripcion (idSuscripcion, fechaInicio, fechaRenovacion) values (10, '2019-10-01', '2019-04-11');
insert into suscripcion (idSuscripcion, fechaInicio, fechaRenovacion) values (11, '2018-09-24', '2018-09-26');
insert into suscripcion (idSuscripcion, fechaInicio, fechaRenovacion) values (12, '2019-08-24', '2019-04-06');
insert into suscripcion (idSuscripcion, fechaInicio, fechaRenovacion) values (13, '2019-08-12', '2014-07-26');
insert into suscripcion (idSuscripcion, fechaInicio, fechaRenovacion) values (14, '2018-05-29', '2015-10-15');
insert into suscripcion (idSuscripcion, fechaInicio, fechaRenovacion) values (15, '2018-11-24', '2015-04-11');
insert into suscripcion (idSuscripcion, fechaInicio, fechaRenovacion) values (16, '2019-05-15', '2015-05-29');
insert into suscripcion (idSuscripcion, fechaInicio, fechaRenovacion) values (17, '2017-12-04', '2017-12-05');
insert into suscripcion (idSuscripcion, fechaInicio, fechaRenovacion) values (18, '2015-06-07', '2014-12-16');
insert into suscripcion (idSuscripcion, fechaInicio, fechaRenovacion) values (19, '2017-03-26', '2019-12-02');
insert into suscripcion (idSuscripcion, fechaInicio, fechaRenovacion) values (20, '2015-01-26', '2014-09-22');
insert into suscripcion (idSuscripcion, fechaInicio, fechaRenovacion) values (21, '2020-11-05', '2015-08-01');
insert into suscripcion (idSuscripcion, fechaInicio, fechaRenovacion) values (22, '2020-07-30', '2020-12-19');
insert into suscripcion (idSuscripcion, fechaInicio, fechaRenovacion) values (23, '2017-09-03', '2015-09-23');
insert into suscripcion (idSuscripcion, fechaInicio, fechaRenovacion) values (24, '2016-10-10', '2017-08-09');
insert into suscripcion (idSuscripcion, fechaInicio, fechaRenovacion) values (25, '2017-05-30', '2014-10-14');
insert into suscripcion (idSuscripcion, fechaInicio, fechaRenovacion) values (26, '2018-02-05', '2021-01-15');
insert into suscripcion (idSuscripcion, fechaInicio, fechaRenovacion) values (27, '2017-11-22', '2015-11-14');
insert into suscripcion (idSuscripcion, fechaInicio, fechaRenovacion) values (28, '2015-08-19', '2016-12-30');
insert into suscripcion (idSuscripcion, fechaInicio, fechaRenovacion) values (29, '2016-11-27', '2017-11-07');
insert into suscripcion (idSuscripcion, fechaInicio, fechaRenovacion) values (30, '2016-08-25', '2014-09-24');

insert into alumno (idAlumno, nota) values (1, 3);
insert into alumno (idAlumno, nota) values (2, 5);
insert into alumno (idAlumno, nota) values (3, 1);
insert into alumno (idAlumno, nota) values (4, 9);
insert into alumno (idAlumno, nota) values (5, 4);
insert into alumno (idAlumno, nota) values (6, 3);
insert into alumno (idAlumno, nota) values (7, 9);
insert into alumno (idAlumno, nota) values (8, 9);
insert into alumno (idAlumno, nota) values (9, 0);
insert into alumno (idAlumno, nota) values (10, 6);
insert into alumno (idAlumno, nota) values (11, 3);
insert into alumno (idAlumno, nota) values (12, 0);
insert into alumno (idAlumno, nota) values (13, 10);
insert into alumno (idAlumno, nota) values (14, 8);
insert into alumno (idAlumno, nota) values (15, 9);
insert into alumno (idAlumno, nota) values (16, 2);
insert into alumno (idAlumno, nota) values (17, 2);
insert into alumno (idAlumno, nota) values (18, 6);
insert into alumno (idAlumno, nota) values (19, 4);
insert into alumno (idAlumno, nota) values (20, 2);
insert into alumno (idAlumno, nota) values (21, 7);
insert into alumno (idAlumno, nota) values (22, 8);
insert into alumno (idAlumno, nota) values (23, 1);
insert into alumno (idAlumno, nota) values (24, 5);
insert into alumno (idAlumno, nota) values (25, 10);
insert into alumno (idAlumno, nota) values (26, 5);
insert into alumno (idAlumno, nota) values (27, 2);
insert into alumno (idAlumno, nota) values (28, 3);
insert into alumno (idAlumno, nota) values (29, 5);
insert into alumno (idAlumno, nota) values (30, 5);

insert into profesor (idProfesor) values (1);
insert into profesor (idProfesor) values (2);
insert into profesor (idProfesor) values (3);
insert into profesor (idProfesor) values (4);
insert into profesor (idProfesor) values (5);
insert into profesor (idProfesor) values (6);
insert into profesor (idProfesor) values (7);

insert into modulo (idModulo, nombre, nivel, ramaProfesional, duracion) values (1, 'Biodex', 8, 1, 'corto');
insert into modulo (idModulo, nombre, nivel, ramaProfesional, duracion) values (2, 'Hatity', 9, 2, 'corto');
insert into modulo (idModulo, nombre, nivel, ramaProfesional, duracion) values (3, 'Fixflex', 8, 3,'corto');
insert into modulo (idModulo, nombre, nivel, ramaProfesional, duracion) values (4, 'Lotlux', 9, 4, 'corto');
insert into modulo (idModulo, nombre, nivel, ramaProfesional, duracion) values (5, 'Duobam', 8, 5, 'medio');
insert into modulo (idModulo, nombre, nivel, ramaProfesional, duracion) values (6, 'Latlux', 8, 6,'medio');
insert into modulo (idModulo, nombre, nivel, ramaProfesional, duracion) values (7, 'Sonair', 6, 7, 'medio');
insert into modulo (idModulo, nombre, nivel, ramaProfesional, duracion) values (8, 'Home Ing', 10, 8, 'medio');
insert into modulo (idModulo, nombre, nivel, ramaProfesional, duracion) values (9, 'Quo Lux', 9, 9, 'largo');
insert into modulo (idModulo, nombre, nivel, ramaProfesional, duracion) values (10, 'Transcof', 5, 10,  'largo');

insert into elemento (idElemento) values (1);
insert into elemento (idElemento) values (2);
insert into elemento (idElemento) values (3);
insert into elemento (idElemento) values (4);
insert into elemento (idElemento) values (5);
insert into elemento (idElemento) values (6);
insert into elemento (idElemento) values (7);
insert into elemento (idElemento) values (8);
insert into elemento (idElemento) values (9);
insert into elemento (idElemento) values (10);
insert into elemento (idElemento) values (11);
insert into elemento (idElemento) values (12);
insert into elemento (idElemento) values (13);
insert into elemento (idElemento) values (14);
insert into elemento (idElemento) values (15);
insert into elemento (idElemento) values (16);
insert into elemento (idElemento) values (17);
insert into elemento (idElemento) values (18);
insert into elemento (idElemento) values (19);
insert into elemento (idElemento) values (20);
insert into elemento (idElemento) values (21);
insert into elemento (idElemento) values (22);
insert into elemento (idElemento) values (23);
insert into elemento (idElemento) values (24);
insert into elemento (idElemento) values (25);

insert into actividades (idActividades, tipo) values (1, 'Examen');
insert into actividades (idActividades, tipo) values (2, 'Examen');
insert into actividades (idActividades, tipo) values (3,'Examen');
insert into actividades (idActividades, tipo) values (4, 'Examen');
insert into actividades (idActividades, tipo) values (5, 'Examen');
insert into actividades (idActividades, tipo) values (6, 'Examen');
insert into actividades (idActividades, tipo) values (7, 'Tarea');
insert into actividades (idActividades, tipo) values (8, 'Tarea');
insert into actividades (idActividades, tipo) values (9, 'Tarea');
insert into actividades (idActividades, tipo) values (10, 'Tarea');
insert into actividades (idActividades, tipo) values (11, 'Opcional');
insert into actividades (idActividades, tipo) values (12, 'Opcional');
insert into actividades (idActividades, tipo) values (13, 'Opcional');
insert into actividades (idActividades, tipo) values (14, 'Opcional');
insert into actividades (idActividades, tipo) values (15, 'Opcional');
insert into actividades (idActividades, tipo) values (16, 'Examen');
insert into actividades (idActividades, tipo) values (17, 'Examen');
insert into actividades (idActividades, tipo) values (18, 'Examen');
insert into actividades (idActividades, tipo) values (19, 'Examen');
insert into actividades (idActividades, tipo) values (20, 'Opcional');
insert into actividades (idActividades, tipo) values (21, 'Opcional');
insert into actividades (idActividades, tipo) values (22, 'Opcional');
insert into actividades (idActividades, tipo) values (23,'Opcional');
insert into actividades (idActividades, tipo) values (24, 'Opcional');
insert into actividades (idActividades, tipo) values (25, 'Opcional');

insert into contenido (idContenido) values (1);
insert into contenido (idContenido) values (2);
insert into contenido (idContenido) values (3);
insert into contenido (idContenido) values (4);
insert into contenido (idContenido) values (5);
insert into contenido (idContenido) values (6);
insert into contenido (idContenido) values (7);
insert into contenido (idContenido) values (8);
insert into contenido (idContenido) values (9);
insert into contenido (idContenido) values (10);
insert into contenido (idContenido) values (11);
insert into contenido (idContenido) values (12);
insert into contenido (idContenido) values (13);
insert into contenido (idContenido) values (14);
insert into contenido (idContenido) values (15);
insert into contenido (idContenido) values (16);
insert into contenido (idContenido) values (17);
insert into contenido (idContenido) values (18);
insert into contenido (idContenido) values (19);
insert into contenido (idContenido) values (20);
insert into contenido (idContenido) values (21);
insert into contenido (idContenido) values (22);
insert into contenido (idContenido) values (23);
insert into contenido (idContenido) values (24);
insert into contenido (idContenido) values (25);

insert into multimedia (idMultimedia, URL,tipo) values (1, 'https://miitbeian.gov.cn/congue/vivamus.json?lorem=pellentesque&intt=turpis', 'Video');
insert into multimedia (idMultimedia, URL,tipo) values (2, 'https://netscape.com/pede/malesuada/itpat=nam','Video');
insert into multimedia (idMultimedia, URL,tipo) values (3, 'http://wiley.com/sapien/dignissim/vestibulum.jsp?turpis=consequat&integer=varius&aliquet=integer','Video');
insert into multimedia (idMultimedia, URL,tipo) values (4, 'https://google.pl/mauris/lacinia/sapien.js?tincidunt=sapien&lacus=non&at=mi&vin=aliquet','Video');
insert into multimedia (idMultimedia, URL,tipo) values (5, 'http://exblog.jp/sociis/natoque/penatibus/et/magnis/dis.html?ut=elementum&erat=ligulvelit=nulla&vivamus=ultrices','Video');
insert into multimedia (idMultimedia, URL,tipo) values (6, 'http://msn.com/nulla/dapibus/dolor.js?ipsum=ac&aliquam=diam&non=cras&mauris=pellentes&felis=ipsum','Video');
insert into multimedia (idMultimedia, URL,tipo) values (7, 'https://photobucket.com/es=sed&a=lacus&pede=morbi&posuere=sem&non=a&in=nascetur','Video');
insert into multimedia (idMultimedia, URL,tipo) values (8, 'http://ifeng.com/vel/nisl/duis.aspx?justo=mattis&ilvinar&tellus=nulla','Video');
insert into multimedia (idMultimedia, URL,tipo) values (9, 'http://economist.com/consequat/ut/nullan=odio&sapien=condimenndisse','Video');
insert into multimedia (idMultimedia, URL,tipo) values (10, 'https://comsenz.com/lacus/morbinar=consequat&sed=nulo&sociis=nec&naturient=quis','Video');
insert into multimedia (idMultimedia, URL,tipo) values (11, 'https://example.com/quam.json?id=dui&s&arcu=quam&adis&donc&nunc=rhoncus&proin=dui&at=vel','Video');
insert into multimedia (idMultimedia, URL,tipo) values (12, 'https://census.gov/mauris/laus&molestie=id&lorem=turpis&quisqunt=consequat&blamorbi&integer==viverra','Video');
insert into multimedia (idMultimedia, URL,tipo) values (13, 'http://ameblo.jp/ipsum/primis/in/faucibus/orci/luctus.png?massa=pellentesque&id=ultrices&nisl=ph&congue=leo','Video');
insert into multimedia (idMultimedia, URL,tipo) values (14, 'https://spiegel.de/vehicula/consequat/morbi/a/ipsum.jpg?in=tuurpis&consequat=a&dui','Imagen');
insert into multimedia (idMultimedia, URL,tipo) values (15, 'https://cisco.com/nibh/fusce/lacus.html?consequat=enon=ut&maurit&laoreet=ac','Imagen');
insert into multimedia (idMultimedia, URL,tipo) values (16, 'https://gov.uk/elit/ac/nulla/sed/velmisenim&eros=in','Imagen');
insert into multimedia (idMultimedia, URL,tipo) values (17, 'http://pbs.org/convallis/morbi.html?aliquam=dger=magna&non=ac','Imagen');
insert into multimedia (idMultimedia, URL,tipo) values (18, 'https://bizjournals.com/ornare/imperdiet.html?vestibulum=ullamcorper&quam=augue','Imagen');
insert into multimedia (idMultimedia, URL,tipo) values (19, 'https://cdbaby.com/nisi/volutpat/eleifend/donec.aspx?stie=erat&sed=fermentum','Imagen');
insert into multimedia (idMultimedia, URL,tipo) values (20, 'https://samsung.com/urna/ut/tellus/nulla/ut.js?justo=primis&etlateus&varius=at','Imagen');
insert into multimedia (idMultimedia, URL,tipo) values (21, 'https://pagesperso-orange.fr/sem/fusce/consequat/nulla.png?posuere=semper&crsus=varius&id=integer','Imagen');
insert into multimedia (idMultimedia, URL,tipo) values (22, 'https://weebly.com/id/turpis.png?vestibulum=errmentum=ros=sed&suspendisse=ante','Imagen');
insert into multimedia (idMultimedia, URL,tipo) values (23, 'http://rakuten.co.jp/nulla.jpg?nam=id&dui=nisl&proin=venenatis&leo=late&dapibus=vitae','Imagen');
insert into multimedia (idMultimedia, URL,tipo) values (24, 'http://buzzfeed.com/volutpat/dui.png?in=molestie&hac=lorem&habitasse=&nonummyistique','Imagen');
insert into multimedia (idMultimedia, URL,tipo) values (25, 'https://indiatimes.com/aenean/lectus/pellentesque/eget/nunc/donec.=suspendisse&curae=ornare&mauris=consequat','Presentacion');
insert into multimedia (idMultimedia, URL,tipo) values (26, 'http://china.com.cn/ultrices/posuere/cubilia/curae/donec.png?ante=ut&nulla=ois=phasellus','Presentacion');
insert into multimedia (idMultimedia, URL,tipo) values (27, 'https://gmpg.org/a/libero/nam/dui/proin.html?viverra=donec&diam=posuer=cum&nulla=sociis','Presentacion');
insert into multimedia (idMultimedia, URL,tipo) values (28, 'https://webeden.co.uk/quis/orci/eget/orci/vehicula/=mauris&poorci','Presentacion');
insert into multimedia (idMultimedia, URL,tipo) values (29, 'https://51.la/quis.js?pede=blandit&lobortis=nam&ligula=nuvulpit&rutrum=eu&neque=est','Presentacion');
insert into multimedia (idMultimedia, URL,tipo) values (30, 'https://si.edu/nulla/eget/eros/elementum/pellentesque/c=at&enimccumsan','Presentacion');
insert into multimedia (idMultimedia, URL,tipo) values (31, 'https://cbslocal.com/magnis/dis/parturient/montes/nasceac=eque=s&accumsan=mus','Presentacion');
insert into multimedia (idMultimedia, URL,tipo) values (32, 'http://lulu.com/sodales.json?vivamus=dictumst&in=maecuam&sem=sollci=eget','Presentacion');
insert into multimedia (idMultimedia, URL,tipo) values (33, 'https://hao123.com/a.json?pedeatibus&morbi=et','Presentacion');
insert into multimedia (idMultimedia, URL,tipo) values (34, 'https://livejournal.com/interdum/mauris/non.jsp?crrem=sapien','Presentacion');
