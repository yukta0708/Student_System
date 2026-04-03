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
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `results` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_name` varchar(100) DEFAULT NULL,
  `exam_type` varchar(50) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `marks_obtained` int DEFAULT NULL,
  `total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
INSERT INTO `results` VALUES (1,'ish','unit test','math',35,50,70.00,'2025-04-06 18:31:04'),(2,'ish','unit test','iot',37,50,74.00,'2025-04-06 18:31:04'),(3,'ish','unit test','english',45,50,90.00,'2025-04-06 18:31:04'),(4,'ish','practical exam','math',35,50,70.00,'2025-04-06 18:33:24'),(5,'ish','practical exam','iot',37,50,74.00,'2025-04-06 18:33:24'),(6,'ish','practical exam','english',45,50,90.00,'2025-04-06 18:33:24'),(7,'nikita','unit test','java',45,50,90.00,'2025-04-09 18:39:48'),(8,'nikita','unit test','o',37,50,74.00,'2025-04-09 18:39:48'),(9,'nikita','unit test','dbms',35,50,70.00,'2025-04-09 18:39:48'),(10,'kajal','unit test','os',35,50,70.00,'2025-04-09 18:55:40'),(11,'kajal','unit test','java',32,50,64.00,'2025-04-09 18:55:40'),(12,'kajal','unit test','math',40,50,80.00,'2025-04-09 18:55:40'),(13,'yukta','unit test','java',40,50,80.00,'2025-04-12 09:10:52'),(14,'yukta','unit test','os',45,50,90.00,'2025-04-12 09:10:52'),(15,'yukta','unit test','maths',47,50,94.00,'2025-04-12 09:10:52'),(16,'yukta','unit test','dbms',41,50,82.00,'2025-04-12 09:10:52');
/*!40000 ALTER TABLE `results` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-17 12:24:26
