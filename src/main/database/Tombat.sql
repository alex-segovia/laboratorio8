-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema tombat
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tombat
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tombat` DEFAULT CHARACTER SET utf8mb3 ;
USE `tombat` ;

-- -----------------------------------------------------
-- Table `tombat`.`jugador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tombat`.`jugador` (
  `idJugador` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `edad` INT NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `usuario` VARCHAR(45) NOT NULL,
  `contrasena` VARCHAR(256) NOT NULL,
  `horasDelDia` INT NOT NULL,
  `diasDesdeCreacion` INT NOT NULL,
  `estado` VARCHAR(45) NOT NULL DEFAULT 'En paz',
  `alimentoTotal` FLOAT NOT NULL,
  PRIMARY KEY (`idJugador`),
  UNIQUE INDEX `idjugador_UNIQUE` (`idJugador` ASC) VISIBLE,
  UNIQUE INDEX `usuario_UNIQUE` (`usuario` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `tombat`.`guerra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tombat`.`guerra` (
  `idGuerra` INT NOT NULL AUTO_INCREMENT,
  `idJugadorAtacante` INT NOT NULL,
  `idJugadorDefensor` INT NOT NULL,
  `resultado` VARCHAR(45) NOT NULL,
  `diasRelativosJugadorAtacante` INT NOT NULL,
  `diasRelativosJugadorDefensor` INT NOT NULL,
  `diferenciaFuerzaAtacante` FLOAT NOT NULL,
  `diferenciaFuerzaDefensor` FLOAT NOT NULL,
  `diferenciaMoralAtacante` FLOAT NOT NULL,
  `diferenciaMoralDefensor` FLOAT NOT NULL,
  `diferenciaAlimentoTotalAtacante` FLOAT NOT NULL,
  `diferenciaAlimentoTotalDefensor` FLOAT NOT NULL,
  `diferenciaProduccionAlimentoTotalAtacante` FLOAT NOT NULL,
  `diferenciaProduccionAlimentoTotalDefensor` FLOAT NOT NULL,
  `diferenciaProduccionMoralTotalAtacante` FLOAT NOT NULL,
  `diferenciaProduccionMoralTotalDefensor` FLOAT NOT NULL,
  `diferenciaCantidadSoldadosAtacante` INT NOT NULL,
  `diferenciaCantidadSoldadosDefensor` INT NOT NULL,
  `diferenciaCantidadConstructoresAtacante` INT NOT NULL,
  `diferenciaCantidadConstructoresDefensor` INT NOT NULL,
  `diferenciaCantidadHabitantesAtacante` INT NOT NULL,
  `diferenciaCantidadHabitantesDefensor` INT NOT NULL,
  `habitantesTransferidos` INT NOT NULL,
  `fuerzaTotalJugadorAtacante` FLOAT NOT NULL,
  `fuerzaTotalJugadorDefensor` FLOAT NOT NULL,
  PRIMARY KEY (`idGuerra`),
  UNIQUE INDEX `idGuerra_UNIQUE` (`idGuerra` ASC) VISIBLE,
  INDEX `fk_jugador_has_jugador_jugador1_idx` (`idJugadorDefensor` ASC) VISIBLE,
  INDEX `fk_jugador_has_jugador_jugador_idx` (`idJugadorAtacante` ASC) VISIBLE,
  CONSTRAINT `fk_jugador_has_jugador_jugador`
    FOREIGN KEY (`idJugadorAtacante`)
    REFERENCES `tombat`.`jugador` (`idJugador`),
  CONSTRAINT `fk_jugador_has_jugador_jugador1`
    FOREIGN KEY (`idJugadorDefensor`)
    REFERENCES `tombat`.`jugador` (`idJugador`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `tombat`.`habitante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tombat`.`habitante` (
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
  `fuerza` FLOAT NULL DEFAULT NULL,
  `produccionAlimento` FLOAT NULL DEFAULT NULL,
  `produccionMoral` FLOAT NULL DEFAULT NULL,
  `motivoMuerte` VARCHAR(45) NULL DEFAULT NULL,
  `diaMuerte` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idHabitante`),
  UNIQUE INDEX `idhabitante_UNIQUE` (`idHabitante` ASC) VISIBLE,
  INDEX `fk_habitante_jugador1_idx` (`idjugador` ASC) VISIBLE,
  CONSTRAINT `fk_habitante_jugador1`
    FOREIGN KEY (`idjugador`)
    REFERENCES `tombat`.`jugador` (`idJugador`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `tombat`.`listanegra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tombat`.`listanegra` (
  `idListaNegra` INT NOT NULL AUTO_INCREMENT,
  `correo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idListaNegra`),
  UNIQUE INDEX `idlistaNegra_UNIQUE` (`idListaNegra` ASC) VISIBLE,
  UNIQUE INDEX `correo_UNIQUE` (`correo` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;