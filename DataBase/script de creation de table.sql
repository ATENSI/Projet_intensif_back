-- MySQL Script generated by MySQL Workbench
-- 01/11/17 09:51:53
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

-- -----------------------------------------------------
-- Schema roule_ma_poule
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `roule_ma_poule` ;

-- -----------------------------------------------------
-- Schema roule_ma_poule
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `roule_ma_poule` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `roule_ma_poule` ;

-- -----------------------------------------------------
-- Table `utilisateur`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `utilisateur` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `utilisateur_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `utilisateur_pseudo` VARCHAR(45) NOT NULL,
  `utilisateur_nom` VARCHAR(45) NOT NULL,
  `utilisateur_prenom` VARCHAR(45) NOT NULL,
  `utilisateur_portable` VARCHAR(12) NOT NULL,
  `utilisateur_score` INT NOT NULL DEFAULT 0,
  `utilisateur_points_fidelite` INT NOT NULL DEFAULT 0,
  `utilisateur_date_naissance` DATETIME NOT NULL,
  `utilisateur_mot_de_passe` VARCHAR(100) NOT NULL,
  `utilisateur_date_creation` DATETIME NOT NULL,
  `utilisateur_date_modification` DATETIME NOT NULL,
  `utilisateur_date_derniere_connexion` DATETIME NOT NULL,
  `utilisateur_token` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`utilisateur_id`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `utilisateur_id_UNIQUE` ON `utilisateur` (`utilisateur_id` ASC);

SHOW WARNINGS;
CREATE UNIQUE INDEX `utilisateur_pseudo_UNIQUE` ON `utilisateur` (`utilisateur_pseudo` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `trajet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trajet` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `trajet` (
  `trajet_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `trajet_longitude_depart` VARCHAR(45) NOT NULL,
  `trajet_latitude_depart` DOUBLE NOT NULL,
  `trajet_longitude_arrivee` DOUBLE NOT NULL,
  `trajet_latitude_arrivee` DOUBLE NOT NULL,
  `trajet_public` TINYINT(1) NOT NULL,
  `utilisateur_utilisateur_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`trajet_id`),
  CONSTRAINT `fk_trajet_utilisateur1`
    FOREIGN KEY (`utilisateur_utilisateur_id`)
    REFERENCES `utilisateur` (`utilisateur_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `trajet_id_UNIQUE` ON `trajet` (`trajet_id` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_trajet_utilisateur1_idx` ON `trajet` (`utilisateur_utilisateur_id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `evenement`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `evenement` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `evenement` (
  `evenement_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `evenement_nom` VARCHAR(45) NOT NULL,
  `evenement_ville` VARCHAR(45) NOT NULL,
  `evenement_longitude` DOUBLE NULL,
  `evenement_latitude` DOUBLE NULL,
  `evenement_dateheure` DATETIME NOT NULL,
  PRIMARY KEY (`evenement_id`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `evenement_id_UNIQUE` ON `evenement` (`evenement_id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `utilisateur_evenement`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `utilisateur_evenement` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `utilisateur_evenement` (
  `utilisateur_evenement_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `utilisateur_evenement_utilisateur_id` INT UNSIGNED NULL,
  `utilisateur_evenement_evenement_id` INT UNSIGNED NULL,
  PRIMARY KEY (`utilisateur_evenement_id`),
  CONSTRAINT `fk_Utilisateur_has_Evenement_Utilisateur`
    FOREIGN KEY (`utilisateur_evenement_utilisateur_id`)
    REFERENCES `utilisateur` (`utilisateur_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Utilisateur_has_Evenement_Evenement1`
    FOREIGN KEY (`utilisateur_evenement_evenement_id`)
    REFERENCES `evenement` (`evenement_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Utilisateur_has_Evenement_Evenement1_idx` ON `utilisateur_evenement` (`utilisateur_evenement_evenement_id` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_Utilisateur_has_Evenement_Utilisateur_idx` ON `utilisateur_evenement` (`utilisateur_evenement_utilisateur_id` ASC);

SHOW WARNINGS;
CREATE UNIQUE INDEX `Utilisateur_Evenement_id_UNIQUE` ON `utilisateur_evenement` (`utilisateur_evenement_id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `assistance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assistance` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `assistance` (
  `assistance_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `utilisateur_id_2` INT NULL,
  `assistance_longitude` DOUBLE NOT NULL,
  `assistance_latitude` DOUBLE NOT NULL,
  `utilisateur_utilisateur_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`assistance_id`),
  CONSTRAINT `fk_assistance_utilisateur1`
    FOREIGN KEY (`utilisateur_utilisateur_id`)
    REFERENCES `utilisateur` (`utilisateur_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `assistance_id_UNIQUE` ON `assistance` (`assistance_id` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_assistance_utilisateur1_idx` ON `assistance` (`utilisateur_utilisateur_id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `obstacle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `obstacle` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `obstacle` (
  `obstacle_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `obstacle_longitude` DOUBLE NOT NULL,
  `obstacle_latitude` DOUBLE NOT NULL,
  `utilisateur_utilisateur_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`obstacle_id`),
  CONSTRAINT `fk_obstacle_utilisateur1`
    FOREIGN KEY (`utilisateur_utilisateur_id`)
    REFERENCES `utilisateur` (`utilisateur_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `obstacle_id_UNIQUE` ON `obstacle` (`obstacle_id` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_obstacle_utilisateur1_idx` ON `obstacle` (`utilisateur_utilisateur_id` ASC);

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
