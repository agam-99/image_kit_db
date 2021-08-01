-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: imagekit
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `directory_item`
--

DROP TABLE IF EXISTS `directory_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directory_item` (
  `type` tinyint(1) NOT NULL,
  `name` varchar(100) NOT NULL,
  `date` date DEFAULT NULL,
  `item_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directory_item`
--

LOCK TABLES `directory_item` WRITE;
/*!40000 ALTER TABLE `directory_item` DISABLE KEYS */;
INSERT INTO `directory_item` VALUES (0,'root','2017-08-25',1),(0,'Folder1','2017-10-25',2),(0,'Folder 2','2017-11-19',3),(0,'SubFolder1','2017-12-20',4),(0,'NestedFolder2','2018-10-10',5),(1,'File1','2018-10-15',6),(1,'File2','2018-05-12',7),(1,'File3','2018-07-10',8),(1,'File4','2020-09-10',9),(0,'folder3','2020-05-30',10),(0,'folder4','2010-05-30',11);
/*!40000 ALTER TABLE `directory_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_info`
--

DROP TABLE IF EXISTS `file_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `file_id` int NOT NULL,
  `format` varchar(100) DEFAULT NULL,
  `size` bigint DEFAULT NULL,
  `dimensions` varchar(100) DEFAULT NULL,
  `file_data` binary(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `file_id` (`file_id`),
  CONSTRAINT `file_id` FOREIGN KEY (`file_id`) REFERENCES `directory_item` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_info`
--

LOCK TABLES `file_info` WRITE;
/*!40000 ALTER TABLE `file_info` DISABLE KEYS */;
INSERT INTO `file_info` VALUES (1,6,'png',23,'20x20',NULL),(2,7,'txt',32,'',NULL),(3,8,'jpg',54,'5x5',NULL),(5,9,'jpg',34,'20x20',NULL);
/*!40000 ALTER TABLE `file_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parent_child`
--

DROP TABLE IF EXISTS `parent_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parent_child` (
  `child_id` int NOT NULL,
  `parent_id` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `child_id` (`child_id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `child_id` FOREIGN KEY (`child_id`) REFERENCES `directory_item` (`item_id`),
  CONSTRAINT `parent_id` FOREIGN KEY (`parent_id`) REFERENCES `directory_item` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parent_child`
--

LOCK TABLES `parent_child` WRITE;
/*!40000 ALTER TABLE `parent_child` DISABLE KEYS */;
INSERT INTO `parent_child` VALUES (2,1,1),(3,1,2),(4,3,3),(5,3,4),(6,2,5),(7,2,6),(8,5,7),(9,5,8),(11,1,10);
/*!40000 ALTER TABLE `parent_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'imagekit'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-01 12:06:17
