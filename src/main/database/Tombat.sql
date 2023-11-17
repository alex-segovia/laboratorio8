-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Tombat
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Tombat
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Tombat` DEFAULT CHARACTER SET utf8 ;
USE `Tombat` ;

-- -----------------------------------------------------
-- Table `Tombat`.`jugador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tombat`.`jugador` (
  `idJugador` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `edad` INT NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `usuario` VARCHAR(45) NOT NULL,
  `contrasena` VARCHAR(45) NOT NULL,
  `horasDelDia` INT NOT NULL,
  `diasDesdeCreacion` INT NOT NULL,
  `aldeaEnDesesperacion` TINYINT NOT NULL DEFAULT 0,
  `estado` VARCHAR(45) NOT NULL DEFAULT 'En paz',
  PRIMARY KEY (`idJugador`),
  UNIQUE INDEX `idjugador_UNIQUE` (`idJugador` ASC) VISIBLE,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tombat`.`listaNegra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tombat`.`listaNegra` (
  `idListaNegra` INT NOT NULL AUTO_INCREMENT,
  `correo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idListaNegra`),
  UNIQUE INDEX `idlistaNegra_UNIQUE` (`idListaNegra` ASC) VISIBLE,
  UNIQUE INDEX `correo_UNIQUE` (`correo` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tombat`.`habitante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tombat`.`habitante` (
  `idHabitante` INT NOT NULL AUTO_INCREMENT,
  `idjugador` INT NOT NULL,
  `nombre` VARCHAR(10) NOT NULL,
  `profesion` VARCHAR(11) NOT NULL,
  `genero` CHAR(1) NOT NULL,
  `horasDelDia` INT NOT NULL,
  `diasVivo` INT NOT NULL,
  `estaExiliado` TINYINT NOT NULL,
  `estaMuerto` TINYINT NOT NULL,
  `alimentacionDiaria` FLOAT NOT NULL,
  `moral` FLOAT NOT NULL,
  `fuerza` FLOAT NULL,
  `produccionAlimento` FLOAT NULL,
  `produccionMoral` FLOAT NULL,
  `motivoMuerte` VARCHAR(45) NULL,
  `diaMuerte` INT NULL,
  PRIMARY KEY (`idHabitante`),
  UNIQUE INDEX `idhabitante_UNIQUE` (`idHabitante` ASC) VISIBLE,
  INDEX `fk_habitante_jugador1_idx` (`idjugador` ASC) VISIBLE,
  CONSTRAINT `fk_habitante_jugador1`
    FOREIGN KEY (`idjugador`)
    REFERENCES `Tombat`.`jugador` (`idJugador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tombat`.`guerra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tombat`.`guerra` (
  `idGuerra` INT NOT NULL AUTO_INCREMENT,
  `idJugadorAtacante` INT NOT NULL,
  `idJugadorDefensor` INT NOT NULL,
  `resultado` VARCHAR(45) NOT NULL,
  `diasRelativosJugadorAtacante` INT NOT NULL,
  `diasRelativosJugadorDefensor` INT NOT NULL,
  PRIMARY KEY (`idGuerra`),
  INDEX `fk_jugador_has_jugador_jugador1_idx` (`idJugadorDefensor` ASC) VISIBLE,
  INDEX `fk_jugador_has_jugador_jugador_idx` (`idJugadorAtacante` ASC) VISIBLE,
  UNIQUE INDEX `idGuerra_UNIQUE` (`idGuerra` ASC) VISIBLE,
  CONSTRAINT `fk_jugador_has_jugador_jugador`
    FOREIGN KEY (`idJugadorAtacante`)
    REFERENCES `Tombat`.`jugador` (`idJugador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_jugador_has_jugador_jugador1`
    FOREIGN KEY (`idJugadorDefensor`)
    REFERENCES `Tombat`.`jugador` (`idJugador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
