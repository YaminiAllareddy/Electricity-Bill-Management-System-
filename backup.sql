-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: BillManagementSystem
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `Bill_id` int(11) NOT NULL,
  `Bill_issued_Date` date NOT NULL,
  `Bill_due_date` date NOT NULL,
  `Total_amount` decimal(6,2) NOT NULL,
  `Consumer_number` int(11) NOT NULL,
  `Reading_id` int(11) NOT NULL,
  `Tariff_id` int(11) NOT NULL,
  PRIMARY KEY (`Bill_id`),
  KEY `Bill_Consumer` (`Consumer_number`),
  KEY `Bill_Readings` (`Reading_id`),
  KEY `Bill_Tariff` (`Tariff_id`),
  CONSTRAINT `Bill_Consumer` FOREIGN KEY (`Consumer_number`) REFERENCES `consumer` (`Consumer_number`),
  CONSTRAINT `Bill_Readings` FOREIGN KEY (`Reading_id`) REFERENCES `readings` (`Reading_id`),
  CONSTRAINT `Bill_Tariff` FOREIGN KEY (`Tariff_id`) REFERENCES `tariff` (`Tariff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (1,'2023-09-26','2023-10-20',762.00,65661993,754,2),(2,'2023-05-23','2023-06-15',458.00,66630947,321,1),(3,'2023-10-31','2023-11-15',599.00,43242376,592,4),(4,'2023-08-30','2023-09-19',637.00,50261572,754,3),(5,'2024-03-01','2024-01-14',514.00,1051785,592,2);
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consumer`
--

DROP TABLE IF EXISTS `consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consumer` (
  `Consumer_number` int(11) NOT NULL,
  `Full_name` varchar(20) NOT NULL,
  `Address` varchar(30) NOT NULL,
  `Phone_number` varchar(15) NOT NULL,
  `Electricity_name` varchar(30) NOT NULL,
  PRIMARY KEY (`Consumer_number`),
  KEY `Consumer_Electricity_company` (`Electricity_name`),
  KEY `Consumer_Phone_idx` (`Phone_number`),
  CONSTRAINT `Consumer_Electricity_company` FOREIGN KEY (`Electricity_name`) REFERENCES `electricity_company` (`Electricity_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumer`
--

LOCK TABLES `consumer` WRITE;
/*!40000 ALTER TABLE `consumer` DISABLE KEYS */;
INSERT INTO `consumer` VALUES (1051785,'Alana Meyer ','74388 Furman Port Apt. 622','2258373626','Beyond Power'),(43242376,'Wade Gill','14767 Armando Avenue Apt.','17653489375','AEP Energy'),(50261572,'Ivy Newman','18826 Kuphal Islands Apt.','2737390902','AEP Energy'),(65661993,'Ian Briggs','5738 Jamie Turnpike Apt.','5838241446','Southern California'),(66630947,'Natalia Morales','896 Liliane Parkways Suite 012','4342293722','Southern California');
/*!40000 ALTER TABLE `consumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `consumerelectricitydetails`
--

DROP TABLE IF EXISTS `consumerelectricitydetails`;
/*!50001 DROP VIEW IF EXISTS `consumerelectricitydetails`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `consumerelectricitydetails` AS SELECT 
 1 AS `Electricity_name`,
 1 AS `Full_name`,
 1 AS `Company Phone`,
 1 AS `Consumer Phone`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `electricity_company`
--

DROP TABLE IF EXISTS `electricity_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `electricity_company` (
  `Electricity_name` varchar(30) NOT NULL,
  `Address` varchar(40) DEFAULT NULL,
  `Phone_number` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Electricity_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `electricity_company`
--

LOCK TABLES `electricity_company` WRITE;
/*!40000 ALTER TABLE `electricity_company` DISABLE KEYS */;
INSERT INTO `electricity_company` VALUES ('AEP Energy','9118 Jerde Branch Suite 617 Raphaelle','95858867167'),('Beyond Power','328 Efrain Park Denesikville','8026011144'),('Southern California','592 Orrin Court Lake Skyechester','7455068159');
/*!40000 ALTER TABLE `electricity_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `Notification_id` int(11) NOT NULL,
  `Message` varchar(50) NOT NULL,
  `Total_amount` int(11) NOT NULL,
  `Due_date` date NOT NULL,
  `Consumer_number` int(11) NOT NULL,
  PRIMARY KEY (`Notification_id`),
  KEY `Notification_Consumer` (`Consumer_number`),
  CONSTRAINT `Notification_Consumer` FOREIGN KEY (`Consumer_number`) REFERENCES `consumer` (`Consumer_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,'Electricity bill is available',458,'2023-06-15',66630947),(2,'Electricity bill due date is on 20-10-2023',762,'2023-10-20',65661993),(3,'The electricity bill is added to your account',514,'2024-01-14',1051785);
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `Payment_id` int(11) NOT NULL,
  `Payment_date` date NOT NULL,
  `Amount_paid` decimal(6,2) NOT NULL,
  `Payment_type` varchar(20) NOT NULL,
  `Payment_status` varchar(25) NOT NULL,
  `Consumer_number` int(11) NOT NULL,
  `Bill_id` int(11) NOT NULL,
  PRIMARY KEY (`Payment_id`),
  KEY `Payment_Bill` (`Bill_id`),
  KEY `Payment_Consumer` (`Consumer_number`),
  KEY `Payment_type_idx` (`Payment_type`),
  CONSTRAINT `Payment_Bill` FOREIGN KEY (`Bill_id`) REFERENCES `bill` (`Bill_id`),
  CONSTRAINT `Payment_Consumer` FOREIGN KEY (`Consumer_number`) REFERENCES `consumer` (`Consumer_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'2023-06-15',458.00,'Card','Paid',66630947,2),(2,'2023-11-10',762.00,'UPI','Payment successful',65661993,1),(3,'2024-01-14',514.00,'Cash','Paid',1051785,5),(4,'2023-11-12',599.00,'Card','Paid',43242376,3),(5,'2023-10-09',637.00,'UPI','Payment done',50261572,4);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `readings`
--

DROP TABLE IF EXISTS `readings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `readings` (
  `Reading_id` int(11) NOT NULL,
  `Reading_date` date NOT NULL,
  `Reading_value` varchar(20) NOT NULL,
  `Meter_type` varchar(20) NOT NULL,
  `Consumer_number` int(11) NOT NULL,
  PRIMARY KEY (`Reading_id`),
  KEY `Readings_Consumer` (`Consumer_number`),
  KEY `Meter_Reading_idx` (`Meter_type`),
  CONSTRAINT `Readings_Consumer` FOREIGN KEY (`Consumer_number`) REFERENCES `consumer` (`Consumer_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `readings`
--

LOCK TABLES `readings` WRITE;
/*!40000 ALTER TABLE `readings` DISABLE KEYS */;
INSERT INTO `readings` VALUES (321,'2025-01-24','674.40 kWh','Prepaid Meter',66630947),(322,'2025-02-24','300 kWh','Prepaid Meter',1051785),(356,'2017-10-23','429.15 kWh','Digital Meter',43242376),(592,'2012-05-23','773.6 kWh','Analog Meter',65661993),(651,'0006-01-24','784.00 kWh','Digital Meter',1051785),(754,'2012-02-23','933.29 kWh','Smart Meter',66630947);
/*!40000 ALTER TABLE `readings` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Usage_history_update` AFTER INSERT ON `readings` FOR EACH ROW BEGIN 
	DECLARE Sum_of_consumption decimal(7,2);

	SELECT SUM(Reading_value) INTO Sum_of_consumption
	FROM Readings
	WHERE Consumer_number = NEW.Consumer_number;
	
	INSERT INTO Usage_history(Total_comsumption, Consumer_number, Reading_id)
	VALUES(Sum_of_consumption, NEW.Consumer_number, NEW.Reading_id);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tariff`
--

DROP TABLE IF EXISTS `tariff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tariff` (
  `Tariff_id` int(11) NOT NULL,
  `Traiff_type` varchar(30) NOT NULL,
  `Unit_rate` decimal(6,2) NOT NULL,
  PRIMARY KEY (`Tariff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tariff`
--

LOCK TABLES `tariff` WRITE;
/*!40000 ALTER TABLE `tariff` DISABLE KEYS */;
INSERT INTO `tariff` VALUES (1,'Specific tariffs',26.00),(2,'Ad valorem tariffs',38.00),(3,'Flat rate tariff',42.00),(4,'Block rate tariff',30.00),(5,'Revenue Tariff',35.00),(6,'Commercial tariff',38.00);
/*!40000 ALTER TABLE `tariff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usage_history`
--

DROP TABLE IF EXISTS `usage_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usage_history` (
  `Usage_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `Total_comsumption` varchar(20) NOT NULL,
  `Consumer_number` int(11) NOT NULL,
  `Reading_id` int(11) NOT NULL,
  PRIMARY KEY (`Usage_history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usage_history`
--

LOCK TABLES `usage_history` WRITE;
/*!40000 ALTER TABLE `usage_history` DISABLE KEYS */;
INSERT INTO `usage_history` VALUES (1,'879',50261572,651),(2,'820',66630947,321),(3,'341',1051785,651),(4,'903',65661993,356),(5,'1084.00',1051785,322);
/*!40000 ALTER TABLE `usage_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `usagehistoryreadings`
--

DROP TABLE IF EXISTS `usagehistoryreadings`;
/*!50001 DROP VIEW IF EXISTS `usagehistoryreadings`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `usagehistoryreadings` AS SELECT 
 1 AS `Consumer_number`,
 1 AS `Reading_value`,
 1 AS `Reading_date`,
 1 AS `Meter_type`,
 1 AS `Total_comsumption`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `consumerelectricitydetails`
--

/*!50001 DROP VIEW IF EXISTS `consumerelectricitydetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `consumerelectricitydetails` AS select `ec`.`Electricity_name` AS `Electricity_name`,`c`.`Full_name` AS `Full_name`,`ec`.`Phone_number` AS `Company Phone`,`c`.`Phone_number` AS `Consumer Phone` from (`electricity_company` `ec` join `consumer` `c` on((`ec`.`Electricity_name` = `c`.`Electricity_name`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `usagehistoryreadings`
--

/*!50001 DROP VIEW IF EXISTS `usagehistoryreadings`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `usagehistoryreadings` AS select `h`.`Consumer_number` AS `Consumer_number`,`r`.`Reading_value` AS `Reading_value`,`r`.`Reading_date` AS `Reading_date`,`r`.`Meter_type` AS `Meter_type`,`h`.`Total_comsumption` AS `Total_comsumption` from (`usage_history` `h` join `readings` `r` on((`h`.`Reading_id` = `r`.`Reading_id`))) group by `r`.`Reading_value`,`r`.`Reading_date`,`r`.`Meter_type`,`h`.`Consumer_number`,`h`.`Total_comsumption` */;
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

-- Dump completed on 2024-02-28 16:06:47
