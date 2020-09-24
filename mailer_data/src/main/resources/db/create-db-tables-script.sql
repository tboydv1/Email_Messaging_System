-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema mailer_app
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mailer_app` ;

-- -----------------------------------------------------
-- Schema mailer_app
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mailer_app` DEFAULT CHARACTER SET latin1 ;
USE `mailer_app` ;

-- -----------------------------------------------------
-- Table `mailer_app`.`address_book`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mailer_app`.`address_book` ;

CREATE TABLE IF NOT EXISTS `mailer_app`.`address_book` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `mailer_app`.`client`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mailer_app`.`client` ;

CREATE TABLE IF NOT EXISTS `mailer_app`.`client` (
  `client_id` INT(11) NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(45) NULL DEFAULT NULL,
  `lastname` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `addressBook_id` INT(11) NOT NULL,
  `date_added` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`client_id`),
  INDEX `fk_Client_AddressBook1_idx` (`addressBook_id` ASC),
  CONSTRAINT `fk_Client_AddressBook1`
    FOREIGN KEY (`addressBook_id`)
    REFERENCES `mailer_app`.`address_book` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `mailer_app`.`message`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mailer_app`.`message` ;

CREATE TABLE IF NOT EXISTS `mailer_app`.`message` (
  `message_id` INT(11) NOT NULL AUTO_INCREMENT,
  `subject` VARCHAR(45) NULL DEFAULT NULL,
  `body` VARCHAR(45) NULL DEFAULT NULL,
  `date_sent` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`message_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `mailer_app`.`message_recipient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mailer_app`.`message_recipient` ;

CREATE TABLE IF NOT EXISTS `mailer_app`.`message_recipient` (
  `client_id` INT(11) NOT NULL,
  `message_id` INT(11) NOT NULL,
  PRIMARY KEY (`client_id`, `message_id`),
  INDEX `fk_Client_has_Message_Message1_idx` (`message_id` ASC),
  INDEX `fk_Client_has_Message_Client_idx` (`client_id` ASC),
  CONSTRAINT `fk_Client_has_Message_Client`
    FOREIGN KEY (`client_id`)
    REFERENCES `mailer_app`.`client` (`client_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Client_has_Message_Message1`
    FOREIGN KEY (`message_id`)
    REFERENCES `mailer_app`.`message` (`message_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
