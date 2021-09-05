-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: team
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `coaches`
--

DROP TABLE IF EXISTS `coaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coaches` (
  `idcoaches` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `surname` varchar(60) NOT NULL,
  `age` tinyint unsigned NOT NULL,
  `position` enum('hc','gc','dc','mc','fc') NOT NULL,
  PRIMARY KEY (`idcoaches`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coaches`
--

LOCK TABLES `coaches` WRITE;
/*!40000 ALTER TABLE `coaches` DISABLE KEYS */;
/*!40000 ALTER TABLE `coaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `condition`
--

DROP TABLE IF EXISTS `condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `condition` (
  `player_id` int NOT NULL,
  `training` tinyint unsigned NOT NULL,
  `mood` tinyint unsigned NOT NULL,
  UNIQUE KEY `player_id_UNIQUE` (`player_id`),
  KEY `player_id_idx` (`player_id`),
  CONSTRAINT `player_id_condition` FOREIGN KEY (`player_id`) REFERENCES `profiles` (`idprofiles`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `condition`
--

LOCK TABLES `condition` WRITE;
/*!40000 ALTER TABLE `condition` DISABLE KEYS */;
/*!40000 ALTER TABLE `condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finances`
--

DROP TABLE IF EXISTS `finances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `finances` (
  `player_id` int NOT NULL,
  `contract_value` int unsigned NOT NULL,
  `contract_duration` tinyint unsigned NOT NULL,
  `release_clause` enum('yes','no') NOT NULL,
  `bonuse_value` int unsigned NOT NULL,
  UNIQUE KEY `player_id_UNIQUE` (`player_id`),
  KEY `player_id_idx` (`player_id`),
  CONSTRAINT `player_id_finance` FOREIGN KEY (`player_id`) REFERENCES `profiles` (`idprofiles`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finances`
--

LOCK TABLES `finances` WRITE;
/*!40000 ALTER TABLE `finances` DISABLE KEYS */;
/*!40000 ALTER TABLE `finances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `injuries`
--

DROP TABLE IF EXISTS `injuries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `injuries` (
  `idinjuries` int NOT NULL AUTO_INCREMENT,
  `player_id` int NOT NULL,
  `status` enum('ready','injury') NOT NULL,
  `type` enum('muscle','physical','virus') NOT NULL,
  `start` date NOT NULL,
  `finish` date DEFAULT NULL,
  `staff` int NOT NULL,
  PRIMARY KEY (`idinjuries`),
  KEY `player_id_idx` (`player_id`),
  KEY `staff_id_idx` (`staff`),
  CONSTRAINT `player_id` FOREIGN KEY (`player_id`) REFERENCES `profiles` (`idprofiles`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `staff_id` FOREIGN KEY (`staff`) REFERENCES `medical_center` (`idmc`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `injuries`
--

LOCK TABLES `injuries` WRITE;
/*!40000 ALTER TABLE `injuries` DISABLE KEYS */;
/*!40000 ALTER TABLE `injuries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_center`
--

DROP TABLE IF EXISTS `medical_center`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_center` (
  `idmc` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `surname` varchar(60) NOT NULL,
  `age` tinyint unsigned NOT NULL,
  `position` enum('cd','doc','phys','sci') NOT NULL,
  PRIMARY KEY (`idmc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_center`
--

LOCK TABLES `medical_center` WRITE;
/*!40000 ALTER TABLE `medical_center` DISABLE KEYS */;
/*!40000 ALTER TABLE `medical_center` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `idprofiles` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `surname` varchar(60) NOT NULL,
  `position` enum('GK','DF','MF','FW') NOT NULL,
  `age` tinyint unsigned NOT NULL,
  `height` tinyint unsigned NOT NULL,
  `speed` tinyint unsigned NOT NULL,
  `dribbling` tinyint unsigned NOT NULL,
  `passing` tinyint unsigned NOT NULL,
  `shooting` tinyint unsigned NOT NULL,
  `stamina` tinyint unsigned NOT NULL,
  `tackling` tinyint unsigned NOT NULL,
  `jumping` tinyint unsigned NOT NULL,
  `strength` tinyint unsigned NOT NULL,
  `finishing` tinyint unsigned NOT NULL,
  `goalkeeping` tinyint unsigned NOT NULL,
  `reaction` tinyint unsigned NOT NULL,
  `technique` tinyint unsigned NOT NULL,
  PRIMARY KEY (`idprofiles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserve_team`
--

DROP TABLE IF EXISTS `reserve_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserve_team` (
  `reserve_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `surname` varchar(60) NOT NULL,
  `position` enum('GK','DF','MF','FW') NOT NULL,
  `age` tinyint unsigned NOT NULL,
  PRIMARY KEY (`reserve_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserve_team`
--

LOCK TABLES `reserve_team` WRITE;
/*!40000 ALTER TABLE `reserve_team` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserve_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scouting`
--

DROP TABLE IF EXISTS `scouting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scouting` (
  `idscouting` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `surname` varchar(60) NOT NULL,
  `age` tinyint unsigned NOT NULL,
  `region` enum('asia','africa','EU','america') NOT NULL,
  `scout_position` enum('GK','DF','MF','FW') NOT NULL,
  PRIMARY KEY (`idscouting`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scouting`
--

LOCK TABLES `scouting` WRITE;
/*!40000 ALTER TABLE `scouting` DISABLE KEYS */;
/*!40000 ALTER TABLE `scouting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `start_lineup`
--

DROP TABLE IF EXISTS `start_lineup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `start_lineup` (
  `player_id` int NOT NULL,
  `position` enum('GK','DF','MF','FW') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `start_lineup`
--

LOCK TABLES `start_lineup` WRITE;
/*!40000 ALTER TABLE `start_lineup` DISABLE KEYS */;
/*!40000 ALTER TABLE `start_lineup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statistics`
--

DROP TABLE IF EXISTS `statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statistics` (
  `player_id` int NOT NULL,
  `games_played` tinyint unsigned NOT NULL,
  `cleen_sheet` tinyint unsigned NOT NULL,
  `goal_scored` tinyint unsigned NOT NULL,
  `assists` tinyint unsigned NOT NULL,
  UNIQUE KEY `player_id_UNIQUE` (`player_id`),
  KEY `player_id_idx` (`player_id`),
  CONSTRAINT `player_id_stat` FOREIGN KEY (`player_id`) REFERENCES `profiles` (`idprofiles`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statistics`
--

LOCK TABLES `statistics` WRITE;
/*!40000 ALTER TABLE `statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `statistics` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-05  0:45:37
