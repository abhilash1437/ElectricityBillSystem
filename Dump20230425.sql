CREATE DATABASE  IF NOT EXISTS `electricity` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `electricity`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: electricity
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `AccountId` int NOT NULL,
  `CustId` int NOT NULL,
  `AccountNo` int NOT NULL,
  `ElectricityBoardId` varchar(100) NOT NULL,
  `Customer_CustId` int NOT NULL,
  PRIMARY KEY (`AccountId`),
  KEY `Account_Customer` (`Customer_CustId`),
  KEY `idx_account` (`AccountId`),
  CONSTRAINT `Account_Customer` FOREIGN KEY (`Customer_CustId`) REFERENCES `customer` (`CustId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (103,3412,10020103,'B11',3412),(104,5631,10020104,'B12',6513),(105,5631,10020105,'B13',5631);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `AdminId` int NOT NULL,
  `AdminName` varchar(100) NOT NULL,
  `LoginId` int NOT NULL,
  `Password` varchar(100) NOT NULL,
  `AdminType` varchar(100) NOT NULL,
  PRIMARY KEY (`AdminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (11,'Priya L',1,'Mango!123','Admin'),(22,'Gokul A',2,'Chevrolet#124','Employee'),(33,'Kaviya S',3,'Passwor)(*&','Admin');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billing`
--

DROP TABLE IF EXISTS `billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing` (
  `BillingId` int NOT NULL,
  `CustId` int NOT NULL,
  `AccountId` int NOT NULL,
  `PaymentMode` varchar(100) NOT NULL,
  `PaymentDate` datetime NOT NULL,
  `BillAmount` float NOT NULL,
  `PaidAmount` float NOT NULL,
  `ExcessPaid` float NOT NULL,
  `Customer_CustId` int NOT NULL,
  PRIMARY KEY (`BillingId`),
  KEY `Billing_Customer` (`Customer_CustId`),
  KEY `idx_billing` (`BillingId`),
  CONSTRAINT `Billing_Customer` FOREIGN KEY (`Customer_CustId`) REFERENCES `customer` (`CustId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing`
--

LOCK TABLES `billing` WRITE;
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
INSERT INTO `billing` VALUES (111,3412,103,'manual','2023-04-11 00:00:00',2700,3000,300,3412),(222,6513,104,'online','2023-04-11 00:00:00',565,600,35,6513),(333,5631,105,'Manual','2023-04-11 00:00:00',1500,1501,1,5631);
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CustId` int NOT NULL,
  `CustName` varchar(100) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `Email` varchar(100) NOT NULL,
  PRIMARY KEY (`CustId`),
  KEY `idx_customer` (`CustId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (3412,'Vishali T','07-Tirunelveli','Vishali.t@gmail.com'),(5631,'Charan K','06-trichy','Charan.K@gmail.com'),(6513,'Mohan K','08-vellore','Mohan.K@gmail.com');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `electricityboard`
--

DROP TABLE IF EXISTS `electricityboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `electricityboard` (
  `ElectricityBoardId` varchar(50) NOT NULL,
  `ElectricityBoardAddress` varchar(100) NOT NULL,
  `Account_AccountId` int NOT NULL,
  PRIMARY KEY (`ElectricityBoardId`),
  KEY `ElectricityBoard_Account` (`Account_AccountId`),
  CONSTRAINT `ElectricityBoard_Account` FOREIGN KEY (`Account_AccountId`) REFERENCES `account` (`AccountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `electricityboard`
--

LOCK TABLES `electricityboard` WRITE;
/*!40000 ALTER TABLE `electricityboard` DISABLE KEYS */;
INSERT INTO `electricityboard` VALUES ('B11','1/42,chennai',103),('B12','90,Coimabtore',104),('B13','34/5,chennai',105),('B14','45,chidambaram',103);
/*!40000 ALTER TABLE `electricityboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `FeedbackId` int NOT NULL,
  `CustId` int NOT NULL,
  `Feedback` varchar(200) NOT NULL,
  `Customer_CustId` int NOT NULL,
  PRIMARY KEY (`FeedbackId`),
  KEY `FeedBack_Customer` (`Customer_CustId`),
  CONSTRAINT `FeedBack_Customer` FOREIGN KEY (`Customer_CustId`) REFERENCES `customer` (`CustId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,3412,'Good',3412),(2,6513,'Need Better Service',6513),(3,5631,'Satisfied',5631);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `InvoiceId` varchar(50) NOT NULL,
  `ElectricityBoardID` varchar(50) NOT NULL,
  `AccountID` int NOT NULL,
  `CustID` int NOT NULL,
  `ElectricityBoard_ElectricityBoardId` varchar(50) NOT NULL,
  `TariffId` varchar(100) NOT NULL,
  `Tariff_TariffId` varchar(100) NOT NULL,
  PRIMARY KEY (`InvoiceId`),
  KEY `Invoice_ElectricityBoard` (`ElectricityBoard_ElectricityBoardId`),
  KEY `Invoice_Tariff` (`Tariff_TariffId`),
  CONSTRAINT `Invoice_ElectricityBoard` FOREIGN KEY (`ElectricityBoard_ElectricityBoardId`) REFERENCES `electricityboard` (`ElectricityBoardId`),
  CONSTRAINT `Invoice_Tariff` FOREIGN KEY (`Tariff_TariffId`) REFERENCES `tariff` (`TariffId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES ('IV-1','B11',103,3412,'B11','TID-1','TID-1'),('IV-2','B12',104,6513,'B12','TID-2','TID-2');
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tariff`
--

DROP TABLE IF EXISTS `tariff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tariff` (
  `TariffId` varchar(100) NOT NULL,
  `TariffType` varchar(100) NOT NULL,
  `TariffDescription` varchar(200) NOT NULL,
  PRIMARY KEY (`TariffId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tariff`
--

LOCK TABLES `tariff` WRITE;
/*!40000 ALTER TABLE `tariff` DISABLE KEYS */;
INSERT INTO `tariff` VALUES ('TID-1','Simple Tariff','fixed rate is applied.'),('TID-2','Flat Rate Tariff','different types of consumers are charged at different rates of cost per unit.'),('TID-3','Block Rate Tariff','charged per block. rate per unit in each block is fixed.'),('TID-4','Mixed Rate tariff','This is a combination of different tariffs');
/*!40000 ALTER TABLE `tariff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_admin`
--

DROP TABLE IF EXISTS `view_admin`;
/*!50001 DROP VIEW IF EXISTS `view_admin`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_admin` AS SELECT 
 1 AS `AdminId`,
 1 AS `AdminName`,
 1 AS `LoginId`,
 1 AS `AdminType`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_feedback`
--

DROP TABLE IF EXISTS `view_feedback`;
/*!50001 DROP VIEW IF EXISTS `view_feedback`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_feedback` AS SELECT 
 1 AS `FeedbackId`,
 1 AS `CustId`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_admin`
--

/*!50001 DROP VIEW IF EXISTS `view_admin`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_admin` AS select `admin`.`AdminId` AS `AdminId`,`admin`.`AdminName` AS `AdminName`,`admin`.`LoginId` AS `LoginId`,`admin`.`AdminType` AS `AdminType` from `admin` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_feedback`
--

/*!50001 DROP VIEW IF EXISTS `view_feedback`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_feedback` AS select `feedback`.`FeedbackId` AS `FeedbackId`,`feedback`.`CustId` AS `CustId` from `feedback` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-25 13:16:08
