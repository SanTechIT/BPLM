-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema logindb
-- -----------------------------------------------------
DROP DATABASE IF EXISTS `logindb` ;

-- -----------------------------------------------------
-- Schema logindb
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS `logindb` DEFAULT CHARACTER SET utf8 ;
USE logindb;

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
