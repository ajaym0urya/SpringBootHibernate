-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.22-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6452
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for product
DROP DATABASE IF EXISTS `product`;
CREATE DATABASE IF NOT EXISTS `product` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `product`;

-- Dumping structure for table product.category
DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Categories` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table product.category: 9 rows
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`Id`, `Categories`) VALUES
	(4, 'Baby Products'),
	(3, 'Groceries'),
	(2, 'Electronics & Accessories'),
	(1, 'Mobiles, Computers'),
	(5, 'Health & Personal Care'),
	(6, 'Software'),
	(7, 'Tools & Home Improvement'),
	(8, 'Fashion'),
	(9, 'Books');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- Dumping structure for table product.category_product
DROP TABLE IF EXISTS `category_product`;
CREATE TABLE IF NOT EXISTS `category_product` (
  `Category_Id` int(11) NOT NULL,
  `product_Id` int(11) NOT NULL,
  UNIQUE KEY `UK_egm69sipsvwbmrohwu96sgyn3` (`product_Id`),
  KEY `FK1ud0a9nky7jydpjgicp59615t` (`Category_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- Dumping data for table product.category_product: 2 rows
/*!40000 ALTER TABLE `category_product` DISABLE KEYS */;
INSERT INTO `category_product` (`Category_Id`, `product_Id`) VALUES
	(4, 1),
	(2, 2);
/*!40000 ALTER TABLE `category_product` ENABLE KEYS */;

-- Dumping structure for table product.product
DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  `category_Id` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FKn79pbqb0tkd5orka759ekd3w9` (`category_Id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table product.product: 2 rows
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`Id`, `Name`, `Description`, `Price`, `category_Id`) VALUES
	(1, 'Sony WI-C200', 'Headphones with 15 Hrs Batteries', 6922, 4),
	(2, 'boAt Aavante Bar 900', 'Bluetooth Soundbar with 30W RMS', 699, 2);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
