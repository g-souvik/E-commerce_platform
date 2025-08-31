CREATE DATABASE  IF NOT EXISTS `ecom` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ecom`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: ecom
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
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `customer_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKmd2ap4oxo3wvgkf4fnaye532i` (`product_id`),
  KEY `FK99i1rh5nm7r3f1b3wdcuq5h57` (`customer_id`),
  CONSTRAINT `FK99i1rh5nm7r3f1b3wdcuq5h57` FOREIGN KEY (`customer_id`) REFERENCES `users` (`email`),
  CONSTRAINT `FKmd2ap4oxo3wvgkf4fnaye532i` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (25,0,'1008','raj@gmail.com'),(26,0,'1011','raj@gmail.com'),(28,0,'1001','raj@gmail.com'),(29,0,'1005','raj@gmail.com'),(30,0,'1002','rahul@gmail.com'),(32,0,'1015','raj@gmail.com'),(33,0,'1012','rahul@gmail.com'),(34,0,'1005','rahul@gmail.com'),(35,0,'1009','rohit@gmail.com');
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `cust_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phno` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `prod_id` varchar(255) DEFAULT NULL,
  `prod_name` varchar(255) DEFAULT NULL,
  `trans_details` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'Kolkata','raj@gmail.com','Raj Roy','8978997421',46500,'1001','iPhone 13','pay_R4OmFLvxWo3JAS'),(3,'Newtown','rahul@gmail.com','Rahul Yadav','4556567790',59000,'1003','Z30','pay_R4PNUOTPTn6bMy'),(4,'Kolkata','rahul@gmail.com','Rahul Yadav','4556567790',42999,'1019','Mi X Pro','pay_R83vKJYsX8Il8X'),(5,'Kolkata','rahul@gmail.com','Rahul Yadav','4556567790',63000,'1004','BRAVIA KD','pay_R844OfmV7sbtGS'),(6,'Kolkata','rahul@gmail.com','Rahul Yadav','4556567790',43000,'1012','Crystal Vision 4K','pay_R8UOuwoDfnRpjP'),(7,'Mumbai','rohit@gmail.com','Rohit Sharma','9806945851',21500,'1009','Aspire 3','pay_R8jcZ2kFy3Gg48'),(8,'Kolkata','raj@gmail.com','Raj Roy','8978997421',7999,'1017','Narzo 80 Lite','pay_R8noxdHdP1S8Hh');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` varchar(255) NOT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `quantity` int NOT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('1001','Apple','Mobile','iPhone 13',46500,230,'/upload/iPhone 13.jpg'),('1002','Apple','Laptop','MacBook',95000,50,'/upload/MacBook.jpg'),('1003','Nikon','Camera','Z30',59000,150,'/upload/Z30.jpg'),('1004','Sony','Television','BRAVIA KD',63000,150,'/upload/BRAVIA KD.jpg'),('1005','Vivo ','Mobile','Y19e',75000,150,'/upload/Y19e.jpg'),('1006','Samsung','Mobile','Galaxy M56',28000,150,'/upload/Galaxy M56.jpg'),('1007','Motorola','Mobile','Edge 60 Pro',30000,200,'/upload/Edge 60 Pro.jpg'),('1008','Dell','Laptop','Inspiron 14 Plus',104500,300,'/upload/Inspiron 16 Plus.jpg'),('1009','Acer','Laptop','Aspire 3',21500,1500,'/upload/Aspire 3.jpg'),('1010','HP','Laptop','Pavilion 15',72000,550,'/upload/Pavilion 15.jpg'),('1011','LG','Television','55UR7500PSC',41000,500,'/upload/55UR7500PSC.jpg'),('1012','Samsung','Television','Crystal Vision 4K',43000,450,'/upload/UA55CUE70AKL.jpg'),('1013','Hisense','Television','55A6K',48000,600,'/upload/55A6K.jpg'),('1014','Canon','Camera','EOS R10',81000,700,'/upload/EOS R10.jpg'),('1015','Sony ','Camera','ZV‑E10',65000,850,'/upload/ZV‑E10.png'),('1016','GoPro ','Camera','Hero 12',43000,1000,'/upload/Hero 12.png'),('1017','Realme','Mobile','Narzo 80 Lite',7999,230,'/upload/NARZO 80 Lite.jpg'),('1018','Lenovo','Laptop','Yoga Slim 7x',124999,450,'/upload/Yoga Slim 7x.jpg'),('1019','Xiaomi','Television','Mi X Pro',42999,300,'/upload/Mi X Pro.jpg'),('1020','Panasonic','Camera','Lumix G7',42400,400,'/upload/Lumix G7.jpg');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `email` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phno` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('admin@gmail.com','Admin','123','4893052965','admin'),('rahul@gmail.com','Rahul Yadav','1234','9904859210','customer'),('raj@gmail.com','Raj Roy','1234','9878997428','customer'),('rohit@gmail.com','Rohit Sharma','1234','9806945851','customer');
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

-- Dump completed on 2025-08-30 20:58:45
