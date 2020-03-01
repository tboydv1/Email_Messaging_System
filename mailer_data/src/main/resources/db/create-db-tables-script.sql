-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema mailer-app
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mailer-app
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mailer-app` DEFAULT CHARACTER SET latin1 ;
USE `mailer-app` ;

-- -----------------------------------------------------
-- Table `mailer-app`.`AddressBook`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mailer-app`.`AddressBook` ;

CREATE TABLE IF NOT EXISTS `mailer-app`.`AddressBook` (
  `id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mailer-app`.`Client`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mailer-app`.`Client` ;

CREATE TABLE IF NOT EXISTS `mailer-app`.`Client` (
  `client_id` INT NOT NULL,
  `firstname` VARCHAR(45) NULL,
  `lastname` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `AddressBook_book_id` INT NOT NULL,
  `date_added` DATE NOT NULL,
  PRIMARY KEY (`client_id`),
  INDEX `fk_Client_AddressBook1_idx` (`AddressBook_book_id` ASC),
  CONSTRAINT `fk_Client_AddressBook1`
    FOREIGN KEY (`AddressBook_book_id`)
    REFERENCES `mailer-app`.`AddressBook` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mailer-app`.`Message`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mailer-app`.`Message` ;

CREATE TABLE IF NOT EXISTS `mailer-app`.`Message` (
  `message_id` INT NOT NULL,
  `subject` VARCHAR(45) NULL,
  `body` VARCHAR(45) NULL,
  `date_sent` DATE NOT NULL,
  PRIMARY KEY (`message_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mailer-app`.`MessageRecipient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mailer-app`.`MessageRecipient` ;

CREATE TABLE IF NOT EXISTS `mailer-app`.`MessageRecipient` (
  `Client_client_id` INT NOT NULL,
  `Message_message_id` INT NOT NULL,
  PRIMARY KEY (`Client_client_id`, `Message_message_id`),
  INDEX `fk_Client_has_Message_Message1_idx` (`Message_message_id` ASC),
  INDEX `fk_Client_has_Message_Client_idx` (`Client_client_id` ASC),
  CONSTRAINT `fk_Client_has_Message_Client`
    FOREIGN KEY (`Client_client_id`)
    REFERENCES `mailer-app`.`Client` (`client_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Client_has_Message_Message1`
    FOREIGN KEY (`Message_message_id`)
    REFERENCES `mailer-app`.`Message` (`message_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
