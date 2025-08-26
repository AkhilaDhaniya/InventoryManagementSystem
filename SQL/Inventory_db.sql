-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: inventory_db
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `Productid` int NOT NULL,
  `ProductName` varchar(50) NOT NULL,
  `CostPrice` varchar(20) DEFAULT NULL,
  `SellingPrice` varchar(20) DEFAULT NULL,
  `Brand` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `quantity` varchar(30) DEFAULT NULL,
  `pid` int NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Productid`),
  UNIQUE KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (102,'Laptop','500.0','600.0','DELL','2024-04-13','50',1,1),(103,'Smart Watch','12000.0','13000.0','Samsung','2025-08-17','40',3,1),(112,'Mobile','400.0','550.0','Apple','2025-08-11','30',2,1),(142,'ThinkPad E14 Gen 5','52999.0','54999.0','Lenova','2025-08-22','40',4,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchaseinfo`
--

DROP TABLE IF EXISTS `purchaseinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchaseinfo` (
  `purchaseid` int NOT NULL AUTO_INCREMENT,
  `suppliercode` varchar(45) DEFAULT NULL,
  `productcode` int NOT NULL,
  `date` date DEFAULT NULL,
  `Quantity` int NOT NULL,
  `TotalCost` decimal(10,2) NOT NULL,
  PRIMARY KEY (`purchaseid`),
  KEY `productcode` (`productcode`),
  KEY `suppliercode` (`suppliercode`),
  CONSTRAINT `purchaseinfo_ibfk_1` FOREIGN KEY (`productcode`) REFERENCES `product` (`Productid`),
  CONSTRAINT `suppliercode` FOREIGN KEY (`suppliercode`) REFERENCES `supplierinfo` (`suppliercode`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchaseinfo`
--

LOCK TABLES `purchaseinfo` WRITE;
/*!40000 ALTER TABLE `purchaseinfo` DISABLE KEYS */;
INSERT INTO `purchaseinfo` VALUES (111,NULL,102,NULL,50,25000.00),(113,'sup1',112,'2025-08-19',10,4000.00),(114,'sup2',103,'2025-08-20',40,480000.00),(115,'sup1',142,'2025-08-22',40,2119960.00);
/*!40000 ALTER TABLE `purchaseinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesinfo`
--

DROP TABLE IF EXISTS `salesinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesinfo` (
  `salesid` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `productcode` varchar(45) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` double DEFAULT NULL,
  `revenue` double DEFAULT NULL,
  `soldby` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`salesid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesinfo`
--

LOCK TABLES `salesinfo` WRITE;
/*!40000 ALTER TABLE `salesinfo` DISABLE KEYS */;
INSERT INTO `salesinfo` VALUES (1,'2024-05-15','112',12,550,6600,'samy'),(2,'2025-08-16','102',10,600,6000,'samy'),(3,'2025-08-22','102',25,600,15000,'admin');
/*!40000 ALTER TABLE `salesinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stocks`
--

DROP TABLE IF EXISTS `stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stocks` (
  `productid` int NOT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`productid`),
  CONSTRAINT `stocks_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `product` (`Productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stocks`
--

LOCK TABLES `stocks` WRITE;
/*!40000 ALTER TABLE `stocks` DISABLE KEYS */;
INSERT INTO `stocks` VALUES (102,115),(103,80),(112,14),(142,40);
/*!40000 ALTER TABLE `stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplierinfo`
--

DROP TABLE IF EXISTS `supplierinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplierinfo` (
  `sid` int NOT NULL AUTO_INCREMENT,
  `suppliercode` varchar(45) NOT NULL,
  `fullname` varchar(45) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `contact` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`suppliercode`),
  UNIQUE KEY `sid` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplierinfo`
--

LOCK TABLES `supplierinfo` WRITE;
/*!40000 ALTER TABLE `supplierinfo` DISABLE KEYS */;
INSERT INTO `supplierinfo` VALUES (1,'sup1','DELL Inc.','Delhi','8891354641'),(2,'sup2','Samsung Appliances','Kochi','9778121228'),(3,'sup3','Apple Store','Chennai','9847277244'),(5,'sup4','Lenova Electronics','Ernakulam','8129933396');
/*!40000 ALTER TABLE `supplierinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `sid` int NOT NULL AUTO_INCREMENT,
  `suppliercode` varchar(45) NOT NULL,
  `fullname` varchar(45) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'1001','DELL Inc.','Chennai','8393452215');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userlogs`
--

DROP TABLE IF EXISTS `userlogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userlogs` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `in_time` datetime DEFAULT NULL,
  `out_time` datetime DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `username` (`username`),
  CONSTRAINT `userlogs_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userlogs`
--

LOCK TABLES `userlogs` WRITE;
/*!40000 ALTER TABLE `userlogs` DISABLE KEYS */;
INSERT INTO `userlogs` VALUES (1,'admin','2025-08-09 20:30:45',NULL),(2,'admin','2025-08-09 20:33:51',NULL),(3,'admin','2025-08-09 20:35:18',NULL),(4,'admin','2025-08-09 20:39:46',NULL),(5,'admin','2025-08-09 20:39:46','2025-08-09 20:39:55'),(6,'admin','2025-08-09 20:40:09',NULL),(7,'akira','2025-08-09 20:56:15',NULL),(8,'akira','2025-08-09 20:59:48',NULL),(9,'akira','2025-08-09 21:04:07',NULL),(10,'akira','2025-08-09 21:16:35',NULL),(11,'akira','2025-08-09 21:18:40',NULL),(12,'akira','2025-08-09 21:18:40','2025-08-09 21:18:45'),(13,'akira','2025-08-09 22:21:00',NULL),(14,'akira','2025-08-09 22:21:00','2025-08-09 22:21:11'),(15,'akira','2025-08-11 17:58:50',NULL),(16,'akira','2025-08-11 17:58:50','2025-08-11 17:59:19'),(17,'akira','2025-08-11 18:05:03',NULL),(18,'akira','2025-08-11 18:05:03','2025-08-11 18:06:02'),(19,'samy','2025-08-12 15:44:12',NULL),(20,'samy','2025-08-12 15:44:12','2025-08-12 15:47:26'),(21,'samy','2025-08-12 15:47:47',NULL),(22,'samy','2025-08-12 15:47:47','2025-08-12 15:53:11'),(23,'samy','2025-08-13 13:24:43',NULL),(24,'akira','2025-08-13 13:31:48',NULL),(25,'admin','2025-08-13 13:39:48',NULL),(26,'admin','2025-08-13 13:40:56',NULL),(27,'kai','2025-08-13 13:48:56',NULL),(28,'akira','2025-08-13 13:53:32',NULL),(29,'akira','2025-08-13 13:53:32','2025-08-13 13:53:59'),(30,'samy','2025-08-13 20:30:45',NULL),(31,'samy','2025-08-13 20:31:37',NULL),(32,'samy','2025-08-13 20:31:37','2025-08-13 20:37:25'),(33,'akira','2025-08-13 20:37:39',NULL),(34,'akira','2025-08-13 20:37:39','2025-08-13 20:38:31'),(35,'samy','2025-08-14 16:33:05',NULL),(36,'samy','2025-08-14 16:33:05','2025-08-14 16:33:27'),(37,'admin','2025-08-14 16:42:39',NULL),(38,'admin','2025-08-14 16:42:39','2025-08-14 17:13:19'),(39,'akira','2025-08-14 17:13:33',NULL),(40,'akira','2025-08-14 17:13:33','2025-08-14 17:19:20'),(41,'samy','2025-08-16 09:19:49',NULL),(42,'samy','2025-08-16 09:19:49','2025-08-16 09:19:58'),(43,'samy','2025-08-16 09:23:22',NULL),(44,'akira','2025-08-16 09:36:06',NULL),(45,'akira','2025-08-16 09:36:06','2025-08-16 12:31:05'),(46,'samy','2025-08-16 09:23:22','2025-08-16 12:31:12'),(47,'akira','2025-08-16 12:31:44',NULL),(48,'admin','2025-08-16 12:41:46',NULL),(49,'admin','2025-08-16 12:44:10',NULL),(50,'admin','2025-08-16 12:47:16',NULL),(51,'admin','2025-08-16 13:05:51',NULL),(52,'admin','2025-08-16 12:41:46','2025-08-16 13:27:13'),(53,'admin','2025-08-16 12:44:10','2025-08-16 13:27:17'),(54,'admin','2025-08-16 12:47:16','2025-08-16 13:27:20'),(55,'admin','2025-08-16 13:05:51','2025-08-16 13:27:22'),(56,'akira','2025-08-16 13:27:44',NULL),(57,'samy','2025-08-16 13:32:39',NULL),(58,'samy','2025-08-16 13:32:39','2025-08-16 13:37:38'),(59,'akira','2025-08-16 13:27:44','2025-08-16 13:37:46'),(60,'samy','2025-08-16 13:38:02',NULL),(61,'samy','2025-08-16 13:51:01',NULL),(62,'samy','2025-08-16 13:51:01','2025-08-16 13:51:12'),(63,'akira','2025-08-16 14:29:54',NULL),(64,'akira','2025-08-16 14:31:48',NULL),(65,'kai','2025-08-16 14:32:56',NULL),(66,'kai','2025-08-16 14:32:56','2025-08-16 14:33:07'),(67,'samy','2025-08-16 13:38:02','2025-08-16 14:33:13'),(68,'akira','2025-08-16 14:29:54','2025-08-16 14:33:15'),(69,'akira','2025-08-16 14:31:48','2025-08-16 14:33:17'),(70,'admin','2025-08-16 15:48:59',NULL),(71,'admin','2025-08-16 15:48:59','2025-08-16 15:50:14'),(72,'akira','2025-08-17 16:03:56',NULL),(73,'akira','2025-08-17 16:03:56','2025-08-17 16:05:02'),(74,'samy','2025-08-17 19:00:32',NULL),(75,'akira','2025-08-17 19:07:06',NULL),(76,'akira','2025-08-17 19:07:06','2025-08-17 19:07:21'),(77,'akira','2025-08-17 19:09:38',NULL),(78,'akira','2025-08-17 19:09:38','2025-08-17 19:09:58'),(79,'admin','2025-08-17 19:10:33',NULL),(80,'admin','2025-08-17 19:10:33','2025-08-17 19:10:48'),(81,'samy','2025-08-17 19:00:32','2025-08-17 19:11:01'),(82,'samy','2025-08-17 19:13:18',NULL),(83,'samy','2025-08-17 19:13:18','2025-08-17 19:18:56'),(84,'admin','2025-08-17 19:19:19',NULL),(85,'samy','2025-08-17 19:26:22',NULL),(86,'kai','2025-08-17 19:30:09',NULL),(87,'admin','2025-08-17 19:31:08',NULL),(88,'admin','2025-08-17 19:31:08','2025-08-17 19:31:21'),(89,'kai','2025-08-17 19:30:09','2025-08-17 19:32:20'),(90,'samy','2025-08-17 19:26:22','2025-08-17 19:32:22'),(91,'admin','2025-08-17 19:19:19','2025-08-17 19:32:23'),(92,'admin','2025-08-17 19:48:53',NULL),(93,'admin','2025-08-17 19:59:34',NULL),(94,'akira','2025-08-17 20:04:05',NULL),(95,'akira','2025-08-17 20:09:02',NULL),(96,'akira','2025-08-17 20:04:05','2025-08-17 20:30:02'),(97,'admin','2025-08-17 19:59:34','2025-08-17 20:30:04'),(98,'admin','2025-08-17 19:48:53','2025-08-17 20:30:06'),(99,'akira','2025-08-20 18:46:27',NULL),(100,'admin','2025-08-20 19:21:23',NULL),(101,'admin','2025-08-20 19:21:23','2025-08-20 19:23:39'),(102,'akira','2025-08-20 18:46:27','2025-08-20 19:23:43'),(103,'admin','2025-08-21 15:00:58',NULL),(104,'admin','2025-08-21 15:08:16',NULL),(105,'admin','2025-08-21 15:08:16','2025-08-21 15:08:45'),(106,'admin','2025-08-21 15:23:49',NULL),(107,'admin','2025-08-21 15:45:03',NULL),(108,'admin','2025-08-21 17:22:56',NULL),(109,'admin','2025-08-21 17:22:56','2025-08-21 20:28:12'),(110,'admin','2025-08-21 15:45:03','2025-08-21 20:28:16'),(111,'admin','2025-08-21 15:23:49','2025-08-21 20:28:19'),(112,'admin','2025-08-21 15:00:58','2025-08-21 20:28:22'),(113,'admin','2025-08-22 14:39:49',NULL),(114,'admin','2025-08-22 14:48:53',NULL),(115,'admin','2025-08-22 15:49:31',NULL),(116,'admin','2025-08-22 15:58:15',NULL),(117,'admin','2025-08-22 14:39:49','2025-08-22 16:08:22'),(118,'admin','2025-08-22 14:48:53','2025-08-22 16:08:24'),(119,'admin','2025-08-22 15:49:31','2025-08-22 16:08:26'),(120,'admin','2025-08-22 15:58:15','2025-08-22 16:08:28'),(121,'admin','2025-08-22 16:08:47',NULL),(122,'admin','2025-08-22 16:08:47','2025-08-22 16:09:17'),(123,'admin','2025-08-22 16:09:29',NULL),(124,'admin','2025-08-22 16:15:57',NULL),(125,'admin','2025-08-22 16:17:40',NULL),(126,'admin','2025-08-22 16:09:29','2025-08-22 16:18:53'),(127,'admin','2025-08-22 16:15:57','2025-08-22 16:18:56'),(128,'admin','2025-08-22 16:19:11',NULL),(129,'admin','2025-08-22 16:20:44',NULL),(130,'admin','2025-08-22 16:43:30',NULL),(131,'admin','2025-08-22 16:46:10',NULL),(132,'admin','2025-08-22 16:17:40','2025-08-22 23:50:10'),(133,'admin','2025-08-22 16:19:11','2025-08-22 23:50:12'),(134,'admin','2025-08-22 16:20:44','2025-08-22 23:50:14'),(135,'admin','2025-08-22 16:43:30','2025-08-22 23:50:17'),(136,'admin','2025-08-22 16:46:10','2025-08-22 23:50:22'),(137,'admin','2025-08-23 19:44:13',NULL),(138,'admin','2025-08-23 19:53:37',NULL),(139,'admin','2025-08-23 19:57:53',NULL),(140,'admin','2025-08-23 20:01:07',NULL),(141,'admin','2025-08-23 20:02:38',NULL),(142,'admin','2025-08-23 20:04:08',NULL),(143,'admin','2025-08-23 20:07:17',NULL),(144,'admin','2025-08-23 20:01:07','2025-08-23 20:08:23'),(145,'admin','2025-08-23 19:44:13','2025-08-23 20:08:27'),(146,'admin','2025-08-23 19:53:37','2025-08-23 20:08:29'),(147,'admin','2025-08-23 19:57:53','2025-08-23 20:08:31'),(148,'admin','2025-08-23 20:02:38','2025-08-23 20:08:32'),(149,'akira','2025-08-23 20:08:56',NULL),(150,'akira','2025-08-23 20:10:10',NULL),(151,'akira','2025-08-23 20:10:10','2025-08-23 20:10:33'),(152,'akira','2025-08-23 20:08:56','2025-08-23 20:10:38'),(153,'admin','2025-08-23 20:07:17','2025-08-23 20:10:46'),(154,'admin','2025-08-23 20:04:08','2025-08-23 20:10:55'),(155,'admin','2025-08-23 21:35:32',NULL),(156,'admin','2025-08-23 21:35:32','2025-08-23 21:36:00'),(157,'admin','2025-08-23 21:40:27',NULL),(158,'admin','2025-08-23 21:40:27','2025-08-23 23:09:27'),(159,'admin','2025-08-23 23:12:25',NULL),(160,'kai','2025-08-23 23:14:33',NULL),(161,'kai','2025-08-23 23:16:22',NULL),(162,'kai','2025-08-23 23:16:22','2025-08-23 23:16:32'),(163,'admin','2025-08-24 20:14:44',NULL),(164,'admin','2025-08-24 20:19:13',NULL),(165,'admin','2025-08-24 20:14:44','2025-08-24 20:19:40'),(166,'admin','2025-08-24 20:19:13','2025-08-24 20:40:38');
/*!40000 ALTER TABLE `userlogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Location` varchar(50) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `usertype` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Akhila','India','8199333211','admin','adm124','ADMINISTRATOR'),(2,'Ma Dong','Korea','819933396','akira','ak134','EMPLOYEE'),(3,'Sam','Local','819933396','samy','sam1','EMPLOYEE'),(4,'Rajan','Local','819933396','kai','temp123','EMPLOYEE'),(5,'Alan','Goa','7994412132','alan','alaaa','EMPLOYEE');
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

-- Dump completed on 2025-08-26 12:57:02
