-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: cursos
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alumno`
--
drop database if exists cursos;
create database cursos;
use cursos;

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumno` (
  `ida` int(11) NOT NULL,
  `idg` int(11) NOT NULL,
  `nota` double DEFAULT NULL,
  PRIMARY KEY (`ida`,`idg`),
  KEY `idg` (`idg`),
  CONSTRAINT `alumno_ibfk_1` FOREIGN KEY (`ida`) REFERENCES `persona` (`id`),
  CONSTRAINT `alumno_ibfk_2` FOREIGN KEY (`idg`) REFERENCES `grupo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` VALUES (11,1,6.8),(11,6,6.3),(11,11,5.3),(11,16,8.1),(11,21,6.6),(12,1,3.6),(12,6,4.8),(12,11,4.2),(12,16,5.1),(12,21,6),(13,1,NULL),(13,6,2.5),(13,11,7.8),(13,16,NULL),(13,21,7.8),(14,5,4.8),(14,10,6.2),(14,11,5.3),(14,16,NULL),(14,21,7.7),(15,5,5.6),(15,10,6.9),(15,11,5.8),(15,16,7.7),(15,21,9.1),(16,1,NULL),(16,4,2.2),(16,5,NULL),(16,7,1.6),(16,10,NULL),(16,11,6.1),(16,14,4.6),(16,16,NULL),(16,19,NULL),(16,21,5.2),(17,4,NULL),(17,5,6.1),(17,9,6.3),(17,10,4.6),(17,11,6.6),(17,16,3.7),(17,17,NULL),(17,21,1.9),(17,22,5),(18,3,9.2),(18,8,9.6),(18,13,10),(18,18,10),(18,23,9),(19,1,8.7),(19,6,9.7),(19,15,9.2),(19,20,8.8),(19,25,8.3);
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignatura`
--

DROP TABLE IF EXISTS `asignatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asignatura` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignatura`
--

LOCK TABLES `asignatura` WRITE;
/*!40000 ALTER TABLE `asignatura` DISABLE KEYS */;
INSERT INTO `asignatura` VALUES (1,'Redes'),(2,'Sistemas Operativos'),(3,'Programacion'),(4,'Hardware'),(5,'FOL'),(6,'Servicios en Red'),(7,'Seguridad Informática'),(8,'Empresa'),(9,'Administracion'),(10,'Compraventas'),(11,'Finanzas');
/*!40000 ALTER TABLE `asignatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES (1,'Madrid'),(2,'Alcorcon'),(3,'Mostoles'),(4,'Fuenlabrada'),(5,'Getafe'),(6,'Leganes'),(7,'San Sebastian de los reyes'),(8,'Alcobendas'),(9,'Coslada');
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curso` (
  `id` int(11) NOT NULL,
  `finicio` date DEFAULT NULL,
  `ffinal` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'2018-09-10','2019-06-20'),(2,'2019-09-10','2020-06-20'),(3,'2017-09-10','2018-06-20'),(4,'2016-09-10','2017-06-20'),(5,'2015-09-10','2016-06-20');
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo` (
  `id` int(11) NOT NULL,
  `asignatura` int(11) DEFAULT NULL,
  `curso` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `asignatura` (`asignatura`),
  KEY `curso` (`curso`),
  CONSTRAINT `grupo_ibfk_1` FOREIGN KEY (`asignatura`) REFERENCES `asignatura` (`id`),
  CONSTRAINT `grupo_ibfk_2` FOREIGN KEY (`curso`) REFERENCES `curso` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` VALUES (1,2,5),(2,2,4),(3,2,3),(4,2,2),(5,2,1),(6,4,5),(7,4,4),(8,4,3),(9,4,2),(10,4,1),(11,3,1),(12,3,2),(13,3,3),(14,3,4),(15,3,5),(16,1,1),(17,1,2),(18,1,3),(19,1,4),(20,1,5),(21,5,1),(22,5,2),(23,5,3),(24,5,4),(25,5,5),(26,6,1),(27,6,2),(28,6,3),(29,6,4),(30,6,5),(31,7,1),(32,7,2),(33,7,3),(34,7,3),(35,7,4),(36,7,5),(37,8,1),(38,8,2),(39,8,3),(40,8,4),(41,8,5),(42,9,1),(43,9,2),(44,9,3),(45,9,5),(46,9,4),(47,10,1),(48,10,2),(49,10,3),(50,10,4),(51,10,5),(52,11,1),(53,11,2),(54,11,3),(55,11,4),(56,11,5);
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matriculaHonor`
--

DROP TABLE IF EXISTS `matriculaHonor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matriculaHonor` (
  `ida` int(11) NOT NULL,
  `idg` int(11) NOT NULL,
  `idp` int(11) DEFAULT NULL,
  `idgp` int(11) DEFAULT NULL,
  PRIMARY KEY (`ida`,`idg`),
  KEY `idp` (`idp`,`idgp`),
  CONSTRAINT `matriculaHonor_ibfk_1` FOREIGN KEY (`ida`, `idg`) REFERENCES `alumno` (`ida`, `idg`),
  CONSTRAINT `matriculaHonor_ibfk_2` FOREIGN KEY (`idp`, `idgp`) REFERENCES `profesor` (`idp`, `idg`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matriculaHonor`
--

LOCK TABLES `matriculaHonor` WRITE;
/*!40000 ALTER TABLE `matriculaHonor` DISABLE KEYS */;
INSERT INTO `matriculaHonor` VALUES (18,13,2,13),(19,6,3,6),(18,18,6,23),(18,23,6,23);
/*!40000 ALTER TABLE `matriculaHonor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `id` int(11) NOT NULL,
  `rol` int(11) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellidos` varchar(30) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `ciudad` int(11) DEFAULT NULL,
  `fnac` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rol` (`rol`),
  KEY `ciudad` (`ciudad`),
  CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`rol`) REFERENCES `rol` (`id`),
  CONSTRAINT `persona_ibfk_2` FOREIGN KEY (`ciudad`) REFERENCES `ciudad` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,1,'Jesus Angel','Garcia','634546298',5,'1961-10-05'),(2,2,'Josefa','Valcarcel','65462958',1,'1967-01-15'),(3,3,'Dario','Gomez','69155734',1,'1985-06-23'),(4,3,'Pablo','Caballero','692831824',1,'1984-02-06'),(5,3,'Juampe','Lara','604839032',6,'1982-11-16'),(6,3,'Eva','De Miguel','600816232',5,'1978-08-09'),(7,3,'Isabel','De Lucas','655983251',2,'1973-01-10'),(8,3,'Merche','Gonzalez','690509921',7,'1966-05-20'),(9,3,'Concepcion','Jimemenz','640079126',8,'1976-02-28'),(10,3,'Rosa','Perez','641779606',2,'1979-05-31'),(11,4,'Ana','Perez','641327546',1,'1989-05-11'),(12,4,'Juan','Sanz','634579016',8,'1991-06-16'),(13,4,'Sara','Gil','619338901',2,'1996-09-26'),(14,4,'Juan','Ayuso','669256791',2,'2001-03-30'),(15,4,'Beatriz','Martin','66925671',2,'2001-03-30'),(16,4,'Ana','Beltran','634256334',3,'2000-11-30'),(17,4,'Belen','Figar','633245620',4,'2000-01-31'),(18,4,'Sarai','Agbar','632789270',4,'1998-05-01'),(19,4,'Alberto','Zara','623158378',6,'1997-04-10'),(20,4,'Aroa','Menendez','621578233',1,'2002-08-16'),(21,4,'Antonio','Gomez','64470757',1,'2001-01-20'),(22,4,'David','Perez','642156714',7,'2000-11-19'),(23,4,'Juan','Van Hallen','634500757',6,'2000-11-29'),(24,4,'Elena','de Tomas','634506534',4,'1998-10-29'),(25,4,'Julia','Minguez','633445626',2,'1999-12-29'),(26,4,'Adrian','Gomez','6334502632',3,'1998-12-23'),(27,4,'Damian','Garcia','628345022',5,'1999-02-22'),(28,4,'Josue','Sanchez','6216789090',1,'1989-12-02'),(29,4,'Roberto','Sanchez','616781665',1,'1983-09-25'),(30,4,'Alejandro','Yañez','625689305',1,'1985-06-15'),(31,4,'Esther','Monje','632567932',1,'1982-03-19'),(32,4,'Pablo','Madrid','630567937',1,'1986-10-15'),(33,4,'Benito','Rojo','605607937',2,'1989-07-03'),(34,4,'Felipe','Sanchez','615646907',5,'1999-08-13'),(35,4,'Pablo','Lara','613156907',7,'2000-06-23'),(36,4,'Pedro','Herrera','618123552',4,'2001-07-23'),(37,4,'Julia','Roque','614263402',2,'2000-11-03'),(38,4,'Sara','Dominguez','682342682',1,'2001-01-08'),(39,4,'Enrique','Velez','642782678',4,'2000-10-28'),(40,4,'Maria','Garcia','620433787',1,'2003-11-20'),(209,4,'Roberto','Gomez','621567828',1,'1998-05-11');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesor`
--

DROP TABLE IF EXISTS `profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profesor` (
  `idp` int(11) NOT NULL,
  `idg` int(11) NOT NULL,
  PRIMARY KEY (`idp`,`idg`),
  KEY `idg` (`idg`),
  CONSTRAINT `profesor_ibfk_1` FOREIGN KEY (`idp`) REFERENCES `persona` (`id`),
  CONSTRAINT `profesor_ibfk_2` FOREIGN KEY (`idg`) REFERENCES `grupo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesor`
--

LOCK TABLES `profesor` WRITE;
/*!40000 ALTER TABLE `profesor` DISABLE KEYS */;
INSERT INTO `profesor` VALUES (4,1),(4,2),(4,3),(4,4),(4,5),(3,6),(3,7),(3,8),(3,9),(3,10),(2,11),(5,11),(5,12),(2,13),(2,14),(6,15),(6,16),(6,17),(5,18),(6,19),(7,21),(7,22),(6,23),(5,24),(5,25),(8,26),(9,27),(8,28),(9,29),(8,30),(2,31),(2,32),(1,33),(2,34),(7,35),(7,36),(7,37),(10,38),(10,39),(10,40),(10,41),(10,42),(9,43),(9,44),(9,45),(4,46),(4,47),(3,48),(3,49),(3,50),(4,50),(3,51),(4,52),(4,53),(3,54),(1,55),(1,56);
/*!40000 ALTER TABLE `profesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Jefe de estudios'),(2,'Director'),(3,'Profesor'),(4,'Alumno');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-22  9:25:23
