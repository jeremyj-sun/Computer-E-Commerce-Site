-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: WebApplication
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `WebApplication`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `WebApplication` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;

USE `WebApplication`;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(60) DEFAULT NULL,
  `lastname` varchar(60) DEFAULT NULL,
  `username` varchar(60) DEFAULT NULL,
  `pass_word` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Test','Dummy','ABC','123'),(2,'Jeremy','Sun','JJS','123'),(3,'John','Sun','Dad','123'),(4,'Bob','Zuck','zuck','abc'),(5,'john','sun','jsun','dt7221'),(6,'sghsgh','shgshs','xyz','123'),(7,'Stick','Tick','445','445'),(8,'Jeremy','Sun','',''),(9,'aaa','aaa','aaa','aaa'),(10,'jjj','jjj','jjj','jjj');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand` varchar(60) DEFAULT NULL,
  `name` varchar(60) DEFAULT NULL,
  `description` varchar(10000) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `rating` enum('1','2','3','4','5') DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Acer','Swift1','A cheap and simple laptop. Very light.',200,'1','microsoft-surface.jpg'),(2,'Acer','Swift2','A stylish laptop with a reliable processor',300,'2','microsoft-surface.jpg'),(3,'Acer','Swift3','Corning Gorilla Glass, backlit keyboard, and Core i5 processor',400,'3','microsoft-surface.jpg'),(4,'Lenovo','ThinkPad1','The basic ThinkPad',200,'2','microsoft-surface.jpg'),(5,'Lenovo','ThinkPad2','The perfect laptop for computer programmers',300,'3','microsoft-surface.jpg'),(6,'Lenovo','ThinkPad3','This laptop has immense processing power.',700,'5','microsoft-surface.jpg'),(7,'HP','Workbook1','User-friendly laptop with a simple design.',200,'3','microsoft-surface.jpg'),(8,'HP','Workbook2','Laptop containing many unique and handy features.',400,'3','microsoft-surface.jpg'),(9,'HP','Workbook3','POWERFUL i7 Processor and NVIDIA graphics card!',800,'4','microsoft-surface.jpg'),(10,'Dell','Workbook1','Perfect home computer for day-to-day use',500,'5','microsoft-surface.jpg'),(11,'Dell','Workbook2','Fast and plentiful SSD memory.',700,'4','microsoft-surface.jpg'),(12,'Dell','Workbook3','The ultimate gaming laptop',1000,'3','microsoft-surface.jpg'),(13,'Apple','MacBook','Portable, powerful, and stylish, with all of your favourite software!',1000,'5','microsoft-surface.jpg'),(14,'Apple','MacBook Air','The newest ultrathin laptop with 10 hour battery life.',1100,'4','microsoft-surface.jpg'),(15,'Apple','MacBook Pro','A powerful laptop for gaming, streaming, or programming',1200,'3','microsoft-surface.jpg');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-20 13:39:30
