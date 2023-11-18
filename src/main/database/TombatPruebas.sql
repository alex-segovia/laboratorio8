-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tombat
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `guerra`
--

DROP TABLE IF EXISTS `guerra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guerra` (
  `idGuerra` int NOT NULL AUTO_INCREMENT,
  `idJugadorAtacante` int NOT NULL,
  `idJugadorDefensor` int NOT NULL,
  `resultado` varchar(45) NOT NULL,
  `diasRelativosJugadorAtacante` int NOT NULL,
  `diasRelativosJugadorDefensor` int NOT NULL,
  PRIMARY KEY (`idGuerra`),
  UNIQUE KEY `idGuerra_UNIQUE` (`idGuerra`),
  KEY `fk_jugador_has_jugador_jugador1_idx` (`idJugadorDefensor`),
  KEY `fk_jugador_has_jugador_jugador_idx` (`idJugadorAtacante`),
  CONSTRAINT `fk_jugador_has_jugador_jugador` FOREIGN KEY (`idJugadorAtacante`) REFERENCES `jugador` (`idJugador`),
  CONSTRAINT `fk_jugador_has_jugador_jugador1` FOREIGN KEY (`idJugadorDefensor`) REFERENCES `jugador` (`idJugador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guerra`
--

LOCK TABLES `guerra` WRITE;
/*!40000 ALTER TABLE `guerra` DISABLE KEYS */;
/*!40000 ALTER TABLE `guerra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habitante`
--

DROP TABLE IF EXISTS `habitante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habitante` (
  `idHabitante` int NOT NULL AUTO_INCREMENT,
  `idjugador` int NOT NULL,
  `nombre` varchar(10) NOT NULL,
  `profesion` varchar(11) NOT NULL,
  `genero` char(1) NOT NULL,
  `horasDelDia` int NOT NULL,
  `diasVivo` int NOT NULL,
  `estaExiliado` tinyint NOT NULL,
  `estaMuerto` tinyint NOT NULL,
  `alimentacionDiaria` float NOT NULL,
  `moral` float NOT NULL,
  `fuerza` float DEFAULT NULL,
  `produccionAlimento` float DEFAULT NULL,
  `produccionMoral` float DEFAULT NULL,
  `motivoMuerte` varchar(45) DEFAULT NULL,
  `diaMuerte` int DEFAULT NULL,
  PRIMARY KEY (`idHabitante`),
  UNIQUE KEY `idhabitante_UNIQUE` (`idHabitante`),
  KEY `fk_habitante_jugador1_idx` (`idjugador`),
  CONSTRAINT `fk_habitante_jugador1` FOREIGN KEY (`idjugador`) REFERENCES `jugador` (`idJugador`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitante`
--

LOCK TABLES `habitante` WRITE;
/*!40000 ALTER TABLE `habitante` DISABLE KEYS */;
INSERT INTO `habitante` VALUES (1,1,'Alvaro','Constructor','M',0,2,0,0,53,34.0945,17,NULL,10,NULL,NULL),(2,1,'Josh','Granjero','M',0,2,0,0,28,58.0946,NULL,113,NULL,NULL,NULL),(3,1,'Gabriel','Granjero','M',0,2,0,0,19,51.0946,NULL,102,NULL,NULL,NULL),(5,2,'Michi','Granjero','M',0,3,1,0,15,45.5847,NULL,109,NULL,NULL,NULL),(6,2,'Julio','Constructor','M',0,4,0,1,59,37.0946,20,NULL,15,'Hambre',4),(7,2,'Camila','Soldado','F',0,4,0,1,89,31.0946,18,NULL,7,'Hambre',4),(8,1,'Victor','Constructor','M',0,1,0,0,55,24.0946,8,NULL,12,NULL,NULL),(9,1,'Spinzi','Granjero','M',0,0,1,0,25,53.5098,NULL,175,NULL,NULL,NULL),(10,1,'Minaya','Soldado','M',0,1,0,0,90,57.0946,15,NULL,16,NULL,NULL),(11,3,'Kiwi','Granjero','O',0,2,0,0,14,-9.49015,NULL,127,NULL,NULL,NULL),(12,3,'Stuardo','Soldado','M',0,2,0,0,85,-0.490154,36,NULL,0,NULL,NULL),(13,3,'Papaya','Granjero','M',0,2,0,0,24,-4.49015,NULL,153,NULL,NULL,NULL),(14,2,'ola1','Ninguna','M',0,6,0,0,31,28.5098,NULL,NULL,NULL,NULL,NULL),(15,2,'ola2','Ninguna','M',0,5,0,1,41,19.5098,NULL,NULL,NULL,'Hambre',6),(16,2,'ola3','Ninguna','M',0,5,0,1,41,20.5098,NULL,NULL,NULL,'Hambre',6),(17,2,'ola4','Ninguna','M',0,4,0,1,47,29.5098,NULL,NULL,NULL,'Hambre',5),(18,2,'ola5','Ninguna','M',0,6,0,0,38,23.5098,NULL,NULL,NULL,NULL,NULL),(19,2,'ola6','Ninguna','M',0,6,0,0,30,29.5098,NULL,NULL,NULL,NULL,NULL),(20,2,'ola7','Ninguna','M',0,3,0,1,49,37.5098,NULL,NULL,NULL,'Hambre',4),(21,2,'ola8','Ninguna','M',0,5,0,1,39,21.5098,NULL,NULL,NULL,'Hambre',6),(22,2,'ola9','Ninguna','M',0,6,0,0,38,22.5098,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `habitante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugador`
--

DROP TABLE IF EXISTS `jugador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugador` (
  `idJugador` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `edad` int NOT NULL,
  `correo` varchar(45) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `contrasena` varchar(256) NOT NULL,
  `horasDelDia` int NOT NULL,
  `diasDesdeCreacion` int NOT NULL,
  `estado` varchar(45) NOT NULL DEFAULT 'En paz',
  `alimentoTotal` float NOT NULL,
  PRIMARY KEY (`idJugador`),
  UNIQUE KEY `idjugador_UNIQUE` (`idJugador`),
  UNIQUE KEY `usuario_UNIQUE` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugador`
--

LOCK TABLES `jugador` WRITE;
/*!40000 ALTER TABLE `jugador` DISABLE KEYS */;
INSERT INTO `jugador` VALUES (1,'Alex',20,'correo1@gmail.com','Bulbasaur','93137ff60988595604f8da263222f2e67350ee6effeb90e8dbd3fc908321fe13',0,2,'En paz',0),(2,'Josh',20,'correo2@gmail.com','Pikachu','93137ff60988595604f8da263222f2e67350ee6effeb90e8dbd3fc908321fe13',0,7,'En paz',0),(3,'Gabriel',20,'correo3@gmail.com','Squirtle','93137ff60988595604f8da263222f2e67350ee6effeb90e8dbd3fc908321fe13',0,2,'En paz',0),(4,'Hineill',19,'correo4@gmail.com','Psyduck','93137ff60988595604f8da263222f2e67350ee6effeb90e8dbd3fc908321fe13',0,0,'En paz',0),(5,'Santiago',20,'correo5@gmail.com','Nidoking','93137ff60988595604f8da263222f2e67350ee6effeb90e8dbd3fc908321fe13',0,0,'En paz',0),(6,'Jampi',20,'correo6@gmail.com','Charmander','93137ff60988595604f8da263222f2e67350ee6effeb90e8dbd3fc908321fe13',0,0,'En paz',0),(7,'Mayte',19,'correo7@gmail.com','Jigglypuff','93137ff60988595604f8da263222f2e67350ee6effeb90e8dbd3fc908321fe13',0,0,'En paz',0),(8,'Alvaro',29,'correo8@gmail.com','Eevee','93137ff60988595604f8da263222f2e67350ee6effeb90e8dbd3fc908321fe13',0,0,'En paz',0),(9,'Stuardo',32,'correo9@gmail.com','Snorlax','93137ff60988595604f8da263222f2e67350ee6effeb90e8dbd3fc908321fe13',0,0,'En paz',0),(10,'Minaya',28,'correo10@gmail.com','Dragonite','93137ff60988595604f8da263222f2e67350ee6effeb90e8dbd3fc908321fe13',0,0,'En paz',0);
/*!40000 ALTER TABLE `jugador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listanegra`
--

DROP TABLE IF EXISTS `listanegra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `listanegra` (
  `idListaNegra` int NOT NULL AUTO_INCREMENT,
  `correo` varchar(45) NOT NULL,
  PRIMARY KEY (`idListaNegra`),
  UNIQUE KEY `idlistaNegra_UNIQUE` (`idListaNegra`),
  UNIQUE KEY `correo_UNIQUE` (`correo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listanegra`
--

LOCK TABLES `listanegra` WRITE;
/*!40000 ALTER TABLE `listanegra` DISABLE KEYS */;
/*!40000 ALTER TABLE `listanegra` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-18  4:46:37
