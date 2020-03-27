-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema urbangardendb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `urbangardendb` ;

-- -----------------------------------------------------
-- Schema urbangardendb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `urbangardendb` DEFAULT CHARACTER SET utf8 ;
USE `urbangardendb` ;

-- -----------------------------------------------------
-- Table `garden`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `garden` ;

CREATE TABLE IF NOT EXISTS `garden` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `size` DOUBLE NOT NULL,
  `organic` TINYINT NOT NULL COMMENT 'THIS SUPPOSED TO BE A BOOLEAN!!!!!',
  `description` VARCHAR(300) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(250) NULL,
  `street2` VARCHAR(250) NULL,
  `zip_code` INT NULL,
  `city` VARCHAR(100) NULL,
  `state` VARCHAR(100) NULL,
  `country` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(65) NOT NULL,
  `last_name` VARCHAR(65) NOT NULL,
  `username` VARCHAR(100) NOT NULL,
  `passwod` VARCHAR(45) NOT NULL,
  `enabled` TINYINT NOT NULL DEFAULT 1,
  `role` VARCHAR(45) NOT NULL,
  `garden_id` INT NULL,
  `address_id` INT NULL,
  `phone_number` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `garden_id`
    FOREIGN KEY (`garden_id`)
    REFERENCES `garden` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `address_id`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `product` ;

CREATE TABLE IF NOT EXISTS `product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `type` VARCHAR(100) NOT NULL,
  `description` VARCHAR(350) NOT NULL,
  `size_of_product` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `garden_produce`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `garden_produce` ;

CREATE TABLE IF NOT EXISTS `garden_produce` (
  `garden_id` INT NOT NULL,
  `produce_id` INT NOT NULL,
  `amount` INT NOT NULL,
  PRIMARY KEY (`garden_id`, `produce_id`),
  CONSTRAINT `fk_garden_produce_garden_id`
    FOREIGN KEY (`garden_id`)
    REFERENCES `garden` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_garden_produce_produce_id`
    FOREIGN KEY (`produce_id`)
    REFERENCES `product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `item_recepit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `item_recepit` ;

CREATE TABLE IF NOT EXISTS `item_recepit` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `produce_id_traded` INT NOT NULL,
  `user_id` INT NOT NULL,
  `rating` INT NULL,
  `comment` VARCHAR(350) NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_item_receipt_trade_transaction_seller_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `trade_transaction` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_receipt_trade_transaction_buyer_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `trade_transaction` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trade_transaction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trade_transaction` ;

CREATE TABLE IF NOT EXISTS `trade_transaction` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `seller_id` INT NOT NULL,
  `buyer_id` INT NOT NULL,
  `receipt_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_trade_transaction_user_seller`
    FOREIGN KEY (`id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_trade_transaction_user_buyer`
    FOREIGN KEY (`id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_trade_transaction_item_receipt_id`
    FOREIGN KEY (`receipt_id`)
    REFERENCES `item_recepit` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `item_traded`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `item_traded` ;

CREATE TABLE IF NOT EXISTS `item_traded` (
  `item_recepit_id` INT NOT NULL,
  `produce_traded_id` INT NOT NULL,
  `amount_traded` INT NOT NULL,
  PRIMARY KEY (`item_recepit_id`, `produce_traded_id`),
  CONSTRAINT `fk_item_traded_item_receipt_id`
    FOREIGN KEY (`item_recepit_id`)
    REFERENCES `item_recepit` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_traded_produce_traded_id`
    FOREIGN KEY (`produce_traded_id`)
    REFERENCES `garden_produce` (`garden_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS gardenuser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'gardenuser'@'localhost' IDENTIFIED BY 'gardenuser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'gardenuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `urbangardendb`;
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `passwod`, `enabled`, `role`, `garden_id`, `address_id`, `phone_number`) VALUES (1, 'JJ', 'Smith', 'jjsmith', 'jjsmithpassword', 1, 'admin', NULL, NULL, '');

COMMIT;

