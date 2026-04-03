-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: student-system
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `roll_no` varchar(20) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `timing` varchar(50) NOT NULL,
  `status` enum('Present','Absent') NOT NULL,
  `scanned_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `date` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (1,'3','Mathematics','9:00 AM - 10:00 AM','Present','2025-03-26 18:16:19',''),(2,'3','Physics','10:00 AM - 11:00 AM','Present','2025-03-28 12:21:56',''),(3,'54','Computer Science','11:00 AM - 12:00 PM','Present','2025-04-07 17:39:42',''),(4,'54','Computer Science','11:00 AM - 12:00 PM','Present','2025-04-08 16:57:51','2025-04-08'),(5,'20','Computer Science','11:00 AM - 12:00 PM','Present','2025-04-08 16:59:17','2025-04-08'),(6,'54','AI','2:40 AM - 3:40 PM','Present','2025-04-15 05:15:29','2025-04-15'),(7,'54','Java','12:10 AM - 1:10 PM','Present','2025-04-15 10:42:41','2025-04-15'),(8,'54','Operating system','12:10 PM - 1:10 PM','Present','2025-04-15 16:27:15','2025-04-15'),(9,'54','Java','11:10 AM - 12:10 PM','Present','2025-04-15 16:42:59','2025-04-15'),(10,'54','Java','10:10 AM - 11:10 AM','Present','2025-04-15 16:48:21','2025-04-15'),(11,'50','Operating system','10:10 AM - 11:10 AM','Present','2025-04-23 11:05:31','2025-04-23'),(12,'54','Operating system','10:10 AM - 11:10 AM','Present','2025-04-28 05:35:32','2025-04-28'),(13,'54','Java','10:10 AM - 11:10 AM','Present','2025-04-28 06:16:06','2025-04-28');
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-17 12:24:25
