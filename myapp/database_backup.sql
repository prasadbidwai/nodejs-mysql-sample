-- MySQL dump 10.13  Distrib 8.0.11, for osx10.13 (x86_64)
--
-- ------------------------------------------------------
-- Server version	8.0.11

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Bouquets'),(2,'dish_detergent'),(3,'laundry'),(4,'kitchen_cleaning'),(5,'clothes_detergent'),(6,'Wine'),(7,'Liquor '),(8,'Beer');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `category_to_product`
--

DROP TABLE IF EXISTS `category_to_product`;
/*!50001 DROP VIEW IF EXISTS `category_to_product`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `category_to_product` AS SELECT
 1 AS `category_id`,
 1 AS `category_name`,
 1 AS `group_concat(product.product_id)`,
 1 AS `group_concat(product.product_name)`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_first_name` varchar(64) DEFAULT NULL,
  `cutomer_last_name` varchar(64) DEFAULT NULL,
  `customer_email_id` varchar(128) DEFAULT NULL,
  `customer_address` varchar(512) DEFAULT NULL,
  `customer_city` varchar(64) DEFAULT NULL,
  `customer_state` varchar(64) DEFAULT NULL,
  `customer_zipcode` int(11) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'John','Snow','john_snow@westroes.com','Castle Black','North','the north',1),(2,'Sansa','Stark','Sansa_stark@westroes.com','winterfell','winterfell','the north',2),(3,'Bran','Stark','bran_stark@westroes.com','Red Keep','Kings landing','Kings Landing',7),(4,'Tyrion','Lanister','tyrion_lanister@lanister.com','Dragonstone','Kings Landing','Kings Landing ',10),(5,'Cersi','Lanister','cersi_lanister@lanister.com','Red Keep','Kings Landing','Kings Landing',7);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `customer_order_details`
--

DROP TABLE IF EXISTS `customer_order_details`;
/*!50001 DROP VIEW IF EXISTS `customer_order_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `customer_order_details` AS SELECT
 1 AS `order_id`,
 1 AS `customer_id`,
 1 AS `customer_first_name`,
 1 AS `number_purchased`,
 1 AS `category_id`,
 1 AS `category_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders` (
  `order_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_quantity` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  UNIQUE KEY `orders_order_id_customer_id_product_id_date_uindex` (`order_id`,`customer_id`,`product_id`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,5,15,'2019-05-19'),(2,2,5,10,'2019-05-05'),(2,2,6,20,'2019-05-05'),(3,3,1,100,'2019-05-19'),(3,3,2,20,'2019-05-19'),(3,3,3,200,'2019-05-19'),(3,3,4,175,'2019-05-19'),(4,4,7,20,'2019-05-06'),(4,4,8,2,'2019-05-06'),(4,4,9,2,'2019-05-06'),(5,4,7,30,'2019-05-13'),(5,4,8,3,'2019-05-13'),(5,4,9,22,'2019-05-13'),(6,4,7,21,'2019-04-07'),(7,4,7,69,'2019-04-12'),(8,4,7,43,'2019-04-22'),(9,4,7,37,'2019-04-29'),(10,4,7,98,'2019-03-10'),(11,4,7,20,'2019-03-14'),(12,4,7,55,'2019-03-31');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `prdouct_to_category`
--

DROP TABLE IF EXISTS `prdouct_to_category`;
/*!50001 DROP VIEW IF EXISTS `prdouct_to_category`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `prdouct_to_category` AS SELECT
 1 AS `product_id`,
 1 AS `product_name`,
 1 AS `product_description`,
 1 AS `group_concat(category.category_id)`,
 1 AS `group_concat(category_name )`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(64) DEFAULT NULL,
  `product_description` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'tide soft pods','laundry mild detergent pods for delicate cloths'),(2,'cascade','dish washer pod'),(3,'Ajax','liquid dish soap '),(4,'tide powder','laundry detergent powder'),(5,'rose bouquets','Bouquets of roses'),(6,'lilly & roses bouquets','bouquets made up of lilly & roses '),(7,'Red Wine','DornishRed Wine '),(8,'White Wine','Dornish White wine '),(9,'Ale','Northern Ale');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_category` (
  `product_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  KEY `product_category_category_category_id_fk` (`category_id`),
  KEY `product_category_product_product_id_fk` (`product_id`),
  CONSTRAINT `product_category_category_category_id_fk` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `product_category_product_product_id_fk` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,3),(1,5),(2,2),(2,4),(3,2),(3,4),(4,3),(4,5),(7,6),(7,7),(8,6),(8,7),(9,7),(9,8),(5,1),(6,1);
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `category_to_product`
--

/*!50001 DROP VIEW IF EXISTS `category_to_product`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `category_to_product` AS select `category`.`category_id` AS `category_id`,`category`.`category_name` AS `category_name`,group_concat(`product`.`product_id` separator ',') AS `group_concat(product.product_id)`,group_concat(`product`.`product_name` separator ',') AS `group_concat(product.product_name)` from ((`product` join `category`) join `product_category`) where ((`category`.`category_id` = `product_category`.`category_id`) and (`product`.`product_id` = `product_category`.`product_id`)) group by `category`.`category_id`,`category`.`category_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customer_order_details`
--

/*!50001 DROP VIEW IF EXISTS `customer_order_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_order_details` AS select `o`.`order_id` AS `order_id`,`c`.`customer_id` AS `customer_id`,`c`.`customer_first_name` AS `customer_first_name`,`o`.`product_quantity` AS `number_purchased`,group_concat(`pc`.`category_id` separator ',') AS `category_id`,group_concat(`cat`.`category_name` separator ',') AS `category_name` from (((`orders` `o` join `customer` `c`) join `product_category` `pc`) join `category` `cat`) where ((`o`.`customer_id` = `c`.`customer_id`) and (`o`.`product_id` = `pc`.`product_id`) and (`pc`.`category_id` = `cat`.`category_id`)) group by `o`.`order_id`,`c`.`customer_id`,`c`.`customer_first_name`,`o`.`product_quantity` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `prdouct_to_category`
--

/*!50001 DROP VIEW IF EXISTS `prdouct_to_category`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `prdouct_to_category` AS select `product`.`product_id` AS `product_id`,`product`.`product_name` AS `product_name`,`product`.`product_description` AS `product_description`,group_concat(`category`.`category_id` separator ',') AS `group_concat(category.category_id)`,group_concat(`category`.`category_name` separator ',') AS `group_concat(category_name )` from ((`product` join `category`) join `product_category`) where ((`category`.`category_id` = `product_category`.`category_id`) and (`product`.`product_id` = `product_category`.`product_id`)) group by `product`.`product_id`,`product`.`product_name` */;
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

-- Dump completed on 2019-06-17 16:15:16
