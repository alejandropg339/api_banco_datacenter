-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema banco_datacenter_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema banco_datacenter_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `banco_datacenter_db` DEFAULT CHARACTER SET utf8 ;
USE `banco_datacenter_db` ;

-- -----------------------------------------------------
-- Table `banco_datacenter_db`.`cuenta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banco_datacenter_db`.`cuenta` (
  `num` INT(6) ZEROFILL UNSIGNED NOT NULL,
  `saldo` DOUBLE NOT NULL,
  PRIMARY KEY (`num`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `banco_datacenter_db`.`ciudad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banco_datacenter_db`.`ciudad` (
  `id` INT(6) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `banco_datacenter_db`.`tipo_transaccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banco_datacenter_db`.`tipo_transaccion` (
  `id` INT(6) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `banco_datacenter_db`.`auditoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banco_datacenter_db`.`auditoria` (
  `id` INT(8) NOT NULL,
  `valor` DOUBLE NOT NULL,
  `fecha` DATETIME NOT NULL,
  `tipo` INT(6) NOT NULL,
  `cuenta` INT(6) ZEROFILL UNSIGNED NOT NULL,
  `ciudad` INT(6) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_transaccion_tipo_transaccion_idx` (`tipo` ASC),
  INDEX `fk_transaccion_cuenta_idx` (`cuenta` ASC),
  INDEX `fk_auditoria_ciudad_idx` (`ciudad` ASC),
  CONSTRAINT `fk_transaccion_tipo_transaccion`
    FOREIGN KEY (`tipo`)
    REFERENCES `banco_datacenter_db`.`tipo_transaccion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaccion_cuenta`
    FOREIGN KEY (`cuenta`)
    REFERENCES `banco_datacenter_db`.`cuenta` (`num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_auditoria_ciudad`
    FOREIGN KEY (`ciudad`)
    REFERENCES `banco_datacenter_db`.`ciudad` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
