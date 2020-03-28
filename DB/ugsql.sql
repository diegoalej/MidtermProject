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
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(65) NOT NULL,
  `last_name` VARCHAR(65) NOT NULL,
  `username` VARCHAR(100) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `enabled` TINYINT NOT NULL DEFAULT 1,
  `role` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(45) NULL,
  `image_url` VARCHAR(5000) NULL,
  `address_id` INT NULL,
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
-- Table `garden_store_front`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `garden_store_front` ;

CREATE TABLE IF NOT EXISTS `garden_store_front` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `size` DOUBLE NOT NULL,
  `organic` TINYINT NOT NULL COMMENT 'THIS SUPPOSED TO BE A BOOLEAN!!!!!',
  `name_of_garden` VARCHAR(100) NOT NULL,
  `user_id` INT NOT NULL,
  `description` VARCHAR(300) NULL,
  `fk_garden_address_id` INT NULL,
  `garden_url` VARCHAR(5000) NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_garden_address_id`
    FOREIGN KEY (`fk_garden_address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_garden_store_front_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
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
  `size_of_product` ENUM('small', 'medium', 'large', 'extra large') NULL,
  `image_url` VARCHAR(5000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `garden_produce`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `garden_produce` ;

CREATE TABLE IF NOT EXISTS `garden_produce` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `garden_id` INT NOT NULL,
  `produce_id` INT NOT NULL,
  `amount` INT NOT NULL,
  `active` TINYINT NOT NULL DEFAULT 1,
  `date_expected_available` DATE NULL,
  `date_harvested` DATE NULL,
  `date_exipres` DATE NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_garden_produce_garden_id`
    FOREIGN KEY (`garden_id`)
    REFERENCES `garden_store_front` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_garden_produce_produce_id`
    FOREIGN KEY (`produce_id`)
    REFERENCES `product` (`id`)
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
  `enum_approved_rejected_waiting` ENUM('accpeted', 'rejected', 'waiting') NOT NULL DEFAULT 'waiting',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `line_item_recepit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `line_item_recepit` ;

CREATE TABLE IF NOT EXISTS `line_item_recepit` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `produce_id_traded` INT NOT NULL,
  `user_id` INT NOT NULL,
  `trade_transaction_id` INT NOT NULL,
  `boolean_was_seller` TINYINT NOT NULL,
  `amount_traded` INT NOT NULL,
  `comment` VARCHAR(200) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gardern_rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gardern_rating` ;

CREATE TABLE IF NOT EXISTS `gardern_rating` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `garden_id` INT NOT NULL,
  `rating` INT NOT NULL,
  `comment` VARCHAR(250) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trade_request`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trade_request` ;

CREATE TABLE IF NOT EXISTS `trade_request` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `buyer_garden_id_request` INT NOT NULL,
  `seller_garden_id_request` INT NOT NULL,
  `buyer_produce_id` INT NOT NULL,
  `seller_produce_id` INT NOT NULL,
  `requested_amount_from_seller` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `offer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `offer` ;

CREATE TABLE IF NOT EXISTS `offer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `offer_date` DATETIME NOT NULL,
  `garden_produce_id` INT NOT NULL,
  `offered_produce_id` INT NOT NULL,
  `accepted_rejected` TINYINT NULL,
  `comment` VARCHAR(250) NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_offer_give_garden_produce_id`
    FOREIGN KEY (`offered_produce_id`)
    REFERENCES `garden_produce` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_offer_receive_garden_produce_id`
    FOREIGN KEY (`garden_produce_id`)
    REFERENCES `garden_produce` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trade` ;

CREATE TABLE IF NOT EXISTS `trade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `trade_date` DATETIME NOT NULL,
  `offer_id` INT NOT NULL,
  `comment_by_buyer` VARCHAR(250) NULL,
  `rating_by_buyer` INT NULL,
  `comment_by_seller` VARCHAR(250) NULL,
  `rating_by_seller` INT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_trade_offer_id`
    FOREIGN KEY (`offer_id`)
    REFERENCES `offer` (`id`)
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
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `enabled`, `role`, `phone_number`, `image_url`, `address_id`) VALUES (1, 'JJ', 'Smith', 'jjsmith', 'jjsmithpassword', 1, 'admin', NULL, NULL, NULL );

COMMIT;


-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `urbangardendb`;
INSERT INTO `address` (`id`, `street`, `street2`, `zip_code`, `city`, `state`, `country`) VALUES (1, '2345 Random Street', NULL, 80111, 'Denver', 'Colorado', 'United States');

COMMIT;


-- -----------------------------------------------------
-- Data for table `garden_store_front`
-- -----------------------------------------------------
START TRANSACTION;
USE `urbangardendb`;
INSERT INTO `garden_store_front` (`id`, `size`, `organic`, `name_of_garden`, `user_id`, `description`, `fk_garden_address_id`, `garden_url`) VALUES (1, 100, 1, 'Marge\'s Place', 1, 'The best tomatoes you\'ve ever had. Also, I have honey.', 1, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `product`
-- -----------------------------------------------------
START TRANSACTION;
USE `urbangardendb`;
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (1, 'Tomatoes', 'Cherokee Purple', 'Large, Purple, Heirloom tomato', 'Large', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (2, 'Melon', 'Watermelon', 'Large, green, sweet melon', 'Extra Large', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `garden_produce`
-- -----------------------------------------------------
START TRANSACTION;
USE `urbangardendb`;
INSERT INTO `garden_produce` (`id`, `garden_id`, `produce_id`, `amount`, `active`, `date_expected_available`, `date_harvested`, `date_exipres`) VALUES (1, 1, 1, 12, 1, '2020-10-10', '2020-10-11', '2020-11-11');
INSERT INTO `garden_produce` (`id`, `garden_id`, `produce_id`, `amount`, `active`, `date_expected_available`, `date_harvested`, `date_exipres`) VALUES (2, 1, 2, 1, 1, '2020-09-30', '2020-10-01', '2020-11-01');

COMMIT;


-- -----------------------------------------------------
-- Data for table `offer`
-- -----------------------------------------------------
START TRANSACTION;
USE `urbangardendb`;
INSERT INTO `offer` (`id`, `offer_date`, `garden_produce_id`, `offered_produce_id`, `accepted_rejected`, `comment`) VALUES (1, '2020-06-30', 1, 2, 1, 'We love your tomatoes');
INSERT INTO `offer` (`id`, `offer_date`, `garden_produce_id`, `offered_produce_id`, `accepted_rejected`, `comment`) VALUES (2, '2020-07-15', 2, 1, NULL, 'Your Melons make me happy');

COMMIT;


-- -----------------------------------------------------
-- Data for table `trade`
-- -----------------------------------------------------
START TRANSACTION;
USE `urbangardendb`;
INSERT INTO `trade` (`id`, `trade_date`, `offer_id`, `comment_by_buyer`, `rating_by_buyer`, `comment_by_seller`, `rating_by_seller`) VALUES (1, '2020-06-29', 1, 'Great transaction', 5, 'Great melons. Very juicy', 5);

COMMIT;

