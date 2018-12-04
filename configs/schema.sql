-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema logindb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `logindb` ;

-- -----------------------------------------------------
-- Schema logindb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `logindb` DEFAULT CHARACTER SET utf8 ;
USE `logindb` ;

-- -----------------------------------------------------
-- Table `logindb`.`Users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `logindb`.`Users` ;

CREATE TABLE IF NOT EXISTS `logindb`.`Users` (
  `User_Id` INT NOT NULL AUTO_INCREMENT,
  `Username` VARCHAR(128) NOT NULL,
  `Password_Hash` VARCHAR(128) NOT NULL,
  `User_Active` TINYINT NOT NULL,
  `User_Admin` TINYINT NOT NULL,
  `User_Meta` VARCHAR(45) NULL,
  PRIMARY KEY (`User_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `logindb`.`Urls`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `logindb`.`Urls` ;

CREATE TABLE IF NOT EXISTS `logindb`.`Urls` (
  `Url_Id` INT NOT NULL AUTO_INCREMENT,
  `Url_Path` VARCHAR(128) NOT NULL,
  `Url_Link` VARCHAR(45) NULL,
  `Url_Active` TINYINT NULL,
  `Url_User_Id` INT NOT NULL,
  PRIMARY KEY (`Url_Id`, `Url_User_Id`),
  INDEX `fk_Urls_Users_idx` (`Url_User_Id` ASC),
  CONSTRAINT `fk_Urls_Users`
    FOREIGN KEY (`Url_User_Id`)
    REFERENCES `logindb`.`Users` (`User_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `logindb`.`Visits`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `logindb`.`Visits` ;

CREATE TABLE IF NOT EXISTS `logindb`.`Visits` (
  `Visit_Id` INT NOT NULL AUTO_INCREMENT,
  `Visit_Ip` VARCHAR(45) NOT NULL,
  `Visit_City` VARCHAR(45) NULL,
  `Visit_Country` VARCHAR(45) NULL,
  `Visit_Region` VARCHAR(45) NULL,
  `Visit_Refer` VARCHAR(127) NULL,
  `Visit_Url_Id` INT NOT NULL,
  PRIMARY KEY (`Visit_Id`, `Visit_Url_Id`),
  INDEX `fk_Visits_Urls1_idx` (`Visit_Url_Id` ASC),
  CONSTRAINT `fk_Visits_Urls1`
    FOREIGN KEY (`Visit_Url_Id`)
    REFERENCES `logindb`.`Urls` (`Url_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
