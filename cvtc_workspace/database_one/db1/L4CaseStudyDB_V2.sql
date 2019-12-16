-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: droneportation
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `authorizedcategory`
--

DROP TABLE IF EXISTS `authorizedcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `authorizedcategory` (
  `remotePilotID` int(11) NOT NULL,
  `categoryID` tinyint(4) NOT NULL,
  `aquireDate` date DEFAULT NULL,
  `expressdate` date DEFAULT NULL,
  `licenceDescription` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`remotePilotID`,`categoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorizedcategory`
--

LOCK TABLES `authorizedcategory` WRITE;
/*!40000 ALTER TABLE `authorizedcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `authorizedcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `categoryID` tinyint(4) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`categoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Passenger Only'),(2,'Package Only'),(3,'Passenger and Package');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drone`
--

DROP TABLE IF EXISTS `drone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `drone` (
  `droneID` smallint(6) NOT NULL,
  `description` varchar(30) DEFAULT NULL,
  `color` varchar(15) DEFAULT NULL,
  `addedOn` date DEFAULT NULL,
  `categoryID` tinyint(4) DEFAULT NULL,
  `modelID` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`droneID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drone`
--

LOCK TABLES `drone` WRITE;
/*!40000 ALTER TABLE `drone` DISABLE KEYS */;
/*!40000 ALTER TABLE `drone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flightgroup`
--

DROP TABLE IF EXISTS `flightgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `flightgroup` (
  `groupID` int(11) NOT NULL,
  `nickName` varchar(15) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `ownerID` int(11) DEFAULT NULL,
  `groupTypeID` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`groupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flightgroup`
--

LOCK TABLES `flightgroup` WRITE;
/*!40000 ALTER TABLE `flightgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `flightgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flightreservation`
--

DROP TABLE IF EXISTS `flightreservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `flightreservation` (
  `flightID` int(11) NOT NULL,
  `pickUpTime` datetime DEFAULT NULL,
  `estDropOffTime` datetime DEFAULT NULL,
  `actDropOffTime` datetime DEFAULT NULL,
  `costPerMile` decimal(5,2) DEFAULT NULL,
  `pickUpLat` decimal(9,6) DEFAULT NULL,
  `pickUpLong` decimal(9,6) DEFAULT NULL,
  `dropOffLat` decimal(9,6) DEFAULT NULL,
  `dropOffLong` decimal(9,6) DEFAULT NULL,
  `typeID` tinyint(4) DEFAULT NULL,
  `statusID` tinyint(4) DEFAULT NULL,
  `droneID` smallint(6) DEFAULT NULL,
  `remotePilotID` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`flightID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flightreservation`
--

LOCK TABLES `flightreservation` WRITE;
/*!40000 ALTER TABLE `flightreservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `flightreservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flightstatus`
--

DROP TABLE IF EXISTS `flightstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `flightstatus` (
  `statusID` tinyint(4) NOT NULL,
  `desc` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`statusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flightstatus`
--

LOCK TABLES `flightstatus` WRITE;
/*!40000 ALTER TABLE `flightstatus` DISABLE KEYS */;
INSERT INTO `flightstatus` VALUES (1,'Pending'),(2,'Confirmed'),(3,'Cancelled'),(4,'In Progress'),(5,'Complete');
/*!40000 ALTER TABLE `flightstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flighttype`
--

DROP TABLE IF EXISTS `flighttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `flighttype` (
  `typeID` tinyint(4) NOT NULL,
  `desc` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`typeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flighttype`
--

LOCK TABLES `flighttype` WRITE;
/*!40000 ALTER TABLE `flighttype` DISABLE KEYS */;
INSERT INTO `flighttype` VALUES (1,'Passenger'),(2,'Package'),(3,'Mixed');
/*!40000 ALTER TABLE `flighttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grouptype`
--

DROP TABLE IF EXISTS `grouptype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `grouptype` (
  `groupTypeID` tinyint(4) NOT NULL,
  `description` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`groupTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouptype`
--

LOCK TABLES `grouptype` WRITE;
/*!40000 ALTER TABLE `grouptype` DISABLE KEYS */;
INSERT INTO `grouptype` VALUES (1,'Family'),(2,'Business');
/*!40000 ALTER TABLE `grouptype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manifestpackage`
--

DROP TABLE IF EXISTS `manifestpackage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `manifestpackage` (
  `flightID` int(11) NOT NULL,
  `packageID` int(11) NOT NULL,
  PRIMARY KEY (`flightID`,`packageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manifestpackage`
--

LOCK TABLES `manifestpackage` WRITE;
/*!40000 ALTER TABLE `manifestpackage` DISABLE KEYS */;
/*!40000 ALTER TABLE `manifestpackage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manifestpassenger`
--

DROP TABLE IF EXISTS `manifestpassenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `manifestpassenger` (
  `flightID` int(11) NOT NULL,
  `passID` int(11) NOT NULL,
  `seatPrice` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`flightID`,`passID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manifestpassenger`
--

LOCK TABLES `manifestpassenger` WRITE;
/*!40000 ALTER TABLE `manifestpassenger` DISABLE KEYS */;
/*!40000 ALTER TABLE `manifestpassenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model`
--

DROP TABLE IF EXISTS `model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `model` (
  `modelID` tinyint(4) NOT NULL,
  `brand` varchar(30) DEFAULT NULL,
  `description` varchar(60) DEFAULT NULL,
  `model` varchar(20) DEFAULT NULL,
  `topSpeed` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`modelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model`
--

LOCK TABLES `model` WRITE;
/*!40000 ALTER TABLE `model` DISABLE KEYS */;
/*!40000 ALTER TABLE `model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `package` (
  `packageID` int(11) NOT NULL,
  `lenght` decimal(6,2) DEFAULT NULL,
  `width` decimal(6,2) DEFAULT NULL,
  `height` decimal(6,2) DEFAULT NULL,
  `weight` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`packageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `passenger` (
  `passID` int(11) NOT NULL,
  `firstName` varchar(25) DEFAULT NULL,
  `lastName` varchar(25) DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `state` varchar(25) DEFAULT NULL,
  `regionalCode` varchar(10) DEFAULT NULL,
  `locationLat` decimal(9,6) DEFAULT NULL,
  `locationLong` decimal(9,6) DEFAULT NULL,
  PRIMARY KEY (`passID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passengergroup`
--

DROP TABLE IF EXISTS `passengergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `passengergroup` (
  `passID` int(11) NOT NULL,
  `groupID` int(11) NOT NULL,
  PRIMARY KEY (`passID`,`groupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passengergroup`
--

LOCK TABLES `passengergroup` WRITE;
/*!40000 ALTER TABLE `passengergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `passengergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remotepilot`
--

DROP TABLE IF EXISTS `remotepilot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `remotepilot` (
  `pilotID` int(11) NOT NULL,
  `firstName` varchar(25) DEFAULT NULL,
  `lastName` varchar(25) DEFAULT NULL,
  `salary` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`pilotID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remotepilot`
--

LOCK TABLES `remotepilot` WRITE;
/*!40000 ALTER TABLE `remotepilot` DISABLE KEYS */;
/*!40000 ALTER TABLE `remotepilot` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-11 14:26:47
