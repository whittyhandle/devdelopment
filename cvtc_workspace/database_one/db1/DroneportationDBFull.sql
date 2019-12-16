CREATE DATABASE  IF NOT EXISTS `droneportation` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `droneportation`;
-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: droneportation
-- ------------------------------------------------------
-- Server version	8.0.12

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
-- Table structure for table `AuthorizedCategory`
--

DROP TABLE IF EXISTS `AuthorizedCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `AuthorizedCategory` (
  `RemotePilotID` int(11) unsigned NOT NULL,
  `CategoryID` tinyint(3) unsigned NOT NULL,
  `AquiredDate` date DEFAULT NULL,
  `ExpiresDate` date DEFAULT NULL,
  `LicenseDescription` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`RemotePilotID`,`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuthorizedCategory`
--

LOCK TABLES `AuthorizedCategory` WRITE;
/*!40000 ALTER TABLE `AuthorizedCategory` DISABLE KEYS */;
INSERT INTO `AuthorizedCategory` VALUES (1,1,'2017-11-21','2018-11-30','Large Passenger Aircraft'),(2,3,'2018-01-01','2018-12-31','Temp Manned and Unmanned aircraft'),(3,2,'2018-09-14','2020-09-14','Small UAV'),(4,3,'2016-04-28','2018-04-28','Manned and Unmanned aircraft'),(5,3,'2017-08-05','2020-03-15','Manned and Unmanned aircraft');
/*!40000 ALTER TABLE `AuthorizedCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Category` (
  `CategoryID` tinyint(3) unsigned NOT NULL,
  `Description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category`
--

LOCK TABLES `Category` WRITE;
/*!40000 ALTER TABLE `Category` DISABLE KEYS */;
INSERT INTO `Category` VALUES (1,'Passenger Only'),(2,'Package Only'),(3,'Passenger and Package');
/*!40000 ALTER TABLE `Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Drone`
--

DROP TABLE IF EXISTS `Drone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Drone` (
  `DroneID` smallint(5) unsigned NOT NULL,
  `Description` varchar(30) DEFAULT NULL,
  `Color` varchar(15) DEFAULT NULL,
  `AddedOn` date DEFAULT NULL,
  `CategoryID` tinyint(3) unsigned NOT NULL,
  `ModelID` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`DroneID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Drone`
--

LOCK TABLES `Drone` WRITE;
/*!40000 ALTER TABLE `Drone` DISABLE KEYS */;
INSERT INTO `Drone` VALUES (1,NULL,'Red','2016-04-01',2,1),(2,NULL,'Blue','2016-04-01',2,4),(3,NULL,'Black','2016-05-12',2,3),(4,NULL,'Black','2016-05-13',2,3),(5,NULL,'Black Yellow','2016-08-20',2,6),(6,NULL,'Grey','2016-08-20',1,7),(7,NULL,'Brown','2017-02-04',2,1),(8,NULL,'Dark Orange','2017-02-04',2,6),(9,NULL,'Blue','2017-02-04',2,4),(10,NULL,'Green','2017-06-12',1,9),(11,NULL,'Sliver','2017-06-22',3,8),(12,NULL,'White','2017-11-15',3,8),(14,NULL,'Blue','2017-12-13',2,4),(15,NULL,'Grey Blue','2018-03-22',1,10),(16,NULL,'Dark Blue','2018-08-24',1,11);
/*!40000 ALTER TABLE `Drone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FlightGroup`
--

DROP TABLE IF EXISTS `FlightGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `FlightGroup` (
  `GroupID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nickname` varchar(10) DEFAULT NULL,
  `Description` varchar(150) DEFAULT NULL,
  `OwnerID` int(10) unsigned NOT NULL,
  `GroupTypeID` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`GroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FlightGroup`
--

LOCK TABLES `FlightGroup` WRITE;
/*!40000 ALTER TABLE `FlightGroup` DISABLE KEYS */;
INSERT INTO `FlightGroup` VALUES (11,'faucibus.','vel, venenatis vel, faucibus',163,1),(12,'ligula','Ut tincidunt orci quis lectus. Nullam suscipit,',167,1),(13,'vehicula.','Fusce feugiat. Lorem',146,1),(14,'non,','auctor ullamcorper, nisl arcu iaculis',129,1),(15,'eros','in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est',165,1),(16,'et','aptent taciti sociosqu ad',151,1),(17,'amet','at augue id ante dictum cursus.',152,1),(18,'aliquet','sem egestas blandit. Nam nulla magna, malesuada',153,2),(19,'lectus.','Pellentesque ultricies dignissim lacus.',143,2),(20,'nisl.','vitae mauris sit amet lorem semper',129,1),(21,'ante.','In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus.',159,1),(22,'lectus.','pede blandit congue.',144,2),(23,'pede','ornare lectus justo eu',153,1),(24,'arcu','adipiscing elit. Curabitur sed',132,2),(25,'laoreet','Cras convallis convallis dolor. Quisque tincidunt',167,2),(26,'euismod','Nunc ullamcorper, velit in',151,1),(27,'tempus','Integer mollis. Integer tincidunt aliquam arcu.',175,1),(28,'libero','Suspendisse commodo tincidunt nibh. Phasellus',167,2),(29,'Maecenas','tempor arcu. Vestibulum ut eros non enim commodo',138,1),(30,'Morbi','lectus justo eu arcu. Morbi sit amet massa. Quisque',126,2),(31,'magnis','feugiat metus sit amet ante. Vivamus non',134,2),(32,'libero.','rutrum non, hendrerit id,',166,1),(33,'Quisque','litora torquent per conubia nostra,',154,1),(34,'Curabitur','nec tempus scelerisque, lorem ipsum sodales purus, in molestie',130,2),(35,'Donec','Ut semper pretium neque. Morbi quis',175,1),(36,'commodo','magna et ipsum cursus vestibulum. Mauris magna.',145,2),(37,'tellus','lacinia orci, consectetuer euismod est arcu ac orci.',145,2),(38,'Mauris','pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu',161,1),(39,'parturient','Mauris eu turpis. Nulla aliquet. Proin velit.',154,2),(40,'faucibus','magna a neque.',163,2),(41,'Duis','nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod',146,2),(42,'et,','quis diam. Pellentesque',145,2),(43,'orci','dis parturient montes, nascetur',132,2),(44,'pede,','nunc sit amet',142,1),(45,'et','pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper',129,1),(46,'id','Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus.',174,1),(47,'Aenean','Phasellus at augue id ante dictum cursus. Nunc',132,2),(48,'molestie','dui. Suspendisse ac metus',144,1),(49,'Proin','erat. Etiam vestibulum massa rutrum magna. Cras convallis convallis',148,2),(50,'metus','cursus non, egestas a, dui. Cras pellentesque. Sed dictum.',151,2),(61,'Managers1','Upper manangement team 1',130,2),(62,'arcu','Cras convallis convallis dolor.',127,1),(63,'tortor.','tristique pharetra. Quisque',174,2),(64,'euismod','adipiscing elit. Etiam laoreet, libero',131,1),(65,'Ut','est, vitae sodales nisi magna sed dui. Fusce aliquam, enim',170,2),(66,'cursus','Proin mi. Aliquam gravida mauris',145,1),(67,'risus,','Etiam laoreet, libero et tristique pellentesque,',169,1),(68,'lobortis','a, malesuada id, erat. Etiam vestibulum massa',171,2),(69,'eget','sed, hendrerit a,',133,1),(70,'contuer','odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque',141,2),(71,'quis','vel lectus. Cum sociis',168,2),(72,'rutrum,','tellus non magna. Nam ligula elit, pretium et, rutrum non,',129,2),(73,'non','natoque penatibus et magnis dis parturient montes, nascetur ridiculus',174,2),(74,'eleifend','euismod mauris eu elit. Nulla facilisi. Sed',157,1),(75,'pretium','Nam ligula elit, pretium et, rutrum non, hendrerit',146,2),(76,'Curabitur','magna. Cras convallis convallis dolor. Quisque tincidunt pede ac urna.',144,2),(77,'quis','dictum. Proin eget odio. Aliquam vulputate ullamcorper magna.',145,2),(78,'inceptos','nunc ac mattis ornare, lectus',137,1),(79,'sem.','orci, consectetuer euismod est',144,2),(80,'Cras','gravida nunc sed pede. Cum',128,1),(91,'quis','vel lectus. Cum sociis',168,2),(92,'rutrum,','tellus non magna. Nam ligula elit, pretium et, rutrum non,',129,2),(93,'non','natoque penatibus et magnis dis parturient montes, nascetur ridiculus',174,2),(94,'eleifend','euismod mauris eu elit. Nulla facilisi. Sed',157,1),(95,'pretium','Nam ligula elit, pretium et, rutrum non, hendrerit',146,2),(96,'Curabitur','magna. Cras convallis convallis dolor. Quisque tincidunt pede ac urna.',144,2),(97,'quis','dictum. Proin eget odio. Aliquam vulputate ullamcorper magna.',145,2),(98,'inceptos','nunc ac mattis ornare, lectus',137,1),(99,'sem.','orci, consectetuer euismod est',144,2),(100,'Cras','gravida nunc sed pede. Cum',128,1),(111,'fames','ut eros non enim',139,1),(112,'magna.','auctor quis, tristique',166,2),(113,'Vivamus','feugiat non, lobortis',151,2),(114,'coner','vel turpis. Aliquam adipiscing lobortis risus. In mi pede,',164,1),(115,'Sed','pharetra nibh. Aliquam ornare, libero',167,2),(116,'tellus','Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus.',134,2),(117,'Nulla','quam vel sapien imperdiet ornare. In',166,1),(118,'faucibus','ut quam vel sapien imperdiet ornare. In',152,2),(119,'ullam,','eu erat semper rutrum. Fusce dolor quam,',163,1),(120,'tempus','consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet',142,1),(121,'nec','dui. Cras pellentesque. Sed',170,2),(122,'Integer','sagittis placerat. Cras dictum ultricies ligula. Nullam enim.',144,1),(123,'eu','a, aliquet vel, vulputate eu, odio. Phasellus at augue',142,1),(124,'lacus.','tristique pharetra. Quisque',164,2),(125,'mauris','at, egestas a, scelerisque',125,2),(126,'est.','Curabitur vel lectus. Cum sociis natoque',126,1),(127,'Donec','nunc risus varius orci, in consequat enim diam',141,2),(128,'trisque','ipsum. Suspendisse sagittis.',131,2),(129,'purus,','vitae nibh. Donec est mauris, rhoncus id, mollis nec,',156,1),(130,'orci,','Proin dolor. Nulla semper',147,2);
/*!40000 ALTER TABLE `FlightGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FlightReservation`
--

DROP TABLE IF EXISTS `FlightReservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `FlightReservation` (
  `FlightID` int(10) unsigned NOT NULL,
  `PickUpTime` datetime NOT NULL,
  `EstDropOffTime` datetime DEFAULT NULL,
  `ActDropOffTime` datetime DEFAULT NULL,
  `CostPerMile` decimal(5,2) NOT NULL,
  `PickUpLat` decimal(9,6) NOT NULL,
  `PickUpLong` decimal(9,6) NOT NULL,
  `DropOffLat` decimal(9,6) NOT NULL,
  `DropOffLong` decimal(9,6) NOT NULL,
  `TypeID` tinyint(3) unsigned NOT NULL,
  `StatusID` tinyint(3) unsigned NOT NULL,
  `DroneID` smallint(5) unsigned NOT NULL,
  `RemotePilotID` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`FlightID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FlightReservation`
--

LOCK TABLES `FlightReservation` WRITE;
/*!40000 ALTER TABLE `FlightReservation` DISABLE KEYS */;
INSERT INTO `FlightReservation` VALUES (1,'2018-03-02 22:37:20','2018-03-02 23:37:20','2018-03-02 23:32:20',14.00,45.867572,-93.018405,45.272523,-93.031302,2,5,4,3),(2,'2016-07-13 08:41:52','2016-07-13 10:41:52','2016-07-13 10:49:52',15.00,43.635748,-87.494960,42.171086,-93.616010,3,3,12,4),(3,'2016-07-10 00:12:21','2016-07-10 01:12:21','2016-07-10 01:24:21',7.00,43.576023,-87.419583,41.037861,-87.986145,3,2,13,1),(4,'2018-01-03 14:07:33','2018-01-03 15:07:33','2018-01-03 14:59:33',8.00,46.972873,-93.613038,44.676048,-93.082693,1,4,7,1),(5,'2016-09-08 23:37:57','2016-09-09 00:37:57','2016-09-09 00:34:57',10.00,45.136295,-89.806438,45.266655,-93.455032,1,2,9,3),(6,'2018-12-29 12:50:36','2018-12-29 13:50:36','2018-12-29 13:46:36',16.00,42.762855,-89.193077,44.305131,-87.027080,2,3,14,1),(7,'2018-10-10 13:19:16','2018-10-10 13:19:16','2018-10-10 13:25:16',14.00,44.405391,-87.546069,44.725693,-88.770305,1,4,16,1),(8,'2018-04-15 12:07:37','2018-04-15 14:07:37','2018-04-15 14:03:37',16.00,41.738388,-92.151116,42.713071,-88.770283,2,2,12,5),(9,'2017-05-11 22:27:02','2017-05-11 23:27:02','2017-05-11 23:33:02',7.00,45.475769,-88.117371,45.388275,-90.540499,1,5,7,1),(10,'2018-02-12 21:36:39','2018-02-12 23:36:39','2018-02-12 23:34:39',10.00,42.163682,-88.133509,43.802162,-92.391645,2,4,7,2),(11,'2017-03-31 06:46:36','2017-03-31 07:46:36','2017-03-31 07:32:36',18.00,42.391102,-90.315431,41.845986,-89.336728,2,3,8,4),(12,'2017-11-28 13:51:30','2017-11-28 16:51:30','2017-11-28 17:03:30',6.00,45.464465,-88.176629,43.823444,-89.508704,2,5,11,3),(13,'2017-08-04 07:09:54','2017-08-04 09:09:54','2017-08-04 09:08:54',18.00,41.149020,-92.936852,45.579263,-92.533339,2,1,12,3),(14,'2018-06-01 02:26:21','2018-06-01 03:26:21','2018-06-01 03:31:21',17.00,44.351703,-88.154373,41.425983,-93.140581,3,1,16,5),(15,'2017-10-22 15:33:56','2017-10-22 18:33:56','2017-10-22 18:46:56',14.00,41.311455,-91.961308,43.392127,-87.102888,1,2,13,3),(16,'2016-08-02 13:53:58','2016-08-02 15:53:58','2016-08-02 15:58:58',15.00,47.502165,-86.343422,44.682687,-90.092698,3,3,16,4),(17,'2018-01-05 19:42:48','2018-01-05 20:42:48','2018-01-05 20:44:48',9.00,41.576462,-89.833186,45.237053,-88.154826,1,5,12,5),(18,'2017-06-10 12:13:17','2017-06-10 13:13:17','2017-06-10 13:25:17',13.00,42.375816,-90.135664,44.137204,-90.496035,3,1,5,5),(19,'2018-05-10 09:14:52','2018-05-10 11:14:52','2018-05-10 11:23:52',10.00,41.149694,-91.178761,43.974862,-87.015697,1,2,7,4),(20,'2016-05-21 15:40:30','2016-05-21 18:40:30','2016-05-21 18:34:30',14.00,44.621023,-93.486814,46.462700,-90.590382,3,2,4,1),(21,'2017-01-30 23:45:05','2017-01-30 23:45:05','2017-01-30 23:33:05',9.00,48.656030,-86.897786,45.388912,-90.904816,2,2,11,5),(22,'2017-04-20 17:24:35','2017-04-20 18:24:35','2017-04-20 18:26:35',9.00,43.417083,-92.028489,46.556463,-88.752936,1,5,1,4),(23,'2018-06-30 15:38:00','2018-06-30 17:38:00','2018-06-30 17:40:00',14.00,43.117325,-88.449085,41.615577,-91.050230,3,1,11,5),(24,'2018-02-05 23:55:24','2018-02-06 00:55:24','2018-02-06 00:44:24',12.00,43.335375,-88.159958,41.408497,-87.992344,3,1,16,1),(25,'2018-05-10 04:03:18','2018-05-10 07:03:18','2018-05-10 06:48:18',10.00,43.324902,-86.452535,41.195752,-93.811028,2,4,16,1),(26,'2016-05-26 19:56:19','2016-05-26 21:56:19','2016-05-26 21:59:19',7.00,41.618384,-90.782799,47.753272,-90.078106,3,1,6,2),(27,'2018-06-11 15:23:56','2018-06-11 18:23:56','2018-06-11 18:10:56',15.00,43.117214,-89.556393,46.179102,-88.957449,1,4,8,3),(28,'2018-01-25 07:02:02','2018-01-25 08:02:02','2018-01-25 08:04:02',14.00,44.730917,-90.433568,46.635693,-87.552927,1,4,15,2),(29,'2016-11-20 00:11:21','2016-11-20 03:11:21','2016-11-20 03:15:21',13.00,47.302943,-89.498659,46.641160,-90.892285,2,1,16,1),(30,'2017-08-13 08:06:42','2017-08-13 08:06:42','2017-08-13 08:06:42',6.00,47.321966,-89.192591,45.298724,-90.802644,1,2,16,2),(31,'2017-07-06 04:59:31','2017-07-06 07:59:31','2017-07-06 08:01:31',8.00,44.700998,-91.466978,45.570138,-87.336365,2,1,7,3),(32,'2018-02-12 21:12:32','2018-02-13 00:12:32','2018-02-13 00:08:32',10.00,46.539095,-90.757115,43.954517,-91.273894,3,1,15,2),(33,'2018-09-07 18:15:41','2018-09-07 19:15:41','2018-09-07 19:04:41',6.00,41.592482,-90.384644,42.062174,-93.360375,1,1,12,3),(34,'2016-09-16 06:36:27','2016-09-16 07:36:27','2016-09-16 07:41:27',16.00,45.345122,-87.651874,44.447319,-91.980190,2,1,8,2),(35,'2017-08-25 18:22:20','2017-08-25 21:22:20','2017-08-25 21:34:20',9.00,45.948167,-89.105436,41.050074,-92.819828,1,2,12,2),(36,'2018-12-27 23:23:05','2018-12-28 02:23:05','2018-12-28 02:25:05',8.00,48.705466,-91.571559,44.908414,-87.158569,2,4,16,4),(37,'2016-06-16 23:26:20','2016-06-17 00:26:20','2016-06-17 00:13:20',13.00,48.682829,-87.541486,46.391848,-91.333360,1,5,15,4),(38,'2017-07-22 02:46:44','2017-07-22 04:46:44','2017-07-22 04:51:44',13.00,41.297747,-87.992754,42.233998,-87.191093,3,3,4,2),(39,'2018-08-25 17:39:26','2018-08-25 20:39:26','2018-08-25 20:28:26',17.00,44.440248,-86.339312,44.994444,-88.955384,3,4,5,3),(40,'2016-12-02 18:56:28','2016-12-02 21:56:28','2016-12-02 22:02:28',10.00,46.307998,-93.718298,43.270230,-89.203641,1,3,5,4),(41,'2017-06-22 02:12:27','2017-06-22 05:12:27','2017-06-22 05:01:27',12.00,44.219247,-90.573554,47.367815,-92.152053,1,5,14,3),(42,'2017-08-19 04:54:41','2017-08-19 05:54:41','2017-08-19 05:57:41',17.00,41.172240,-87.712878,45.028385,-92.149342,2,5,3,2),(43,'2016-10-17 10:49:27','2016-10-17 12:49:27','2016-10-17 12:54:27',11.00,44.203458,-86.843725,42.038480,-90.290551,3,4,14,4),(44,'2017-10-11 17:09:54','2017-10-11 19:09:54','2017-10-11 19:07:54',12.00,48.500572,-88.079990,41.107244,-88.004729,2,4,9,1),(45,'2017-04-01 05:23:12','2017-04-01 06:23:12','2017-04-01 06:15:12',12.00,48.892485,-91.868776,45.420782,-89.151993,3,4,2,2),(46,'2017-01-26 22:48:23','2017-01-27 01:48:23','2017-01-27 02:00:23',16.00,48.960708,-88.103911,41.782178,-87.745779,3,2,2,1),(47,'2017-11-22 13:00:05','2017-11-22 16:00:05','2017-11-22 16:11:05',15.00,47.126085,-88.913227,45.648545,-91.272913,1,3,16,4),(48,'2018-03-13 06:26:44','2018-03-13 07:26:44','2018-03-13 07:27:44',7.00,47.748303,-90.254403,47.896193,-92.127228,2,3,1,2),(49,'2018-04-27 05:47:18','2018-04-27 07:47:18','2018-04-27 07:36:18',10.00,47.363261,-92.532331,47.535327,-92.817401,3,4,2,1),(50,'2018-12-01 05:26:42','2018-12-01 07:26:42','2018-12-01 07:15:42',14.00,41.571396,-89.898449,45.988058,-93.705320,1,5,7,3),(51,'2018-11-14 15:54:14','2018-11-14 16:54:14','2018-11-14 16:48:14',11.00,44.767196,-90.895249,46.334307,-89.074399,3,4,9,2),(52,'2018-01-12 00:42:35','2018-01-12 02:42:35','2018-01-12 02:31:35',7.00,44.121791,-93.780900,45.707363,-91.256033,3,5,9,4),(53,'2016-04-24 20:12:34','2016-04-24 21:12:34','2016-04-24 21:20:34',12.00,46.307370,-89.218753,41.533896,-88.056968,2,3,14,1),(54,'2017-02-28 00:21:13','2017-02-28 01:21:13','2017-02-28 01:18:13',8.00,43.171474,-91.751066,43.547388,-93.516740,1,3,16,4),(55,'2016-10-11 00:15:47','2016-10-11 03:15:47','2016-10-11 03:21:47',13.00,43.935261,-92.099069,45.135254,-88.412796,1,5,13,3),(56,'2018-12-04 21:53:51','2018-12-04 21:53:51','2018-12-04 21:49:51',17.00,41.161885,-91.242149,47.034105,-88.513758,2,4,10,3),(57,'2017-06-21 16:54:52','2017-06-21 18:54:52','2017-06-21 19:01:52',6.00,41.003640,-87.913537,44.764763,-90.330405,2,4,10,4),(58,'2018-01-31 22:47:36','2018-02-01 00:47:36','2018-02-01 00:48:36',10.00,41.532544,-86.841238,41.721500,-92.110750,3,2,2,1),(59,'2018-05-27 01:06:23','2018-05-27 02:06:23','2018-05-27 02:07:23',8.00,48.651800,-92.465580,47.313211,-88.562535,2,2,10,5),(60,'2018-09-04 04:00:35','2018-09-04 04:00:35','2018-09-04 03:46:35',18.00,48.661370,-87.804185,42.401554,-93.480424,2,4,16,3),(61,'2018-11-18 03:15:09','2018-11-18 04:15:09','2018-11-18 04:18:09',7.00,42.351448,-92.624184,43.068141,-93.714515,3,2,2,2),(62,'2018-11-19 07:38:18','2018-11-19 10:38:18','2018-11-19 10:50:18',8.00,42.773133,-91.708367,47.136039,-87.131304,2,3,9,3),(63,'2017-02-24 01:49:51','2017-02-24 02:49:51','2017-02-24 02:54:51',7.00,44.811318,-86.669283,44.475775,-88.512976,3,1,3,3),(64,'2016-05-02 11:50:25','2016-05-02 13:50:25','2016-05-02 13:57:25',13.00,46.737190,-86.221315,46.970759,-87.170965,2,1,8,1),(65,'2018-03-09 21:29:15','2018-03-09 23:29:15','2018-03-09 23:35:15',12.00,43.251999,-87.098723,46.426469,-90.315900,2,1,4,1),(66,'2018-03-10 05:22:02','2018-03-10 05:22:02','2018-03-10 05:15:02',14.00,48.048423,-86.829672,43.220069,-89.066602,1,3,5,1),(67,'2016-10-25 14:52:22','2016-10-25 17:52:22','2016-10-25 17:46:22',8.00,41.486118,-93.852189,42.820937,-87.385312,3,4,13,2),(68,'2018-11-23 03:02:40','2018-11-23 04:02:40','2018-11-23 04:09:40',10.00,44.285323,-86.771928,43.444478,-89.726752,1,2,7,5),(69,'2016-05-19 04:45:54','2016-05-19 05:45:54','2016-05-19 05:53:54',16.00,47.968258,-93.303074,47.759581,-92.477826,3,3,13,5),(70,'2018-04-03 05:41:48','2018-04-03 06:41:48','2018-04-03 06:43:48',9.00,46.985322,-89.199588,46.464470,-92.208874,1,4,15,2),(71,'2016-06-23 05:50:04','2016-06-23 06:50:04','2016-06-23 06:54:04',17.00,47.021836,-86.088717,41.043609,-89.610891,2,2,11,1),(72,'2017-12-20 14:04:02','2017-12-20 17:04:02','2017-12-20 17:01:02',6.00,48.153213,-87.844820,45.824636,-91.427831,1,4,14,1),(73,'2018-09-07 06:29:14','2018-09-07 09:29:14','2018-09-07 09:21:14',17.00,48.700556,-87.957949,43.992353,-87.306484,3,5,8,5),(74,'2018-06-23 09:07:40','2018-06-23 10:07:40','2018-06-23 10:19:40',10.00,48.043143,-87.255285,41.487856,-89.248925,1,5,10,5),(75,'2018-02-04 10:04:13','2018-02-04 12:04:13','2018-02-04 12:12:13',11.00,45.114045,-90.402577,41.462224,-90.325173,2,5,1,5),(76,'2018-09-23 08:16:34','2018-09-23 11:16:34','2018-09-23 11:08:34',13.00,46.440796,-87.247030,41.847549,-89.879089,3,5,8,2),(77,'2018-04-26 12:53:01','2018-04-26 14:53:01','2018-04-26 15:05:01',7.00,46.861847,-90.027420,43.851074,-91.419928,1,2,15,1),(78,'2018-10-20 00:32:53','2018-10-20 01:32:53','2018-10-20 01:41:53',13.00,47.986845,-86.396011,45.712724,-93.462372,1,2,11,2),(79,'2017-02-09 10:38:54','2017-02-09 11:38:54','2017-02-09 11:33:54',18.00,44.348684,-89.897794,42.010396,-92.052076,1,1,1,1),(80,'2017-12-31 21:31:41','2018-01-01 00:31:41','2018-01-01 00:24:41',11.00,47.782885,-88.300937,45.913809,-92.873263,3,2,2,2),(81,'2016-08-19 22:54:10','2016-08-20 01:54:10','2016-08-20 01:48:10',14.00,45.868372,-91.811302,41.537859,-87.210086,3,4,1,3),(82,'2016-10-31 02:55:48','2016-10-31 03:55:48','2016-10-31 04:03:48',16.00,41.993205,-87.153700,42.947869,-91.430644,3,5,8,1),(83,'2017-09-18 09:28:30','2017-09-18 11:28:30','2017-09-18 11:42:30',6.00,42.360909,-86.334593,42.125767,-87.522959,3,5,8,3),(84,'2016-06-16 20:00:38','2016-06-16 21:00:38','2016-06-16 21:00:38',8.00,41.824930,-93.211864,47.785228,-90.322864,2,4,9,2),(85,'2018-12-10 02:23:06','2018-12-10 03:23:06','2018-12-10 03:25:06',17.00,45.041922,-90.055541,43.548840,-88.045441,3,1,14,2),(86,'2017-10-02 15:57:11','2017-10-02 16:57:11','2017-10-02 16:55:11',11.00,43.734823,-88.642114,47.388516,-89.258612,2,5,8,3),(87,'2016-08-03 04:45:01','2016-08-03 06:45:01','2016-08-03 06:44:01',13.00,45.548346,-91.043948,44.296058,-88.156737,2,5,8,5),(88,'2017-03-20 12:31:43','2017-03-20 14:31:43','2017-03-20 14:16:43',9.00,46.537263,-89.293398,45.314745,-93.007850,2,3,3,1),(89,'2017-04-07 10:59:57','2017-04-07 12:59:57','2017-04-07 13:06:57',18.00,46.041275,-90.335146,45.685548,-92.569040,3,3,1,1),(90,'2017-08-18 07:31:35','2017-08-18 09:31:35','2017-08-18 09:33:35',15.00,45.594588,-88.795537,44.483508,-89.821649,2,2,8,3),(91,'2016-10-01 20:46:56','2016-10-01 23:46:56','2016-10-01 23:50:56',9.00,47.849116,-91.972246,44.360896,-91.401123,1,3,7,5),(92,'2017-08-05 07:39:09','2017-08-05 08:39:09','2017-08-05 08:42:09',17.00,46.461817,-90.474621,47.353957,-93.540668,2,2,6,2),(93,'2018-06-18 15:40:12','2018-06-18 18:40:12','2018-06-18 18:26:12',17.00,41.761736,-88.456364,41.687096,-92.499970,3,4,5,4),(94,'2018-06-29 02:58:50','2018-06-29 04:58:50','2018-06-29 04:54:50',6.00,45.423227,-87.857957,46.373611,-87.877848,1,2,6,3),(95,'2017-07-21 01:27:18','2017-07-21 03:27:18','2017-07-21 03:37:18',15.00,41.830928,-91.920692,44.806765,-88.889327,1,5,9,3),(96,'2017-05-26 18:36:21','2017-05-26 20:36:21','2017-05-26 20:21:21',7.00,42.884961,-88.029590,43.912994,-93.813094,1,1,14,2),(97,'2018-11-11 12:25:49','2018-11-11 15:25:49','2018-11-11 15:26:49',17.00,45.932018,-88.385875,44.144675,-87.397486,1,4,6,3),(98,'2018-08-25 04:19:16','2018-08-25 05:19:16','2018-08-25 05:26:16',6.00,44.005208,-87.840604,47.984392,-89.548150,1,5,10,2),(99,'2016-06-14 02:51:19','2016-06-14 04:51:19','2016-06-14 04:39:19',9.00,46.229987,-88.045395,45.487935,-91.548290,1,2,2,4),(100,'2017-11-09 16:44:59','2017-11-09 17:44:59','2017-11-09 17:36:59',7.00,42.134311,-88.705165,42.486501,-88.097000,2,1,14,4);
/*!40000 ALTER TABLE `FlightReservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FlightStatus`
--

DROP TABLE IF EXISTS `FlightStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `FlightStatus` (
  `StatusID` tinyint(3) unsigned NOT NULL,
  `Desc` varchar(12) NOT NULL,
  PRIMARY KEY (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FlightStatus`
--

LOCK TABLES `FlightStatus` WRITE;
/*!40000 ALTER TABLE `FlightStatus` DISABLE KEYS */;
INSERT INTO `FlightStatus` VALUES (1,'Pending'),(2,'Confirmed'),(3,'Cancelled'),(4,'In Progress'),(5,'Complete');
/*!40000 ALTER TABLE `FlightStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FlightType`
--

DROP TABLE IF EXISTS `FlightType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `FlightType` (
  `TypeID` tinyint(2) unsigned NOT NULL,
  `Desc` varchar(12) NOT NULL,
  PRIMARY KEY (`TypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FlightType`
--

LOCK TABLES `FlightType` WRITE;
/*!40000 ALTER TABLE `FlightType` DISABLE KEYS */;
INSERT INTO `FlightType` VALUES (1,'Passenger'),(2,'Package'),(3,'Mixed');
/*!40000 ALTER TABLE `FlightType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GroupType`
--

DROP TABLE IF EXISTS `GroupType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `GroupType` (
  `GroupTypeID` tinyint(3) unsigned NOT NULL,
  `Description` varchar(15) NOT NULL,
  PRIMARY KEY (`GroupTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GroupType`
--

LOCK TABLES `GroupType` WRITE;
/*!40000 ALTER TABLE `GroupType` DISABLE KEYS */;
INSERT INTO `GroupType` VALUES (1,'Family'),(2,'Business');
/*!40000 ALTER TABLE `GroupType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ManifestPackage`
--

DROP TABLE IF EXISTS `ManifestPackage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ManifestPackage` (
  `FlightID` int(10) unsigned NOT NULL,
  `PackageID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`FlightID`,`PackageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ManifestPackage`
--

LOCK TABLES `ManifestPackage` WRITE;
/*!40000 ALTER TABLE `ManifestPackage` DISABLE KEYS */;
INSERT INTO `ManifestPackage` VALUES (1,50),(1,59),(1,65),(1,66),(2,4),(2,20),(2,80),(2,87),(3,13),(3,18),(3,60),(6,56),(6,78),(8,79),(8,81),(10,7),(10,23),(10,70),(10,92),(10,100),(11,35),(11,37),(12,47),(12,74),(14,14),(18,90),(20,30),(21,9),(21,73),(23,28),(23,46),(23,55),(23,62),(24,6),(24,29),(24,63),(25,16),(26,21),(26,88),(29,12),(29,53),(29,75),(29,99),(31,42),(32,40),(32,64),(32,94),(36,54),(38,57),(38,82),(39,49),(39,67),(44,39),(45,77),(46,25),(46,36),(48,22),(48,26),(48,44),(48,97),(49,11),(49,58),(57,41),(58,1),(58,38),(59,17),(59,24),(59,98),(61,45),(61,76),(61,89),(63,48),(65,68),(67,19),(67,51),(73,34),(76,8),(81,2),(83,3),(83,61),(85,52),(85,72),(90,96),(92,31);
/*!40000 ALTER TABLE `ManifestPackage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ManifestPassenger`
--

DROP TABLE IF EXISTS `ManifestPassenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ManifestPassenger` (
  `FlightID` int(10) unsigned NOT NULL,
  `PassID` int(10) unsigned NOT NULL,
  `SeatPrice` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`FlightID`,`PassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ManifestPassenger`
--

LOCK TABLES `ManifestPassenger` WRITE;
/*!40000 ALTER TABLE `ManifestPassenger` DISABLE KEYS */;
INSERT INTO `ManifestPassenger` VALUES (2,104,25.89),(2,120,29.06),(2,180,48.63),(2,187,31.95),(3,113,29.86),(3,118,34.45),(3,160,28.68),(4,109,21.06),(4,126,47.48),(4,132,33.83),(7,139,42.71),(7,149,23.05),(7,162,23.99),(7,171,38.12),(7,174,30.27),(7,199,25.37),(9,119,32.44),(9,176,20.29),(14,114,51.45),(14,166,28.86),(15,160,40.44),(17,190,28.84),(18,190,38.90),(19,138,53.95),(19,191,29.07),(20,100,27.99),(20,104,34.51),(20,130,31.34),(22,145,34.34),(23,128,51.68),(23,146,50.80),(23,155,33.76),(23,162,44.95),(24,100,23.68),(24,106,53.36),(24,120,42.95),(24,129,35.68),(24,146,46.78),(24,150,30.54),(24,160,43.60),(24,163,26.67),(26,100,32.84),(26,114,21.01),(26,121,38.57),(26,188,42.11),(27,134,29.47),(27,163,23.53),(27,199,42.31),(28,114,51.97),(28,151,43.93),(28,167,44.75),(30,111,29.84),(30,118,49.35),(30,136,48.48),(30,152,41.80),(30,171,30.47),(32,140,40.33),(32,164,37.20),(32,194,46.01),(33,101,29.47),(33,118,42.96),(33,173,34.40),(33,179,25.29),(35,106,31.20),(35,113,30.54),(35,116,40.09),(35,131,19.84),(35,146,29.95),(35,156,36.22),(35,189,24.11),(37,144,22.26),(37,148,25.00),(37,182,39.20),(38,157,31.99),(38,182,23.36),(39,130,36.85),(39,147,25.13),(39,149,31.14),(39,167,33.35),(39,181,26.29),(39,182,40.44),(40,113,19.03),(40,192,48.12),(41,126,32.28),(41,158,30.30),(41,162,50.30),(41,165,23.14),(43,129,53.46),(43,166,40.82),(45,177,42.01),(45,178,45.65),(46,125,37.22),(46,136,41.08),(47,117,51.80),(47,174,39.73),(49,111,41.22),(49,153,33.04),(49,158,25.83),(49,163,35.42),(50,130,34.43),(50,142,46.89),(50,155,42.18),(50,186,46.00),(50,187,28.54),(51,165,51.22),(52,116,40.54),(52,142,30.05),(52,197,20.67),(54,187,33.74),(55,100,27.12),(55,119,46.77),(55,131,23.98),(55,140,30.61),(55,159,52.71),(55,185,38.32),(58,101,49.47),(58,118,23.83),(58,138,43.39),(58,146,29.89),(58,175,23.98),(61,142,26.64),(61,145,35.53),(61,176,43.72),(61,180,49.55),(61,189,28.57),(63,148,23.03),(63,179,34.98),(66,103,28.35),(66,113,45.21),(66,116,20.99),(66,198,35.89),(67,118,51.34),(67,119,32.07),(67,151,22.31),(67,180,27.47),(68,109,45.71),(68,172,22.13),(69,118,24.52),(70,148,37.19),(70,160,23.39),(72,141,52.84),(72,167,40.98),(72,188,27.37),(73,126,29.92),(73,134,31.34),(73,138,48.50),(73,147,28.75),(74,156,35.76),(74,162,30.79),(74,185,27.68),(76,108,49.24),(76,147,27.01),(76,164,35.94),(76,167,33.04),(76,177,47.98),(76,195,43.09),(77,156,52.50),(77,172,30.14),(78,176,44.24),(78,178,44.71),(79,123,36.82),(79,130,32.61),(79,158,53.60),(80,165,30.95),(80,175,25.32),(80,190,49.73),(81,102,48.68),(81,107,40.23),(81,145,46.19),(82,116,36.12),(83,103,40.90),(83,161,51.15),(85,116,28.19),(85,152,24.17),(85,172,35.14),(85,179,49.20),(93,126,39.60),(93,141,38.50),(93,142,29.41),(93,154,53.94),(94,131,44.28),(94,135,44.13),(95,192,33.83),(96,101,52.78),(96,103,30.17),(96,161,38.39),(97,118,49.60),(97,123,43.86),(97,137,51.47),(98,109,36.78),(98,112,45.48),(98,130,40.03),(98,176,28.07),(98,179,19.90),(99,111,20.65),(99,133,31.29),(99,149,42.76),(99,165,30.92),(99,169,34.14),(99,171,42.32);
/*!40000 ALTER TABLE `ManifestPassenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Model`
--

DROP TABLE IF EXISTS `Model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Model` (
  `ModelID` tinyint(3) unsigned NOT NULL,
  `Brand` varchar(30) DEFAULT NULL,
  `Description` varchar(60) DEFAULT NULL,
  `Model` varchar(20) DEFAULT NULL,
  `TopSpeed` decimal(6,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`ModelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Model`
--

LOCK TABLES `Model` WRITE;
/*!40000 ALTER TABLE `Model` DISABLE KEYS */;
INSERT INTO `Model` VALUES (1,'DJI','Small package delivery drone','Mavic',30.00),(2,'DJI','Short range small package delivery','Spark',22.00),(3,'DJI','Medium package transport','Phantom',27.00),(4,'DJI','Large package transport','Inspire',28.00),(5,'GoPro','High speed small package delivery','Karma',38.00),(6,'GoPro','High speed medium package transport','Hero6',35.00),(7,'Yuneec','6 passenger transport','Typhoon 6X',42.00),(8,'Yuneec','4 passenger transport','Mantis Q',48.00),(9,'Yuneec','6 passenger transport, high speed','Typhoon H',52.00),(10,'Parrot','2 passenger transport','Bebob',58.00),(11,'Parrot','2 passenger, long range','ANAFI',60.00);
/*!40000 ALTER TABLE `Model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Package`
--

DROP TABLE IF EXISTS `Package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Package` (
  `PackageID` int(10) unsigned NOT NULL,
  `Length` decimal(6,2) unsigned NOT NULL,
  `Width` decimal(6,2) unsigned NOT NULL,
  `Height` decimal(6,2) unsigned NOT NULL,
  `Weight` decimal(5,2) unsigned NOT NULL,
  PRIMARY KEY (`PackageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Package`
--

LOCK TABLES `Package` WRITE;
/*!40000 ALTER TABLE `Package` DISABLE KEYS */;
INSERT INTO `Package` VALUES (1,28.82,78.86,146.97,11.86),(2,116.75,66.47,105.28,69.19),(3,86.71,77.12,133.45,65.27),(4,34.28,64.09,137.17,28.00),(6,151.57,83.72,49.45,71.45),(7,100.10,56.32,56.40,14.89),(8,165.58,34.12,106.07,59.19),(9,143.65,47.74,141.54,106.44),(11,121.61,86.65,138.10,175.64),(12,175.12,57.51,30.57,9.47),(13,151.40,50.23,145.73,122.48),(14,133.51,29.61,137.23,56.44),(16,43.31,76.62,97.29,18.51),(17,134.67,44.29,132.06,53.86),(18,79.39,88.25,116.88,31.60),(19,190.40,53.44,88.94,73.82),(20,63.46,56.72,138.24,24.05),(21,35.65,58.38,86.71,16.37),(22,188.30,28.24,133.44,46.04),(23,26.39,47.18,138.17,5.76),(24,101.93,50.55,129.38,44.36),(25,191.81,33.98,48.67,32.04),(26,92.88,42.24,79.55,19.25),(28,76.17,25.86,103.84,20.28),(29,185.85,67.17,88.10,73.66),(30,136.49,64.73,48.53,56.24),(31,51.58,29.01,57.78,8.53),(34,191.37,86.92,115.80,155.84),(35,192.19,59.21,133.17,136.23),(36,157.69,29.04,80.68,27.90),(37,176.48,88.78,38.21,53.34),(38,161.04,57.13,57.57,46.44),(39,168.08,37.37,127.81,32.02),(40,98.10,60.98,99.55,17.96),(41,84.94,83.66,66.75,59.23),(42,46.63,60.58,81.53,14.99),(44,136.59,76.78,23.71,11.11),(45,143.49,45.64,124.43,99.24),(46,191.51,42.23,118.12,113.35),(47,171.23,85.14,144.15,203.14),(48,53.07,85.07,146.78,71.98),(49,71.97,45.85,29.40,11.82),(50,49.88,59.80,68.01,8.06),(51,47.49,60.16,76.18,8.56),(52,102.08,87.47,61.70,32.31),(53,159.62,86.81,57.95,35.35),(54,137.96,47.16,23.93,3.96),(55,177.40,42.90,28.90,19.51),(56,67.01,22.41,94.71,17.58),(57,146.09,73.41,100.25,116.24),(58,177.91,56.60,142.05,55.10),(59,63.11,35.38,86.16,14.33),(60,170.44,65.98,111.16,157.20),(61,131.29,87.07,120.81,67.62),(62,51.16,48.01,92.02,16.69),(63,123.05,28.88,28.58,9.24),(64,162.87,78.40,105.88,138.10),(65,182.40,56.08,128.09,139.64),(66,144.04,83.93,67.32,77.46),(67,48.74,64.09,106.19,8.26),(68,109.73,49.83,106.66,26.40),(70,37.80,44.85,94.29,3.25),(72,161.13,31.37,92.75,27.97),(73,69.66,63.14,53.43,24.91),(74,97.08,42.68,74.24,32.99),(75,35.89,24.10,50.47,3.80),(76,174.64,64.20,87.35,92.87),(77,152.02,24.36,53.85,16.29),(78,196.42,29.79,128.94,79.37),(79,159.06,39.58,40.53,9.48),(80,171.66,75.73,64.79,64.39),(81,88.42,78.68,142.74,26.83),(82,88.45,88.43,98.92,86.64),(87,63.48,38.81,113.91,34.41),(88,165.72,80.91,120.71,54.11),(89,93.62,64.16,135.63,96.15),(90,140.30,62.33,145.35,26.75),(92,46.15,68.09,145.10,31.89),(94,179.06,53.35,112.46,46.00),(96,53.76,68.61,133.11,48.13),(97,91.53,37.36,41.74,16.83),(98,195.66,49.97,48.72,24.62),(99,156.25,27.96,74.73,36.23),(100,142.41,26.48,92.04,15.13);
/*!40000 ALTER TABLE `Package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Passenger`
--

DROP TABLE IF EXISTS `Passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Passenger` (
  `PassID` int(10) unsigned NOT NULL,
  `FirstName` varchar(25) NOT NULL,
  `LastName` varchar(25) NOT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `State` varchar(25) DEFAULT NULL,
  `RegionCode` varchar(10) DEFAULT NULL,
  `LocationLat` decimal(9,6) DEFAULT NULL,
  `LocationLong` decimal(9,6) DEFAULT NULL,
  PRIMARY KEY (`PassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Passenger`
--

LOCK TABLES `Passenger` WRITE;
/*!40000 ALTER TABLE `Passenger` DISABLE KEYS */;
INSERT INTO `Passenger` VALUES (100,'Kaitlin','Wilkinson','P.O. Box 679, 2590 Sed Rd.','Copper Harbor','MI','75125',47.467839,-87.884957),(101,'Macaulay','Bennett','507-2112 Lobortis Rd.','Baudette','MN','29214',48.708318,-94.588058),(102,'Hope','Rosa','Ap #949-9193 Bibendum. St.','Pickwick','MN','07667',43.919950,-91.545925),(103,'Micah','Michael','228-9427 Tempor Rd.','Oak Park','IL','74776',41.889015,-87.766747),(104,'Judith','Nash','738-6649 Lectus Ave','International Falls','MN','67422',48.580635,-93.392883),(105,'Avram','Ashley','975-9332 Iaculis Rd.','Crooked Lake','MN','44972',48.178564,-91.788763),(106,'Wang','Logan','456 Mauris Rd.','Grand Portage','MN','23667',47.970198,-89.672391),(107,'Gregory','Reeves','Ap #236-7045 Auctor Ave','Eau Claire','WI','54701',44.763124,-91.465354),(108,'Sean','Galloway','Ap #948-3254 Dui. Av.','Altoona','WI','25740',44.793080,-91.406874),(109,'Elliott','Glover','Ap #526-3250 Id Street','Grand Haven','MI','11141',43.068581,-86.234254),(110,'Vernon','Ferguson','4644 A St.','Athens','WI','54411',45.001336,-90.003809),(111,'Walter','Hart','P.O. Box 135, 6478 Mattis. Street','Eau','WI','08109',42.000000,-93.000000),(112,'Kibo','Rios','P.O. Box 952, 8442 Eget, Street','Eau','WI','66448',41.000000,-89.000000),(113,'Carson','Lyons','Ap #182-970 Lorem Ave','Eau','WI','38452',42.000000,-94.000000),(114,'Christine','Francis','282-3258 Nunc St.','Eau','WI','43462',51.000000,-92.000000),(115,'Alan','Sweeney','Ap #711-524 Enim. St.','Eau','WI','31382',47.000000,-92.000000),(116,'Calista','Porter','195-9752 Ligula Ave','Eau','WI','43398',44.000000,-88.000000),(117,'Wing','Warner','112-5439 Diam. St.','Eau','WI','55579',52.000000,-88.000000),(118,'Cody','Black','911-7930 Fermentum St.','Eau','WI','38904',45.000000,-94.000000),(119,'Plato','Buck','Ap #216-7989 Gravida. Avenue','Eau','MN','70230',49.000000,-93.000000),(120,'George','Key','P.O. Box 808, 1785 Cursus Avenue','Eau','IL','19783',46.000000,-92.000000),(121,'Wylie','Olsen','Ap #233-6731 Pellentesque Ave','Eau','WI','68969',50.000000,-90.000000),(122,'Hammett','Terrell','7056 Nibh Rd.','Eau','IL','56822',41.000000,-94.000000),(123,'Imani','Woodward','3398 Sit St.','Eau','MN','35203',42.000000,-94.000000),(124,'Jemima','Petty','Ap #756-8877 Orci Rd.','Eau','MN','98082',52.000000,-94.000000),(125,'Florence','Park','P.O. Box 836, 7688 Libero Road','Eau','IL','38621',43.000000,-88.000000),(126,'Arsenio','Walker','Ap #569-1773 Donec Rd.','Eau','WI','62795',41.000000,-88.000000),(127,'Aristotle','Bryan','P.O. Box 837, 5299 Cras Rd.','Eau','WI','63264',49.000000,-87.000000),(128,'Tatyana','Branch','Ap #376-6591 Dictum Rd.','Eau','WI','96810',42.000000,-92.000000),(129,'Bradley','Black','660-3148 Sed, Rd.','Eau','MN','56779',45.000000,-90.000000),(130,'Chester','Lindsay','7120 Phasellus Rd.','Eau','MN','35255',53.000000,-88.000000),(131,'Timothy','Richardson','Ap #960-8395 Faucibus St.','Eau','MI','25539',52.000000,-92.000000),(132,'Jin','Bender','P.O. Box 864, 315 Dis Road','Eau','WI','06984',43.000000,-93.000000),(133,'Claudia','Kirkland','761-6997 Ipsum. Road','Eau','WI','97831',55.000000,-90.000000),(134,'Gary','Griffin','P.O. Box 736, 758 Lectus. St.','Eau','IL','58629',56.000000,-94.000000),(135,'Lara','Montgomery','Ap #799-5651 Mauris Ave','Eau','WI','66505',42.000000,-94.000000),(136,'Jaquelyn','Emerson','2300 Consectetuer Ave','Eau','WI','24409',47.000000,-88.000000),(137,'Ryder','Cote','P.O. Box 442, 7771 Interdum. Avenue','Eau','MI','23919',56.000000,-91.000000),(138,'Echo','Talley','P.O. Box 575, 1788 Justo. Rd.','Eau','WI','48768',56.000000,-92.000000),(139,'Driscoll','Brown','P.O. Box 586, 5355 Mattis St.','Eau','WI','88864',55.000000,-94.000000),(140,'Rae','Collier','P.O. Box 801, 2786 Praesent Street','Eau','WI','82731',51.000000,-92.000000),(141,'Fallon','Brady','P.O. Box 195, 620 Ut Ave','Eau','WI','18221',41.000000,-93.000000),(142,'Asher','Forbes','418-6995 Convallis Street','Eau','MN','92443',44.000000,-92.000000),(143,'Kaden','Atkins','P.O. Box 677, 1753 Praesent Ave','Eau','MI','90594',45.000000,-93.000000),(144,'Quincy','Flowers','985-5999 Metus. St.','Eau','WI','59743',53.000000,-88.000000),(145,'Marshall','Bell','596-6069 Ut Street','Eau','WI','89501',50.000000,-89.000000),(146,'Joseph','Hess','866-3925 Dolor. Rd.','Eau','MN','74517',52.000000,-87.000000),(147,'Griffin','Barrett','P.O. Box 150, 6109 Per St.','Eau','WI','35672',44.000000,-87.000000),(148,'Latifah','Oconnor','199-2442 Felis Ave','Eau','WI','13084',55.000000,-92.000000),(149,'Ifeoma','Benton','Ap #698-7951 Nulla Rd.','Eau','WI','79044',45.000000,-94.000000),(150,'Hilda','Francis','157-6703 Risus, St.','Eau','WI','93045',51.000000,-93.000000),(151,'Graiden','Jefferson','Ap #471-2774 Felis, Road','Eau','MN','60031',42.000000,-87.000000),(152,'Rooney','Flowers','Ap #148-4474 Maecenas Ave','Eau','MI','74836',56.000000,-90.000000),(153,'Jacob','Reyes','Ap #107-366 Curae; St.','Eau','IL','75480',49.000000,-88.000000),(154,'TaShya','Rogers','P.O. Box 381, 2572 Quisque Av.','Eau','WI','83423',55.000000,-90.000000),(155,'Xander','Joyce','Ap #991-8188 Ac St.','Eau','WI','03680',51.000000,-91.000000),(156,'August','Mcguire','P.O. Box 381, 2509 Diam St.','Eau','IL','09834',56.000000,-87.000000),(157,'Branden','Neal','P.O. Box 390, 1423 Faucibus. St.','Eau','WI','36296',42.000000,-94.000000),(158,'Olympia','Keller','3796 Id, Ave','Eau','IL','16812',42.000000,-91.000000),(159,'Bell','Garrison','5790 Venenatis Ave','Eau','MN','88136',47.000000,-91.000000),(160,'Demetria','Bradford','7358 Elementum St.','Eau','WI','36983',41.000000,-91.000000),(161,'Dolan','Gay','7953 Etiam Avenue','Eau','MN','20704',46.000000,-90.000000),(162,'Shelley','Carpenter','898-2248 Dolor. St.','Eau','IL','64608',44.000000,-89.000000),(163,'Hadassah','Pearson','P.O. Box 951, 9920 Metus Ave','Eau','WI','80048',52.000000,-89.000000),(164,'Maite','Harding','1263 Lobortis Av.','Eau','WI','49627',50.000000,-93.000000),(165,'McKenzie','Pollard','1739 Suspendisse Ave','Eau','WI','81784',46.000000,-92.000000),(166,'Oscar','Harper','9802 Eros Street','Eau','WI','07745',55.000000,-90.000000),(167,'Beverly','Holman','P.O. Box 908, 9545 Suspendisse St.','Eau','MI','08471',49.000000,-91.000000),(168,'Chaney','Gates','8126 Vestibulum, Rd.','Eau','WI','31478',44.000000,-92.000000),(169,'Amir','Wong','445-470 Per Ave','Eau','MN','17314',44.000000,-93.000000),(170,'Bell','Medina','4055 Commodo Avenue','Eau','MN','40419',41.000000,-91.000000),(171,'Jerome','Delacruz','P.O. Box 221, 380 Scelerisque Avenue','Eau','IL','41932',48.000000,-87.000000),(172,'Judah','Dixon','506-7786 Rutrum St.','Eau','WI','79111',54.000000,-91.000000),(173,'Hilary','Hancock','699-9144 Massa Road','Eau','MN','15597',44.000000,-91.000000),(174,'Desirae','Riley','803-1143 Nec St.','Eau','WI','09103',43.000000,-93.000000),(175,'Stephen','Dotson','Ap #982-4670 Vulputate Road','Eau','WI','29497',53.000000,-90.000000),(176,'Forrest','Mcgowan','824 Vitae Ave','Eau','WI','53548',55.000000,-94.000000),(177,'TaShya','Flowers','3949 Nullam St.','Eau','MI','52422',54.000000,-89.000000),(178,'Halee','Ryan','P.O. Box 351, 1429 Blandit St.','Eau','MN','99777',41.000000,-92.000000),(179,'Karen','Logan','Ap #430-1931 Lectus St.','Eau','WI','94531',45.000000,-93.000000),(180,'Cooper','Velez','628-3307 Neque Rd.','Eau','WI','94437',46.000000,-92.000000),(181,'Axel','Ewing','627-7874 Sapien, St.','Eau','WI','09277',46.000000,-88.000000),(182,'Fay','Decker','731-5984 Donec Street','Eau','IL','39360',46.000000,-93.000000),(183,'Uriah','Warren','P.O. Box 431, 838 Augue St.','Eau','MN','44462',50.000000,-90.000000),(184,'Yoshio','Edwards','5636 Iaculis Rd.','Eau','MI','48477',53.000000,-87.000000),(185,'Mira','Christensen','869-3043 Integer Rd.','Eau','WI','78525',46.000000,-89.000000),(186,'Grant','Lindsey','P.O. Box 475, 354 Luctus Street','Eau','WI','14039',44.000000,-91.000000),(187,'Signe','Cain','P.O. Box 623, 9975 Nunc. St.','Eau','WI','32003',45.000000,-89.000000),(188,'Adrienne','Moreno','682 Libero Avenue','Eau','WI','51025',55.000000,-89.000000),(189,'Bertha','Romero','P.O. Box 336, 5507 Lectus Av.','Eau','WI','26749',52.000000,-89.000000),(190,'Melvin','Craig','P.O. Box 101, 1838 Metus. Rd.','Eau','IL','15715',42.000000,-89.000000),(191,'Hayfa','Hays','Ap #949-5428 Sem. Street','Eau','WI','45606',56.000000,-88.000000),(192,'Ashely','Alvarez','Ap #464-8457 Ipsum Rd.','Eau','MN','93291',53.000000,-89.000000),(193,'Wynter','Gibson','337-2697 Id, Rd.','Eau','WI','93404',47.000000,-94.000000),(194,'Edan','Washington','1903 Erat Road','Eau','WI','16038',56.000000,-87.000000),(195,'Aphrodite','Whitaker','186-4493 Mauris Av.','Eau','WI','01487',49.000000,-88.000000),(196,'Constance','Barrera','946-7817 Sed Ave','Eau','MN','21864',44.000000,-93.000000),(197,'Finn','Howell','P.O. Box 584, 5128 Et Rd.','Eau','WI','24209',46.000000,-94.000000),(198,'Armand','Rice','Ap #217-224 Et Street','Eau','MN','10300',46.000000,-90.000000),(199,'Hall','Sweet','P.O. Box 752, 5308 Fermentum St.','Eau','WI','75831',43.000000,-91.000000);
/*!40000 ALTER TABLE `Passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PassengerGroup`
--

DROP TABLE IF EXISTS `PassengerGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `PassengerGroup` (
  `GroupID` int(10) unsigned NOT NULL,
  `PassID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`GroupID`,`PassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PassengerGroup`
--

LOCK TABLES `PassengerGroup` WRITE;
/*!40000 ALTER TABLE `PassengerGroup` DISABLE KEYS */;
INSERT INTO `PassengerGroup` VALUES (11,163),(12,142),(12,167),(13,146),(14,129),(15,148),(15,165),(16,151),(17,152),(17,194),(18,153),(19,143),(19,169),(20,129),(20,157),(21,159),(22,144),(23,123),(23,153),(24,132),(24,173),(25,167),(26,124),(26,151),(26,183),(27,127),(27,175),(28,167),(28,186),(29,138),(29,150),(29,164),(29,185),(30,117),(30,126),(30,158),(31,123),(31,134),(31,156),(31,198),(32,166),(32,196),(33,154),(33,176),(34,130),(34,140),(34,145),(34,161),(35,175),(36,130),(36,145),(37,145),(37,177),(37,183),(37,184),(37,199),(38,161),(39,154),(40,163),(40,178),(40,186),(41,146),(42,116),(42,145),(43,132),(44,142),(44,191),(44,193),(45,129),(45,184),(46,174),(46,175),(47,132),(47,149),(48,110),(48,144),(49,112),(49,132),(49,148),(49,157),(50,117),(50,129),(50,151),(61,111),(61,130),(61,144),(61,156),(61,176),(61,182),(61,183),(62,127),(63,174),(64,131),(65,170),(66,145),(67,157),(67,169),(68,104),(68,146),(68,171),(69,133),(70,141),(70,166),(71,168),(72,114),(72,129),(72,175),(73,129),(73,137),(73,174),(74,157),(75,104),(75,146),(75,174),(75,177),(76,144),(77,145),(78,137),(79,144),(80,128),(80,132),(80,176),(80,186),(91,147),(91,149),(91,168),(91,191),(91,193),(92,129),(93,140),(93,174),(94,157),(95,146),(96,144),(96,199),(97,145),(97,189),(98,137),(99,129),(99,144),(100,108),(100,127),(100,128),(100,158),(100,173),(100,185),(111,135),(111,139),(111,144),(111,148),(111,193),(111,199),(112,166),(113,109),(113,139),(113,151),(114,138),(114,164),(114,175),(115,102),(115,167),(116,128),(116,134),(116,157),(116,185),(117,148),(117,166),(118,152),(119,122),(119,163),(120,142),(121,105),(121,170),(122,144),(122,149),(123,142),(124,164),(125,125),(126,126),(127,141),(127,197),(128,128),(128,131),(128,136),(128,138),(129,156),(130,147),(130,148),(130,189),(130,198);
/*!40000 ALTER TABLE `PassengerGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RemotePilot`
--

DROP TABLE IF EXISTS `RemotePilot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `RemotePilot` (
  `PilotID` int(11) NOT NULL,
  `FirstName` varchar(25) DEFAULT NULL,
  `LastName` varchar(25) DEFAULT NULL,
  `Salary` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`PilotID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RemotePilot`
--

LOCK TABLES `RemotePilot` WRITE;
/*!40000 ALTER TABLE `RemotePilot` DISABLE KEYS */;
INSERT INTO `RemotePilot` VALUES (1,'Jon','Cooley',45321.00),(2,'Kyle','Lowenehagen',48519.00),(3,'Josh','Cooley',42065.00),(4,'Shawn','Creviston',50134.00),(5,'Eric','Wackwitz',54236.00);
/*!40000 ALTER TABLE `RemotePilot` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-09 14:00:10
