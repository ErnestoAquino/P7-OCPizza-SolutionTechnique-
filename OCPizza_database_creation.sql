-- MySQL Script generated by MySQL Workbench
-- Mon Apr  4 22:44:15 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema OCPizza
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema OCPizza
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `OCPizza` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `OCPizza` ;

-- -----------------------------------------------------
-- Table `OCPizza`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCPizza`.`clients` (
  `client_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NULL DEFAULT NULL,
  `adresse` VARCHAR(100) NULL DEFAULT NULL,
  `adresse_postalcode` VARCHAR(10) NULL DEFAULT NULL,
  `adresse_city` VARCHAR(45) NULL DEFAULT NULL,
  `phone_number` VARCHAR(10) NULL DEFAULT NULL,
  `email` VARCHAR(30) NULL DEFAULT NULL,
  `nick` VARCHAR(15) NULL DEFAULT NULL,
  `password` VARCHAR(15) NULL DEFAULT NULL,
  PRIMARY KEY (`client_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `OCPizza`.`status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCPizza`.`status` (
  `status_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL,
  `description` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`status_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `OCPizza`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCPizza`.`orders` (
  `order_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `status_id` INT UNSIGNED NOT NULL,
  `payment_method` VARCHAR(15) NULL DEFAULT NULL,
  `delivery_type` VARCHAR(15) NULL DEFAULT NULL,
  `total` FLOAT NULL DEFAULT NULL,
  `date` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`, `status_id`),
  INDEX `fk_orders_status1_idx` (`status_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_status1`
    FOREIGN KEY (`status_id`)
    REFERENCES `OCPizza`.`status` (`status_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `OCPizza`.`clients_orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCPizza`.`clients_orders` (
  `client_id` INT UNSIGNED NOT NULL,
  `order_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`client_id`, `order_id`),
  INDEX `fk_clients_has_orders_orders1_idx` (`order_id` ASC) VISIBLE,
  INDEX `fk_clients_has_orders_clients1_idx` (`client_id` ASC) VISIBLE,
  CONSTRAINT `fk_clients_has_orders_clients1`
    FOREIGN KEY (`client_id`)
    REFERENCES `OCPizza`.`clients` (`client_id`),
  CONSTRAINT `fk_clients_has_orders_orders1`
    FOREIGN KEY (`order_id`)
    REFERENCES `OCPizza`.`orders` (`order_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `OCPizza`.`credit_cards`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCPizza`.`credit_cards` (
  `credit_card_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `credit_card_number` VARCHAR(16) NOT NULL,
  `expiration_moth` VARCHAR(2) NOT NULL,
  `expiration_year` YEAR NOT NULL,
  `client_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`credit_card_id`, `client_id`),
  INDEX `fk_credit_cards_clients1_idx` (`client_id` ASC) VISIBLE,
  CONSTRAINT `fk_credit_cards_clients1`
    FOREIGN KEY (`client_id`)
    REFERENCES `OCPizza`.`clients` (`client_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `OCPizza`.`pizzerias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCPizza`.`pizzerias` (
  `pizzeria_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(15) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `adress_postalcode` VARCHAR(10) NOT NULL,
  `adress_city` VARCHAR(45) NOT NULL,
  `pizzeria_phone` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`pizzeria_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `OCPizza`.`positions_job`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCPizza`.`positions_job` (
  `position_job_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `position` VARCHAR(15) NOT NULL,
  `description` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`position_job_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `OCPizza`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCPizza`.`employees` (
  `employee_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL,
  `nick` VARCHAR(15) NOT NULL,
  `pasword` VARCHAR(15) NOT NULL,
  `access` TINYINT NOT NULL,
  `position_job_id` INT UNSIGNED NOT NULL,
  `pizzeria_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`employee_id`, `position_job_id`, `pizzeria_id`),
  INDEX `fk_employees_positions_job1_idx` (`position_job_id` ASC) VISIBLE,
  INDEX `fk_employees_pizzerias1_idx` (`pizzeria_id` ASC) VISIBLE,
  CONSTRAINT `fk_employees_pizzerias1`
    FOREIGN KEY (`pizzeria_id`)
    REFERENCES `OCPizza`.`pizzerias` (`pizzeria_id`),
  CONSTRAINT `fk_employees_positions_job1`
    FOREIGN KEY (`position_job_id`)
    REFERENCES `OCPizza`.`positions_job` (`position_job_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `OCPizza`.`items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCPizza`.`items` (
  `item_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `item_code` VARCHAR(5) NOT NULL,
  `name` VARCHAR(30) NOT NULL,
  `stock` FLOAT NOT NULL,
  `unit` VARCHAR(15) NULL DEFAULT NULL,
  `date_of_expiry` DATE NULL DEFAULT NULL,
  `pizzeria_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`item_id`, `pizzeria_id`),
  INDEX `fk_items_pizzerias1_idx` (`pizzeria_id` ASC) VISIBLE,
  CONSTRAINT `fk_items_pizzerias1`
    FOREIGN KEY (`pizzeria_id`)
    REFERENCES `OCPizza`.`pizzerias` (`pizzeria_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 18
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `OCPizza`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCPizza`.`products` (
  `product_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_code` VARCHAR(5) NOT NULL,
  `name` VARCHAR(30) NOT NULL,
  `description` LONGTEXT NULL DEFAULT NULL,
  `date_of_expiry` DATE NULL DEFAULT NULL,
  `stock` FLOAT NOT NULL,
  `unit` VARCHAR(15) NULL DEFAULT NULL,
  `recipe` LONGTEXT NULL DEFAULT NULL,
  `price` DOUBLE NOT NULL,
  `pizzeria_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`product_id`, `pizzeria_id`),
  INDEX `fk_products_pizzerias1_idx` (`pizzeria_id` ASC) VISIBLE,
  CONSTRAINT `fk_products_pizzerias1`
    FOREIGN KEY (`pizzeria_id`)
    REFERENCES `OCPizza`.`pizzerias` (`pizzeria_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 22
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `OCPizza`.`order_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCPizza`.`order_detail` (
  `order_id` INT UNSIGNED NOT NULL,
  `product_id` INT UNSIGNED NOT NULL,
  `quantity` INT NULL DEFAULT NULL,
  `price` FLOAT NULL DEFAULT NULL,
  `comments` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`, `product_id`),
  INDEX `fk_orders_has_products_products1_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_orders_has_products_orders1_idx` (`order_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_has_products_orders1`
    FOREIGN KEY (`order_id`)
    REFERENCES `OCPizza`.`orders` (`order_id`),
  CONSTRAINT `fk_orders_has_products_products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `OCPizza`.`products` (`product_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `OCPizza`.`personal_informations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCPizza`.`personal_informations` (
  `personal_information_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `adress` VARCHAR(45) NULL DEFAULT NULL,
  `date_of_birth` DATE NULL DEFAULT NULL,
  `emergency_contact_details` VARCHAR(45) NULL DEFAULT NULL,
  `phone_number` VARCHAR(20) NULL DEFAULT NULL,
  `employee_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`personal_information_id`),
  INDEX `fk_personal_informations_employees1_idx` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_personal_informations_employees1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `OCPizza`.`employees` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `OCPizza`.`pizzerias_clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCPizza`.`pizzerias_clients` (
  `pizzeria_id` INT UNSIGNED NOT NULL,
  `client_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`pizzeria_id`, `client_id`),
  INDEX `fk_pizzerias_has_clients_clients1_idx` (`client_id` ASC) VISIBLE,
  INDEX `fk_pizzerias_has_clients_pizzerias1_idx` (`pizzeria_id` ASC) VISIBLE,
  CONSTRAINT `fk_pizzerias_has_clients_clients1`
    FOREIGN KEY (`client_id`)
    REFERENCES `OCPizza`.`clients` (`client_id`),
  CONSTRAINT `fk_pizzerias_has_clients_pizzerias1`
    FOREIGN KEY (`pizzeria_id`)
    REFERENCES `OCPizza`.`pizzerias` (`pizzeria_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `OCPizza`.`products_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OCPizza`.`products_items` (
  `product_id` INT UNSIGNED NOT NULL,
  `item_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`product_id`, `item_id`),
  INDEX `fk_products_has_items_items1_idx` (`item_id` ASC) VISIBLE,
  INDEX `fk_products_has_items_products1_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_products_has_items_items1`
    FOREIGN KEY (`item_id`)
    REFERENCES `OCPizza`.`items` (`item_id`),
  CONSTRAINT `fk_products_has_items_products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `OCPizza`.`products` (`product_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
