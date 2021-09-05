-- MariaDB dump 10.17  Distrib 10.4.15-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_25
-- ------------------------------------------------------
-- Server version	10.4.15-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coaches` (
  `idcoaches` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` tinyint(3) unsigned NOT NULL,
  `position` enum('hc','gc','dc','mc','fc') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idcoaches`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coaches`
--

LOCK TABLES `coaches` WRITE;
/*!40000 ALTER TABLE `coaches` DISABLE KEYS */;
INSERT INTO `coaches` VALUES (1,'Lennie','Gleason',34,'fc'),(2,'Dewitt','Runolfsdottir',35,'gc'),(3,'Giovanni','Sanford',31,'hc'),(4,'Virgil','Batz',36,'gc'),(5,'Frank','Collier',45,'dc'),(6,'Marcel','Legros',46,'dc'),(7,'Deven','Monahan',37,'mc'),(8,'Norwood','Legros',41,'dc'),(9,'Jayme','Schiller',49,'mc'),(10,'Jovan','Swift',40,'mc');
/*!40000 ALTER TABLE `coaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `condition`
--

DROP TABLE IF EXISTS `condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `condition` (
  `player_id` int(11) NOT NULL,
  `training` tinyint(3) unsigned NOT NULL,
  `mood` tinyint(3) unsigned NOT NULL,
  UNIQUE KEY `player_id_UNIQUE` (`player_id`),
  KEY `player_id_idx` (`player_id`),
  CONSTRAINT `player_id_condition` FOREIGN KEY (`player_id`) REFERENCES `profiles` (`idprofiles`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `condition`
--

LOCK TABLES `condition` WRITE;
/*!40000 ALTER TABLE `condition` DISABLE KEYS */;
INSERT INTO `condition` VALUES (1,35,99),(2,30,67),(3,22,50),(4,1,22),(5,49,56),(6,95,64),(7,46,74),(8,4,76),(9,91,71),(10,56,51),(11,20,90),(12,28,82),(13,50,75),(14,53,68),(15,49,33),(16,48,75),(17,37,54),(18,0,73),(19,43,5),(20,76,86),(21,56,82),(22,93,55),(23,13,89),(24,71,65),(25,82,88);
/*!40000 ALTER TABLE `condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finances`
--

DROP TABLE IF EXISTS `finances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finances` (
  `player_id` int(11) NOT NULL,
  `contract_value` int(10) unsigned NOT NULL,
  `contract_duration` tinyint(3) unsigned NOT NULL,
  `release_clause` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL,
  `bonuse_value` int(10) unsigned NOT NULL,
  UNIQUE KEY `player_id_UNIQUE` (`player_id`),
  KEY `player_id_idx` (`player_id`),
  CONSTRAINT `player_id_finance` FOREIGN KEY (`player_id`) REFERENCES `profiles` (`idprofiles`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finances`
--

LOCK TABLES `finances` WRITE;
/*!40000 ALTER TABLE `finances` DISABLE KEYS */;
INSERT INTO `finances` VALUES (1,6841160,5,'yes',2521740),(2,8601851,1,'no',2409598),(3,9987240,3,'yes',862283),(4,9256889,4,'yes',2521183),(5,2580482,1,'no',2394553),(6,4484029,1,'no',1003967),(7,2154945,4,'yes',698361),(8,9975771,1,'yes',2528049),(9,5410401,5,'yes',287748),(10,2359995,1,'no',365483),(11,8751395,1,'yes',524451),(12,1123885,4,'no',256159),(13,5069886,1,'yes',1967013),(14,6698149,5,'yes',623816),(15,4204198,4,'yes',1676138),(16,5646997,3,'no',509950),(17,4752251,5,'yes',2426859),(18,4445444,3,'yes',903737),(19,6961107,3,'no',205836),(20,1203052,2,'yes',2668026),(21,4958366,2,'no',2735309),(22,5552196,3,'no',1967576),(23,4988474,3,'no',638016),(24,6957992,1,'yes',1149544),(25,5031173,3,'no',1028788);
/*!40000 ALTER TABLE `finances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `injuries`
--

DROP TABLE IF EXISTS `injuries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `injuries` (
  `idinjuries` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `status` enum('ready','injury') COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('muscle','physical','virus') COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` date NOT NULL,
  `finish` date DEFAULT NULL,
  `staff` int(11) NOT NULL,
  PRIMARY KEY (`idinjuries`),
  KEY `player_id_idx` (`player_id`),
  KEY `staff_id_idx` (`staff`),
  CONSTRAINT `player_id` FOREIGN KEY (`player_id`) REFERENCES `profiles` (`idprofiles`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `staff_id` FOREIGN KEY (`staff`) REFERENCES `medical_center` (`idmc`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `injuries`
--

LOCK TABLES `injuries` WRITE;
/*!40000 ALTER TABLE `injuries` DISABLE KEYS */;
INSERT INTO `injuries` VALUES (1,23,'ready','physical','1996-05-01','1982-07-30',1),(2,25,'injury','virus','2003-07-09','2017-01-15',2),(3,6,'injury','physical','1990-02-07','1982-05-06',3),(4,1,'injury','physical','2007-10-28','1995-11-13',4),(5,19,'injury','muscle','2019-01-25','2006-03-16',5),(6,2,'injury','physical','2020-05-31','2002-04-14',6),(7,22,'ready','physical','1989-09-06','2015-10-28',7),(8,5,'injury','muscle','1990-01-08','2019-09-15',8),(9,4,'ready','muscle','2017-10-24','1994-09-18',9),(10,17,'injury','muscle','1970-02-22','1971-10-10',10),(11,10,'ready','physical','2002-09-06','1981-01-29',1),(12,19,'injury','muscle','1988-11-16','1980-07-16',2),(13,7,'ready','muscle','1983-10-04','2002-04-02',3),(14,8,'ready','physical','2017-12-02','1988-08-11',4),(15,9,'injury','physical','1996-11-20','1983-04-23',5),(16,25,'injury','muscle','1981-08-25','1994-12-25',6),(17,18,'ready','physical','1980-05-26','1980-11-17',7),(18,19,'ready','muscle','1979-02-25','1979-06-20',8),(19,20,'injury','muscle','2008-07-09','1998-03-10',9),(20,15,'ready','physical','2012-08-04','1985-06-22',10),(21,17,'ready','muscle','2008-12-01','1988-09-04',1),(22,23,'injury','muscle','2004-08-16','1975-04-11',2),(23,23,'injury','physical','2001-02-11','1988-11-11',3),(24,8,'ready','virus','2002-11-03','1986-07-12',4),(25,6,'injury','virus','2020-07-21','2009-09-26',5),(26,24,'injury','virus','1987-05-09','2015-03-25',6),(27,16,'ready','physical','1983-04-14','2017-03-23',7),(28,16,'ready','virus','2013-12-22','2012-10-16',8),(29,7,'injury','physical','2000-12-07','1977-06-13',9),(30,7,'ready','muscle','1978-07-09','1976-05-27',10),(31,18,'injury','muscle','2016-12-17','1984-04-20',1),(32,4,'injury','physical','1990-01-01','1980-10-07',2),(33,6,'injury','muscle','2011-01-07','2012-08-12',3),(34,23,'ready','muscle','1993-02-13','2020-11-07',4),(35,5,'injury','virus','1986-06-07','1972-01-04',5),(36,24,'ready','physical','2009-07-21','2019-10-04',6),(37,25,'injury','physical','1972-03-01','1996-02-13',7),(38,2,'ready','muscle','2010-12-31','1976-09-18',8),(39,3,'ready','muscle','2010-06-13','1973-07-25',9),(40,4,'ready','physical','1975-03-16','1984-01-29',10);
/*!40000 ALTER TABLE `injuries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_center`
--

DROP TABLE IF EXISTS `medical_center`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medical_center` (
  `idmc` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` tinyint(3) unsigned NOT NULL,
  `position` enum('cd','doc','phys','sci') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idmc`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_center`
--

LOCK TABLES `medical_center` WRITE;
/*!40000 ALTER TABLE `medical_center` DISABLE KEYS */;
INSERT INTO `medical_center` VALUES (1,'Hipolito','Rodriguez',35,'doc'),(2,'Rigoberto','Botsford',50,'cd'),(3,'Harmon','Luettgen',48,'phys'),(4,'Titus','Rogahn',48,'phys'),(5,'Mose','Ondricka',47,'doc'),(6,'Jamaal','Ritchie',35,'phys'),(7,'Norbert','Donnelly',49,'sci'),(8,'Okey','Bode',45,'phys'),(9,'Arthur','Greenholt',47,'phys'),(10,'Osborne','Bergstrom',35,'phys');
/*!40000 ALTER TABLE `medical_center` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `idprofiles` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` enum('GK','DF','MF','FW') COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` tinyint(3) unsigned NOT NULL,
  `height` tinyint(3) unsigned NOT NULL,
  `speed` tinyint(3) unsigned NOT NULL,
  `dribbling` tinyint(3) unsigned NOT NULL,
  `passing` tinyint(3) unsigned NOT NULL,
  `shooting` tinyint(3) unsigned NOT NULL,
  `stamina` tinyint(3) unsigned NOT NULL,
  `tackling` tinyint(3) unsigned NOT NULL,
  `jumping` tinyint(3) unsigned NOT NULL,
  `strength` tinyint(3) unsigned NOT NULL,
  `finishing` tinyint(3) unsigned NOT NULL,
  `goalkeeping` tinyint(3) unsigned NOT NULL,
  `reaction` tinyint(3) unsigned NOT NULL,
  `technique` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`idprofiles`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'Maximus','Reinger','GK',20,190,43,54,48,97,92,21,20,87,74,28,14,94),(2,'Keanu','O\'Connell','GK',28,181,80,75,5,98,6,2,22,64,48,94,57,91),(3,'Maverick','Reichel','FW',31,197,18,93,60,23,92,27,42,73,46,67,75,15),(4,'Narciso','Macejkovic','DF',27,189,36,47,61,81,68,7,76,38,96,15,98,50),(5,'Morton','Lubowitz','DF',31,210,66,73,47,74,69,92,0,57,84,52,41,8),(6,'Vincent','Hintz','GK',36,197,23,22,33,6,65,45,77,78,54,78,29,73),(7,'Bernie','Lueilwitz','MF',20,201,18,8,83,37,5,75,43,71,15,99,93,57),(8,'Bo','Kuphal','FW',30,206,94,84,16,22,33,1,55,63,16,59,98,52),(9,'Soledad','Kohler','GK',22,174,63,87,46,36,9,12,78,11,25,75,10,52),(10,'Daren','Mayert','FW',33,193,65,71,78,90,51,74,3,62,1,65,0,72),(11,'Nicklaus','Wisoky','FW',26,157,58,89,30,80,32,59,57,92,58,12,9,36),(12,'Griffin','Wilkinson','FW',34,166,84,32,58,79,95,45,15,92,14,17,45,23),(13,'Cristopher','Lubowitz','MF',24,207,77,85,7,9,35,40,80,32,36,26,15,24),(14,'Christian','Kertzmann','DF',35,174,16,19,38,25,1,70,2,1,9,77,98,45),(15,'Abner','Herzog','GK',19,179,94,63,28,86,30,50,98,96,99,24,6,93),(16,'Floy','Kihn','DF',31,201,1,100,86,2,23,53,72,27,64,48,100,11),(17,'Rashad','Abshire','GK',33,150,84,41,32,74,84,60,49,87,2,44,38,20),(18,'Riley','Grady','GK',34,187,84,42,86,20,58,89,6,97,93,21,50,59),(19,'Joseph','Jacobs','MF',25,194,57,100,45,57,78,63,88,54,16,34,95,7),(20,'Trevion','Balistreri','FW',28,160,12,7,38,83,20,79,84,73,37,37,76,14),(21,'Cristina','Osinski','MF',26,208,63,34,1,78,50,20,65,95,94,78,70,92),(22,'Monte','Jones','MF',34,189,41,99,60,4,58,92,49,39,99,65,75,11),(23,'Riley','Dickinson','FW',33,158,34,49,50,49,7,15,100,30,21,91,50,8),(24,'Jeff','Kuhn','FW',27,192,60,71,66,75,3,56,63,71,83,39,50,9),(25,'Christian','Fay','DF',26,152,75,15,67,49,2,79,9,16,64,3,93,29);
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserve_team`
--

DROP TABLE IF EXISTS `reserve_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserve_team` (
  `reserve_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` enum('GK','DF','MF','FW') COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`reserve_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserve_team`
--

LOCK TABLES `reserve_team` WRITE;
/*!40000 ALTER TABLE `reserve_team` DISABLE KEYS */;
INSERT INTO `reserve_team` VALUES (1,'Jeramie','Stracke','GK',40),(2,'Baron','Rau','DF',39),(3,'Sean','Mertz','GK',37),(4,'Loy','Abshire','DF',42),(5,'Donato','Stokes','FW',44),(6,'Milton','Schaden','GK',39),(7,'Howell','Runolfsson','FW',36),(8,'Kian','Conn','GK',43),(9,'Durward','Carroll','DF',50),(10,'Valentin','Bosco','DF',38);
/*!40000 ALTER TABLE `reserve_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scouting`
--

DROP TABLE IF EXISTS `scouting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scouting` (
  `idscouting` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` tinyint(3) unsigned NOT NULL,
  `region` enum('asia','africa','EU','america') COLLATE utf8mb4_unicode_ci NOT NULL,
  `scout_position` enum('GK','DF','MF','FW') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idscouting`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scouting`
--

LOCK TABLES `scouting` WRITE;
/*!40000 ALTER TABLE `scouting` DISABLE KEYS */;
INSERT INTO `scouting` VALUES (1,'Jasper','Trantow',50,'EU','FW'),(2,'Christopher','Sanford',36,'america','MF'),(3,'Harry','Rau',46,'africa','MF'),(4,'Wilhelm','Heaney',32,'EU','FW'),(5,'Emmanuel','Hane',33,'asia','FW'),(6,'Darian','Beer',32,'asia','DF'),(7,'Verner','Cassin',44,'america','GK'),(8,'Jordon','Rolfson',36,'EU','DF'),(9,'Jamaal','Swaniawski',36,'america','DF'),(10,'Morris','Ryan',33,'america','DF');
/*!40000 ALTER TABLE `scouting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `start_lineup`
--

DROP TABLE IF EXISTS `start_lineup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `start_lineup` (
  `player_id` int(11) NOT NULL,
  `position` enum('GK','DF','MF','FW') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statistics` (
  `player_id` int(11) NOT NULL,
  `games_played` tinyint(3) unsigned NOT NULL,
  `cleen_sheet` tinyint(3) unsigned NOT NULL,
  `goal_scored` tinyint(3) unsigned NOT NULL,
  `assists` tinyint(3) unsigned NOT NULL,
  UNIQUE KEY `player_id_UNIQUE` (`player_id`),
  KEY `player_id_idx` (`player_id`),
  CONSTRAINT `player_id_stat` FOREIGN KEY (`player_id`) REFERENCES `profiles` (`idprofiles`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statistics`
--

LOCK TABLES `statistics` WRITE;
/*!40000 ALTER TABLE `statistics` DISABLE KEYS */;
INSERT INTO `statistics` VALUES (1,20,22,39,29),(2,24,36,6,9),(3,16,25,5,28),(4,4,24,23,9),(5,24,0,6,7),(6,13,35,29,17),(7,17,33,36,26),(8,26,17,50,9),(9,30,1,31,21),(10,3,37,2,17),(11,26,33,20,29),(12,14,15,5,14),(13,17,38,43,25),(14,19,5,24,9),(15,24,37,17,25),(16,36,33,2,7),(17,0,8,23,25),(18,0,18,0,5),(19,11,35,16,30),(20,8,38,4,8),(21,37,4,23,18),(22,13,24,16,0),(23,15,35,31,29),(24,22,15,38,27),(25,33,1,27,1);
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

-- Dump completed on 2021-09-05 12:06:18
