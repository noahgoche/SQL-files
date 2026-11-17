-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: musicstreamingservice
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists` (
  `ARTIST_ID` int NOT NULL AUTO_INCREMENT,
  `Artist_Name` varchar(60) DEFAULT NULL,
  `Genre` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ARTIST_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (1,'Eminem','Rap'),(2,'Johnny Cash','Country'),(3,'Axel Rose','Rock'),(4,'Robert Plant','Rock'),(5,'50 Cent','Rap');
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_songs`
--

DROP TABLE IF EXISTS `playlist_songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist_songs` (
  `PLAYLIST_SONGS_ID` int NOT NULL AUTO_INCREMENT,
  `PLAYLIST_ID` int DEFAULT NULL,
  `SONG_ID` int DEFAULT NULL,
  PRIMARY KEY (`PLAYLIST_SONGS_ID`),
  KEY `PLAYLIST_ID` (`PLAYLIST_ID`),
  KEY `SONG_ID` (`SONG_ID`),
  CONSTRAINT `playlist_songs_ibfk_1` FOREIGN KEY (`PLAYLIST_ID`) REFERENCES `playlists` (`PLAYLIST_ID`),
  CONSTRAINT `playlist_songs_ibfk_2` FOREIGN KEY (`SONG_ID`) REFERENCES `songs` (`SONG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_songs`
--

LOCK TABLES `playlist_songs` WRITE;
/*!40000 ALTER TABLE `playlist_songs` DISABLE KEYS */;
INSERT INTO `playlist_songs` VALUES (1,1,4),(2,1,2),(3,1,3),(4,2,1),(5,2,5),(6,2,3),(7,3,4),(8,3,3),(9,4,2),(10,4,5),(11,6,1),(12,5,1),(13,5,3);
/*!40000 ALTER TABLE `playlist_songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlists`
--

DROP TABLE IF EXISTS `playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlists` (
  `PLAYLIST_ID` int NOT NULL AUTO_INCREMENT,
  `Playlist_Name` varchar(80) DEFAULT NULL,
  `USER_ID` int DEFAULT NULL,
  PRIMARY KEY (`PLAYLIST_ID`),
  KEY `USER_ID` (`USER_ID`),
  CONSTRAINT `playlists_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlists`
--

LOCK TABLES `playlists` WRITE;
/*!40000 ALTER TABLE `playlists` DISABLE KEYS */;
INSERT INTO `playlists` VALUES (1,'Favorites',1),(2,'Extra',1),(3,'Rock',2),(4,'Rap',3),(5,'Variety',4),(6,'Country',5);
/*!40000 ALTER TABLE `playlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `songs` (
  `SONG_ID` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) DEFAULT NULL,
  `Duration` decimal(5,2) DEFAULT NULL,
  `ARTIST_ID` int DEFAULT NULL,
  PRIMARY KEY (`SONG_ID`),
  KEY `ARTIST_ID` (`ARTIST_ID`),
  CONSTRAINT `songs_ibfk_1` FOREIGN KEY (`ARTIST_ID`) REFERENCES `artists` (`ARTIST_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs`
--

LOCK TABLES `songs` WRITE;
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
INSERT INTO `songs` VALUES (1,'Ring of Fire',2.63,2),(2,'Piggy Bank',4.25,5),(3,'Stairway to Heaven',8.03,4),(4,'Knockin\' on Heaven\'s door',5.60,3),(5,'Godzilla',3.50,1);
/*!40000 ALTER TABLE `songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `USER_ID` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(60) DEFAULT NULL,
  `Email` varchar(80) DEFAULT NULL,
  `PLAYLIST_ID` int DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  KEY `PLAYLIST_ID` (`PLAYLIST_ID`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`PLAYLIST_ID`) REFERENCES `playlists` (`PLAYLIST_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Noah','noahgoche@gmail.com',NULL),(2,'John','John@gmail.com',NULL),(3,'Mary','ML@gmail.com',NULL),(4,'Bill','William@gmail.com',NULL),(5,'Bob','Bobby@gmail.com',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-04  5:06:35
