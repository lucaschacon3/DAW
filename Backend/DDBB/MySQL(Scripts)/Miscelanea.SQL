-- MySQL dump 10.13  Distrib 5.1.39, for Win32 (ia32)
--
-- Host: localhost    Database: miscelanea
-- ------------------------------------------------------
-- Server version	5.1.39-community

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
-- Table structure for table `datospersonales`
--
drop database if exists miscelanea;
create database miscelanea;
use miscelanea;


DROP TABLE IF EXISTS `datospersonales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datospersonales` (
  `CODIGO` varchar(4) NOT NULL,
  `APELLIDO1` varchar(15) NOT NULL,
  `APELLIDO2` varchar(15) NOT NULL,
  `NOMBRE` varchar(15) NOT NULL,
  `DIRECCION` varchar(25) DEFAULT NULL,
  `CODIGO_POSTAL` varchar(5) DEFAULT NULL,
  `POBLACION` varchar(15) DEFAULT NULL,
  `PROVINCIA` varchar(15) DEFAULT NULL,
  `TELEFONO` varchar(9) DEFAULT NULL,
  `ESTADO_CIVIL` varchar(1) DEFAULT NULL,
  `HIJOS` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datospersonales`
--

LOCK TABLES `datospersonales` WRITE;
/*!40000 ALTER TABLE `datospersonales` DISABLE KEYS */;
INSERT INTO `datospersonales` VALUES ('0001','PEREZ','LOPEZ','JOSE','C/ DE LA ROSA, 34','28015','MADRID','MADRID','914356271','C',3),('0002','CANILLAS','RUIZ','LAURA','C/ CORTA, 2','28020','MADRID','MADRID','913545621','S',NULL),('0003','SANTOS','PAZ','ALBERTO','C/ ROTA, 12','28105','POZUELO','MADRID','911355276','C',1),('0004','ROS','MUNDO','ANA','C/ CARMONA, 71','28202','LEGANES','MADRID','919928736','C',NULL),('0005','FERNANDEZ','SANCHO','MARTA','C/ ACUARIO, 83','17020','GUADALAJARA','GUADALAJARA','914132899','S',1),('0006','GARCIA','LOMAS','RICARDO','C/ LATAS, 121','28030','MADRID','MADRID','916428334','S',NULL);
/*!40000 ALTER TABLE `datospersonales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleados` (
  `CODIGO` varchar(4) NOT NULL,
  `SUELDO` float(6,2) NOT NULL,
  `DIETAS` float(6,2) DEFAULT NULL,
  `COMISION` float(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES ('0001',1100.45,120.00,NULL),('0002',1250.00,72.85,30.00),('0003',1150.00,NULL,NULL),('0004',1206.50,82.60,100.95),('0005',914.90,NULL,36.50),('0006',1800.00,120.00,145.65);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facturas` (
  `num` int(11) NOT NULL,
  `fecha_fac` date DEFAULT NULL,
  `cliente` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `producto` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `unidades` int(11) DEFAULT NULL,
  `precio_unidad` float(4,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` VALUES (12,'2005-06-23','Compraqui','Yogurt natural',24,0.15),(12,'2005-06-23','Compraqui','Yogurt lim¢n',12,0.15),(12,'2005-06-23','Compraqui','Yogurt fresa',16,0.15),(12,'2005-06-23','Compraqui','Y. natural semi',20,0.17),(12,'2005-06-23','Compraqui','Y. lim¢n semi',12,0.17),(12,'2005-06-23','Compraqui','Y. fresa semi',8,0.17),(1,'2005-06-01','Super Paquito','Yogurt natural',12,0.15),(1,'2005-06-01','Super Paquito','Yogurt lim¢n',8,0.15),(1,'2005-06-01','Super Paquito','Y. natural semi',8,0.17),(1,'2005-06-01','Super Paquito','Y. fresa semi',12,0.17),(1,'2005-06-01','Super Paquito','Leche entera',24,3.00),(1,'2005-06-01','Super Paquito','Leche semi',24,3.12),(1,'2005-06-01','Super Paquito','Leche calcio',12,3.12),(1,'2005-06-01','Super Paquito','Crema catalana',6,1.50),(1,'2005-06-01','Super Paquito','Cuajada',10,0.25),(2,'2005-06-05','Super Paquito','Yogurt fresa',4,0.15),(2,'2005-06-05','Super Paquito','Yogurt natural',24,0.17),(2,'2005-06-05','Super Paquito','Y. lim¢n semi',8,0.17),(2,'2005-06-05','Super Paquito','Leche entera',36,3.00),(2,'2005-06-05','Super Paquito','Leche desnatada',12,3.12),(2,'2005-06-05','Super Paquito','Leche calcio',36,3.12),(2,'2005-06-05','Super Paquito','Queso fresco',15,6.02),(2,'2005-06-05','Super Paquito','Flan',8,4.50),(3,'2005-06-07','Ahorra Muchisimo','Yogurt natural',24,0.15),(3,'2005-06-07','Ahorra Muchisimo','Yogurt fresa',24,0.15),(3,'2005-06-07','Ahorra Muchisimo','Y. natural semi',16,0.17),(3,'2005-06-07','Ahorra Muchisimo','Leche entera',48,3.00),(3,'2005-06-07','Ahorra Muchisimo','Leche calcio',36,3.12),(3,'2005-06-07','Ahorra Muchisimo','Flan',20,4.50),(3,'2005-06-07','Ahorra Muchisimo','Cuajada',30,0.25),(5,'2005-06-08','Ahorra Muchisimo','Leche calcio',36,3.12),(5,'2005-06-08','Ahorra Muchisimo','Queso fresco',15,6.02),(5,'2005-06-08','Ahorra Muchisimo','Flan',8,4.50),(5,'2005-06-08','Ahorra Muchisimo','Cuajada',30,0.25),(14,'2005-06-29','Baratolandia','Leche entera',60,3.00),(14,'2005-06-29','Baratolandia','Leche calcio',60,3.12),(14,'2005-06-29','Baratolandia','Leche semi',24,3.12),(14,'2005-06-29','Baratolandia','Leche desnatada',12,3.12),(14,'2005-06-29','Baratolandia','Flan',8,4.50),(14,'2005-06-29','Baratolandia','Cuajada',8,0.25),(14,'2005-06-29','Baratolandia','Queso fresco',10,6.02),(14,'2005-06-29','Baratolandia','Crema catalana',8,1.50),(14,'2005-06-29','Baratolandia','Yogurt natural',24,0.15),(14,'2005-06-29','Baratolandia','Yogurt lim¢n',12,0.15),(14,'2005-06-29','Baratolandia','Yogurt fresa',12,0.15),(14,'2005-06-29','Baratolandia','Y. natural semi',24,0.17),(14,'2005-06-29','Baratolandia','Y. fresa semi',12,0.17),(14,'2005-06-29','Baratolandia','Y. lim¢n semi',12,0.17),(6,'2005-06-09','Baratolandia','Y. natural semi',32,0.17),(6,'2005-06-09','Baratolandia','Leche entera',72,3.00),(6,'2005-06-09','Baratolandia','Leche calcio',48,3.12),(6,'2005-06-09','Baratolandia','Flan',50,4.50),(6,'2005-06-09','Baratolandia','Cuajada',50,0.25),(6,'2005-06-09','Baratolandia','Yogurt natural',120,0.15),(6,'2005-06-09','Baratolandia','Y. fresa semi',60,0.17),(6,'2005-06-09','Baratolandia','Y. lim¢n semi',60,0.17),(6,'2005-06-09','Baratolandia','Queso fresco',5,6.02),(6,'2005-06-09','Baratolandia','Yogurt lim¢n',84,0.15),(6,'2005-06-09','Baratolandia','Yogurt fresa',72,0.15),(6,'2005-06-09','Baratolandia','Crema catalana',38,1.50),(6,'2005-06-09','Baratolandia','Leche semi',240,3.12),(6,'2005-06-09','Baratolandia','Leche desnatada',120,3.12),(4,'2005-06-07','El Barato','Yogurt natural',24,0.15),(4,'2005-06-07','El Barato','Y. fresa semi',12,0.17),(4,'2005-06-07','El Barato','Y. lim¢n semi',16,0.17),(4,'2005-06-07','El Barato','Leche calcio',60,3.12),(7,'2005-06-12','Super Paquito','Flan',18,4.50),(7,'2005-06-12','Super Paquito','Cuajada',10,0.25),(7,'2005-06-12','Super Paquito','Queso fresco',15,6.02),(7,'2005-06-12','Super Paquito','Crema catalana',16,1.50),(9,'2005-06-20','Compraqui','Cuajada',2,0.25),(9,'2005-06-20','Compraqui','Yogurt natural',4,0.15),(9,'2005-06-20','Compraqui','Y. fresa semi',4,0.17),(9,'2005-06-20','Compraqui','Y. lim¢n semi',4,0.17),(10,'2005-06-01','Ahorra Muchisimo','Crema catalana',10,1.50),(10,'2005-06-01','Ahorra Muchisimo','Leche semi',24,3.12),(10,'2005-06-01','Ahorra Muchisimo','Leche desnatada',24,3.12),(8,'2005-06-09','El Barato','Leche calcio',12,3.12),(8,'2005-06-09','El Barato','Flan',5,4.50),(8,'2005-06-09','El Barato','Cuajada',7,0.25),(8,'2005-06-09','El Barato','Yogurt natural',12,0.15),(8,'2005-06-09','El Barato','Y. fresa semi',12,0.17),(8,'2005-06-09','El Barato','Y. lim¢n semi',8,0.17),(8,'2005-06-09','El Barato','Queso fresco',1,6.02),(11,'2005-06-22','El Campo','Leche entera',240,3.00),(11,'2005-06-22','El Campo','Leche calcio',120,3.12),(11,'2005-06-22','El Campo','Leche semi',60,3.12),(11,'2005-06-22','El Campo','Leche desnatada',72,3.12),(11,'2005-06-22','El Campo','Flan',8,4.50),(11,'2005-06-22','El Campo','Cuajada',10,0.25),(11,'2005-06-22','El Campo','Queso fresco',4,6.02),(11,'2005-06-22','El Campo','Crema catalana',16,1.50),(13,'2005-06-05','Super Paquito','Yogurt natural',12,0.15),(13,'2005-06-05','Super Paquito','Yogurt lim¢n',12,0.15),(13,'2005-06-05','Super Paquito','Yogurt fresa',12,0.15),(15,'2005-06-30','El Campo','Yogurt natural',120,0.15),(15,'2005-06-30','El Campo','Yogurt lim¢n',60,0.15),(15,'2005-06-30','El Campo','Yogurt fresa',48,0.15),(16,'2005-06-30','Blanca Lecheria','Leche calcio',12,3.12),(16,'2005-06-30','Blanca Lecheria','Yogurt natural',12,0.15),(16,'2005-06-30','Blanca Lecheria','Y. fresa semi',12,0.17),(16,'2005-06-30','Blanca Lecheria','Flan',5,4.50),(16,'2005-06-30','Blanca Lecheria','Cuajada',7,0.25),(17,'2005-06-30','Super Paquito','Leche calcio',24,3.12),(17,'2005-06-30','Super Paquito','Leche entera',24,3.00),(17,'2005-06-30','Super Paquito','Leche desnatada',24,3.12),(17,'2005-06-30','Super Paquito','Flan',8,4.50),(17,'2005-06-30','Super Paquito','Cuajada',6,0.25),(17,'2005-06-30','Super Paquito','Queso fresco',3,6.02),(17,'2005-06-30','Super Paquito','Yogurt lim¢n',12,0.15),(17,'2005-06-30','Super Paquito','Yogurt fresa',16,0.15),(17,'2005-06-30','Super Paquito','Y. natural semi',20,0.17),(17,'2005-06-30','Super Paquito','Y. lim¢n semi',12,0.17),(17,'2005-06-30','Super Paquito','Y. fresa semi',8,0.17);
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fechas`
--

DROP TABLE IF EXISTS `fechas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fechas` (
  `FIESTA` varchar(30) DEFAULT NULL,
  `FECHA_FI` date DEFAULT NULL,
  `FECHA_CE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fechas`
--

LOCK TABLES `fechas` WRITE;
/*!40000 ALTER TABLE `fechas` DISABLE KEYS */;
INSERT INTO `fechas` VALUES ('Navidad','2005-12-25','2005-12-25'),('A¤o Nuevo','2005-01-01','2005-01-01'),('Reyes Magos','2005-01-06','2005-01-06'),('Dia de la Constitucion','2005-12-06','2005-12-06'),('Todos los Santos','2005-11-01','2005-11-01'),('Dia del Trabajador','2005-05-01','2005-05-03'),('Dia de la Comunidad de Madrid','2005-05-02','2005-05-02'),('Dia de la Hispanidad','2005-10-12','2005-10-12'),('Dia del Padre','2005-03-19','2005-03-18');
/*!40000 ALTER TABLE `fechas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libros`
--

DROP TABLE IF EXISTS `libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libros` (
  `NOM_AUTOR` varchar(15) NOT NULL,
  `APE1_AUTOR` varchar(15) NOT NULL,
  `APE2_AUTOR` varchar(15) DEFAULT NULL,
  `TITULO` varchar(50) DEFAULT NULL,
  `EDITORIAL` varchar(25) DEFAULT NULL,
  `NUM_PAGINAS` int(11) DEFAULT NULL,
  `PRECIO` float(4,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros`
--

LOCK TABLES `libros` WRITE;
/*!40000 ALTER TABLE `libros` DISABLE KEYS */;
INSERT INTO `libros` VALUES ('PEDRO','MARTIN','LOPEZ','COMO IR DE VACACIONES SIN DEJARSE EL SUELDO','LIBRO AMIGO',288,9.95),('CARMEN','ROBLES','PASADO','EL PERIODICO','PLANETA AGUSTIN',300,5.95),('CASIMIRO','RITOS','MENTON','UN CALENDARIO APRETADO','LIBRO AMIGO',228,10.50),('RAUL','PEREZ','ROSADO','EL ESPIA SOSPECHOSO','PLANETA AGUSTIN',350,7.20),('ROSA','GIRON','NUBES','1024 RECETAS DE COCINA CON EL APIO','COCINA LEIDA',855,4.25),('FERNANDO','BAZAS','LASA','EL HUEVO FRITO, ARTE O CIENCIA','COCINA LEIDA',241,3.30),('MARINA','MAROTO','RUIZ','VAMOS QUE NOS VAMOS','LIBRO AMIGO',329,6.60),('MONICA','PI','ARJONA','LOS ARBOLES SIN OJOS','LIBRO AMIGO',286,4.25),('ROSALIA','PAREJAS','NEGRO','EL ULTIMO PEZ','PLANETA AGUSTIN',446,7.85),('ALBERTO','MANCHA','PELES','EL CHORIZO Y LA MORCILLA, FRITOS O EN TORTILLA','COCINA LEIDA',85,0.60),('JESUS','MATA','LUARCA','HOMBRE PREVENIDO ES EL QUE HA VENIDO ANTES','LIBRO AMIGO',245,13.50),('SANDRA','BARAS','ZARZA','ANA EN CASA','PLANETA AGUSTIN',465,14.95);
/*!40000 ALTER TABLE `libros` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2009-11-05 12:03:43
