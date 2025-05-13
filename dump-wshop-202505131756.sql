-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: dump
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `cache`
--
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dump` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `dump`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `cache_id` int NOT NULL AUTO_INCREMENT,
  `cache_con` text,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`cache_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES (7,'[{\"detail_id\":0,\"goods_id\":1,\"goods_name\":\"好用的眼部护理1\",\"goods_price\":80.0,\"goods_count\":1,\"goods_money\":80.0,\"goods_pic\":\"1.jpg\",\"user_id\":0,\"goods_count_real\":0,\"totalSales\":0,\"start\":0,\"limit\":20,\"end\":0}]',12);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collect`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collect` (
  `collect_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `goods_id` int DEFAULT NULL,
  `collect_date` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`collect_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collect`
--

LOCK TABLES `collect` WRITE;
/*!40000 ALTER TABLE `collect` DISABLE KEYS */;
INSERT INTO `collect` VALUES (1,4,2,'2024-02-10 00:23:13'),(2,4,4,'2024-02-10 00:23:16'),(3,4,1,'2023-12-20 14:32:05'),(4,12,3,'2025-05-11 23:27:28');
/*!40000 ALTER TABLE `collect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config` (
  `config_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `config_value1` double(22,2) DEFAULT NULL,
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (4,4,500.00),(5,5,500.00),(6,6,500.00),(7,7,500.00),(8,8,500.00),(9,9,500.00),(10,10,500.00),(11,11,500.00);
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluate`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluate` (
  `evaluate_id` int NOT NULL AUTO_INCREMENT,
  `orders_no` varchar(50) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `nick_name` varchar(50) DEFAULT NULL,
  `goods_id` int DEFAULT NULL,
  `evaluate_date` varchar(50) DEFAULT NULL,
  `evaluate_level` int DEFAULT '5' COMMENT '1:失望 2:不满 3:一般 4:满意 5:惊喜',
  `evaluate_content` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`evaluate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluate`
--

LOCK TABLES `evaluate` WRITE;
/*!40000 ALTER TABLE `evaluate` DISABLE KEYS */;
INSERT INTO `evaluate` VALUES (1,'201703251543324',4,'test',1,'2023-11-26 23:48:17',5,'非常完美！！'),(2,'201703251543324',4,'test',2,'2023-11-26 23:48:17',5,'非常完美！！');
/*!40000 ALTER TABLE `evaluate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods` (
  `goods_id` int NOT NULL AUTO_INCREMENT,
  `goods_type_id` int DEFAULT '0',
  `goods_name` varchar(225) DEFAULT NULL,
  `goods_pic` varchar(225) DEFAULT NULL,
  `goods_price1` double DEFAULT '0',
  `goods_price2` double DEFAULT NULL,
  `goods_count` int DEFAULT NULL,
  `goods_date` varchar(50) DEFAULT NULL,
  `goods_desc` text,
  `goods_flag` int DEFAULT '1' COMMENT '1：正常 2：促销',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (1,1,'好用的眼部护理1','1.jpg',88,80,97,'2023-12-05 17:47:22','好用的眼部护理1好用的眼部护理1好用的眼部护理1',2),(2,2,'好用的乳液面霜1','2.jpg',66,66,51,'2023-11-23 17:47:22','好用的乳液面霜1好用的乳液面霜1好用的乳液面霜1',1),(3,3,'好用的迷迭香水1','3.jpg',88,82,98,'2023-11-23 17:47:22','好用的迷迭香水1好用的迷迭香水1好用的迷迭香水1',2),(4,4,'好用的清洁毛孔1','4.jpg',99,99,100,'2023-11-23 17:47:22','好用的清洁毛孔1好用的清洁毛孔1好用的清洁毛孔1',1),(5,5,'好用的精油护理1','5.jpg',74.5,68,99,'2023-11-23 17:47:22','好用的精油护理1好用的精油护理1好用的精油护理1',2),(6,6,'好用的粉底眼线1','6.jpg',88,88,100,'2023-11-23 17:47:22','好用的粉底眼线1好用的粉底眼线1好用的粉底眼线1',1),(7,7,'好用的假发美发1','7.jpg',88,85,98,'2023-11-23 17:47:22','好用的假发美发1好用的假发美发1好用的假发美发1',2),(8,1,'好用的眼部护理2','1.jpg',66,66,100,'2023-11-23 17:47:22','好用的眼部护理2好用的眼部护理2好用的眼部护理2',1),(9,2,'好用的乳液面霜2','2.jpg',88,75,100,'2023-11-23 17:47:22','好用的乳液面霜2好用的乳液面霜2好用的乳液面霜2',2),(10,3,'好用的迷迭香水2','3.jpg',99,99,100,'2023-11-23 17:47:22','好用的迷迭香水2好用的迷迭香水2好用的迷迭香水2',1),(11,4,'好用的清洁毛孔2','4.jpg',74.5,65,100,'2023-11-23 17:47:22','好用的清洁毛孔2好用的清洁毛孔2好用的清洁毛孔2',2),(12,5,'好用的精油护理2','5.jpg',88,88,100,'2023-11-23 17:47:22','好用的精油护理2好用的精油护理2好用的精油护理2',1),(13,6,'好用的粉底眼线2','6.jpg',88,88,100,'2023-11-23 17:47:22','好用的粉底眼线2好用的粉底眼线2好用的粉底眼线2',1),(14,10,'草莓','20250511214734567.jpg',18,15,999,'2025-05-11','美味的草莓',2),(15,10,'西柚','20250511214752015.jpg',25,25,1000,'2025-05-11','美味的西柚',1),(16,10,'橙子','20250511230621716.jpg',5,4,9999,'2025-05-11','美味的橙子',2),(17,10,'西梅','20250511230650193.jpg',55,50,9999,'2025-05-11','美味的西梅',2),(18,10,'柿子','20250511230728364.jpg',13,10,553,'2025-05-11','美味的柿子',2),(19,10,'车厘子','20250511230745038.jpg',55,50,9999,'2025-05-11','&lt;p&gt;\r\n	美味的车厘子\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;',2),(20,10,'西红柿','20250511233930261.jpg',15,12,999,'2025-05-11','美味的柿子',2);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_type` (
  `goods_type_id` int NOT NULL AUTO_INCREMENT,
  `goods_type_name` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`goods_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_type`
--

LOCK TABLES `goods_type` WRITE;
/*!40000 ALTER TABLE `goods_type` DISABLE KEYS */;
INSERT INTO `goods_type` VALUES (1,'眼部护理'),(2,'乳液面霜'),(3,'迷迭香水'),(4,'清洁毛孔'),(5,'精油护理'),(6,'粉底眼线'),(7,'假发美发'),(8,'电子产品'),(9,'家居生活'),(10,'食品健康');
/*!40000 ALTER TABLE `goods_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `info` (
  `info_id` int NOT NULL AUTO_INCREMENT,
  `info_title` varchar(225) DEFAULT NULL,
  `info_content` text,
  `info_admin` varchar(50) DEFAULT NULL,
  `info_date` varchar(50) DEFAULT NULL,
  `info_file` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES (1,'最新化妆品特卖网站之新闻资讯1','&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯','张丽','2023-12-06 23:35:26',NULL),(2,'最新化妆品特卖网站之新闻资讯2','&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯','张丽','2023-12-06 23:35:26',NULL),(3,'最新化妆品特卖网站之新闻资讯3','&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯','张丽','2023-12-06 23:35:26',NULL),(4,'最新化妆品特卖网站之新闻资讯4','&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯','张丽','2023-12-06 23:35:26',NULL),(5,'最新化妆品特卖网站之新闻资讯5','&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯','张丽','2023-12-06 23:35:26',NULL),(6,'最新化妆品特卖网站之新闻资讯6','&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯','张丽','2023-12-06 23:35:26',NULL),(7,'最新化妆品特卖网站之新闻资讯7','&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯','张丽','2023-12-06 23:35:26',NULL),(8,'最新化妆品特卖网站之新闻资讯8','&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯最新化妆品特卖网站之新闻资讯','张丽','2023-12-06 23:35:26',NULL);
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member2`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member2` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `user_pass` varchar(200) DEFAULT NULL,
  `real_name` varchar(50) DEFAULT NULL,
  `nick_name` varchar(50) DEFAULT NULL,
  `user_sex` int DEFAULT '0' COMMENT '1：男 0：女',
  `user_address` varchar(300) DEFAULT NULL,
  `user_mail` varchar(50) DEFAULT NULL,
  `user_phone` varchar(50) DEFAULT NULL,
  `user_credit` int DEFAULT NULL,
  `member_type_id` int DEFAULT NULL,
  `reg_date` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member2`
--

LOCK TABLES `member2` WRITE;
/*!40000 ALTER TABLE `member2` DISABLE KEYS */;
INSERT INTO `member2` VALUES (4,'test','96e79218965eb72c92a549dd5a330112','陈生','陈生生',2,'北京天堂路666号','chensheng@163.com','15088888884',707,2,'2023-10-23 23:08:44'),(5,'lichao','96e79218965eb72c92a549dd5a330112','李超','李超超',1,'天津天堂路666号','lichao@163.com','15088888887',120,1,'2023-10-23 23:08:44'),(6,'zhangbin','96e79218965eb72c92a549dd5a330112','张斌','张斌斌',1,'上海天堂路666号','zhangbin@163.com','15088888882',120,1,'2023-10-23 23:08:44'),(7,'zhaohui','96e79218965eb72c92a549dd5a330112','赵辉','赵辉辉',1,'河北天堂路666号','zhaohui@163.com','15088888881',800,2,'2023-10-23 23:08:44'),(8,'zhangweiming','96e79218965eb72c92a549dd5a330112','张伟明','小小明',1,'世纪天堂路666号','zhangweiming@163.com','15088888888',2450,3,'2023-10-23 23:08:44'),(9,'likunlun','96e79218965eb72c92a549dd5a330112','李昆仑','李昆仑',1,'河南天堂路666号','likunlun@163.com','15088888888',2600,3,'2023-10-23 23:08:44'),(10,'lijing','96e79218965eb72c92a549dd5a330112','李静','李静静',2,'湖南天堂路666号','lijing@163.com','15088888886',820,2,'2023-10-23 23:08:44'),(11,'zhangyongle','96e79218965eb72c92a549dd5a330112','张勇乐','张勇勇',1,'湖北天堂路666号','zhangyongle@163.com','15088888887',180,1,'2023-10-23 23:08:44'),(12,'laoliu','96e79218965eb72c92a549dd5a330112','朱浩轩','tunana',1,'华南理工大大学','3586195160@qq.com','13602719980',0,1,'2025-05-11 23:14:39');
/*!40000 ALTER TABLE `member2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_type` (
  `member_type_id` int NOT NULL AUTO_INCREMENT,
  `member_type_name` varchar(225) DEFAULT NULL,
  `credit_start` int DEFAULT NULL,
  `credit_end` int DEFAULT NULL,
  `member_discard` double DEFAULT NULL,
  PRIMARY KEY (`member_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_type`
--

LOCK TABLES `member_type` WRITE;
/*!40000 ALTER TABLE `member_type` DISABLE KEYS */;
INSERT INTO `member_type` VALUES (1,'铜牌会员',0,500,1),(2,'银牌会员',501,2000,0.95),(3,'金牌会员',2001,5000,0.85),(4,'钻石会员',5001,20000,0.8);
/*!40000 ALTER TABLE `member_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orders_id` int NOT NULL AUTO_INCREMENT,
  `orders_no` varchar(50) DEFAULT NULL,
  `orders_date` varchar(50) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `real_name` varchar(50) DEFAULT NULL,
  `user_address` varchar(300) DEFAULT NULL,
  `user_phone` varchar(50) DEFAULT NULL,
  `orders_money` double DEFAULT NULL,
  `user_discard` double DEFAULT NULL,
  `real_money` double DEFAULT NULL,
  `orders_flag` int DEFAULT '1' COMMENT '1:待收货 2:已发货 3:已收货',
  PRIMARY KEY (`orders_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'201703251543324','2024-02-10',4,'陈生','北京天堂路666号','15088888884',212,0.95,201.4,4),(2,'201904182238264','2023-11-18',4,'陈生','北京天堂路666号','15088888884',242,0.95,229.9,2),(3,'202505111538174','2025-05-11',4,'陈生','北京天堂路666号','15088888884',82,0.95,77.9,1),(4,'202505112024514','2025-05-11',4,'陈生','北京天堂路666号','15088888884',82,0.95,77.9,1),(5,'202505112308434','2025-05-11',4,'陈生','北京天堂路666号','15088888884',10,0.95,9.5,1),(6,'2025051123192512','2025-05-11',12,'朱浩轩','华南理工大大学','13602719980',10,1,10,1),(7,'202505131551294','2025-05-13',4,'陈生','北京天堂路666号','15088888884',66,0.95,62.7,1),(8,'202505121552054','2025-05-12',4,'陈生','北京天堂路666号','15088888884',66,0.95,62.7,1),(9,'202505121552294','2025-05-12',4,'陈生','北京天堂路666号','15088888884',264,0.95,250.8,1),(10,'202505121552574','2025-05-12',4,'陈生','北京天堂路666号','15088888884',660,0.95,627,1),(11,'202505101553254','2025-05-10',4,'陈生','北京天堂路666号','15088888884',660,0.95,627,1),(12,'202505111553384','2025-05-11',4,'陈生','北京天堂路666号','15088888884',660,0.95,627,1),(13,'202505101556575','2025-05-10',5,'李超','天津天堂路666号','15088888887',330,1,330,1),(14,'202505111557145','2025-05-11',5,'李超','天津天堂路666号','15088888887',198,1,198,1),(15,'202505121557285','2025-05-12',5,'李超','天津天堂路666号','15088888887',132,1,132,1),(16,'202505131557525','2025-05-13',5,'李超','天津天堂路666号','15088888887',66,1,66,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_detail`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_detail` (
  `detail_id` int NOT NULL AUTO_INCREMENT,
  `orders_no` varchar(50) DEFAULT NULL,
  `goods_id` int DEFAULT '0',
  `goods_name` varchar(225) DEFAULT NULL,
  `goods_price` double DEFAULT NULL,
  `goods_count` int DEFAULT '1',
  `goods_money` double DEFAULT NULL,
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_detail`
--

LOCK TABLES `orders_detail` WRITE;
/*!40000 ALTER TABLE `orders_detail` DISABLE KEYS */;
INSERT INTO `orders_detail` VALUES (1,'201703251543324',1,'好用的眼部护理1',80,1,80),(2,'201703251543324',2,'好用的乳液面霜1',66,2,132),(3,'201904182238264',1,'好用的眼部护理1',80,2,160),(4,'201904182238264',3,'好用的迷迭香水1',82,1,82),(5,'202505111538174',3,'好用的迷迭香水1',82,1,82),(6,'202505112024514',3,'好用的迷迭香水1',82,1,82),(7,'202505112308434',18,'柿子',10,1,10),(8,'2025051123192512',18,'柿子',10,1,10),(9,'202505131551294',2,'好用的乳液面霜1',66,1,66),(10,'202505121552054',2,'好用的乳液面霜1',66,1,66),(11,'202505121552294',2,'好用的乳液面霜1',66,4,264),(12,'202505121552574',2,'好用的乳液面霜1',66,10,660),(13,'202505101553254',2,'好用的乳液面霜1',66,10,660),(14,'202505111553384',2,'好用的乳液面霜1',66,10,660),(15,'202505101556575',2,'好用的乳液面霜1',66,5,330),(16,'202505111557145',2,'好用的乳液面霜1',66,3,198),(17,'202505121557285',2,'好用的乳液面霜1',66,2,132),(18,'202505131557525',2,'好用的乳液面霜1',66,1,66);
/*!40000 ALTER TABLE `orders_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sblog`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sblog` (
  `sblog_id` int NOT NULL AUTO_INCREMENT,
  `goods_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `sblog_content` text,
  `sblog_date` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sblog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sblog`
--

LOCK TABLES `sblog` WRITE;
/*!40000 ALTER TABLE `sblog` DISABLE KEYS */;
INSERT INTO `sblog` VALUES (1,1,4,'请问商城么时候搞活动啊，我来捧场！请问商城么时候搞活动啊，我来捧场！','2024-02-10 16:02:45'),(2,1,6,'请问商城什么时候搞活动价格优惠吗，我来购买很多。请问商城什么时候搞活动价格优惠吗，我来购买很多','2024-02-10 16:18:52'),(3,1,5,'我给你捧场来了！我给你捧场来了！我给你捧场来了！','2024-02-10 00:14:02'),(6,18,12,'好吃','2025-05-11 23:27:58');
/*!40000 ALTER TABLE `sblog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sblog_reply`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sblog_reply` (
  `sblog_reply_id` int NOT NULL AUTO_INCREMENT,
  `sblog_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `reply_content` text,
  `reply_date` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sblog_reply_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sblog_reply`
--

LOCK TABLES `sblog_reply` WRITE;
/*!40000 ALTER TABLE `sblog_reply` DISABLE KEYS */;
INSERT INTO `sblog_reply` VALUES (1,1,0,'十分感谢啊！','2024-02-10 16:17:46'),(2,2,0,'十分感谢啊您的捧场啊！','2024-02-10 00:01:23'),(3,3,4,'大家都来使用吧','2023-12-20 14:21:56');
/*!40000 ALTER TABLE `sblog_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `user_pass` varchar(200) DEFAULT NULL,
  `real_name` varchar(50) DEFAULT NULL,
  `user_sex` int DEFAULT '0' COMMENT '1：男 0：女',
  `user_mail` varchar(50) DEFAULT NULL,
  `user_phone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','96e79218965eb72c92a549dd5a330112','张丽',1,'admin@163.com','15088888883');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_login_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_login_log` (
  `log_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int NOT NULL COMMENT '关联用户ID（对应 member.user_id）',
  `login_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登录时间',
  `logout_time` datetime DEFAULT NULL COMMENT '退出时间',
  `duration` int unsigned DEFAULT NULL COMMENT '持续时间（秒）',
  `ip_address` varchar(45) NOT NULL COMMENT '登录IP地址（IPv4/IPv6兼容）',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '登录状态:1成功,2失败,3超时,4登出',
  PRIMARY KEY (`log_id`),
  KEY `idx_user_time` (`user_id`,`login_time`),
  KEY `idx_ip_status` (`ip_address`,`status`),
  CONSTRAINT `user_login_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `member2` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户登录日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_login_log`
--

LOCK TABLES `user_login_log` WRITE;
/*!40000 ALTER TABLE `user_login_log` DISABLE KEYS */;
INSERT INTO `user_login_log` VALUES (1,4,'2025-05-11 03:30:04','2025-05-11 03:30:19',14,'0:0:0:0:0:0:0:1',4),(2,4,'2025-05-11 05:16:58','2025-05-11 05:18:36',97,'0:0:0:0:0:0:0:1',4),(3,4,'2025-05-11 05:40:56','2025-05-11 05:43:43',167,'0:0:0:0:0:0:0:1',4),(4,5,'2025-05-11 05:58:48','2025-05-11 06:02:44',236,'0:0:0:0:0:0:0:1',4),(23,6,'2025-05-11 06:03:52','2025-05-11 06:24:27',1234,'0:0:0:0:0:0:0:1',4),(24,4,'2025-05-11 07:38:09','2025-05-11 12:21:19',16989,'0:0:0:0:0:0:0:1',4),(81,4,'2025-05-11 12:21:14','2025-05-11 12:21:19',4,'0:0:0:0:0:0:0:1',4),(88,4,'2025-05-11 12:24:20','2025-05-11 12:36:40',739,'0:0:0:0:0:0:0:1',4),(155,4,'2025-05-11 15:08:35','2025-05-11 15:08:48',12,'0:0:0:0:0:0:0:1',4),(156,12,'2025-05-11 15:15:03','2025-05-11 15:35:03',1199,'0:0:0:0:0:0:0:1',4),(157,4,'2025-05-13 07:51:10','2025-05-13 07:55:24',253,'0:0:0:0:0:0:0:1',4),(158,5,'2025-05-13 07:55:43','2025-05-13 07:57:55',132,'0:0:0:0:0:0:0:1',4);
/*!40000 ALTER TABLE `user_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uview`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uview` (
  `uview_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `goods_id` int DEFAULT NULL,
  `uview_date` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`uview_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uview`
--

LOCK TABLES `uview` WRITE;
/*!40000 ALTER TABLE `uview` DISABLE KEYS */;
INSERT INTO `uview` VALUES (1,4,1,'2023-11-12 08:59:25'),(2,4,4,'2023-11-12 09:03:01'),(3,4,2,'2023-12-20 14:44:08'),(4,4,3,'2025-05-11 15:38:12'),(5,4,18,'2025-05-11 23:08:39'),(6,12,3,'2025-05-11 23:17:34'),(7,12,18,'2025-05-11 23:18:45'),(8,12,1,'2025-05-11 23:26:03'),(9,5,2,'2025-05-13 15:56:43');
/*!40000 ALTER TABLE `uview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'wshop'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-13 17:56:21
