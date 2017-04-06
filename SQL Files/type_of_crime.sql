-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.10-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for capewatchdb
CREATE DATABASE IF NOT EXISTS `capewatchdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `capewatchdb`;

-- Dumping structure for table capewatchdb.type_of_crime
CREATE TABLE IF NOT EXISTS `type_of_crime` (
  `crimeID` varchar(10) NOT NULL,
  `crimeName` varchar(150) NOT NULL,
  `crimeCategory` varchar(150) NOT NULL,
  PRIMARY KEY (`crimeID`),
  UNIQUE KEY `crimeID` (`crimeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table capewatchdb.type_of_crime: ~32 rows (approximately)
DELETE FROM `type_of_crime`;
/*!40000 ALTER TABLE `type_of_crime` DISABLE KEYS */;
INSERT INTO `type_of_crime` (`crimeID`, `crimeName`, `crimeCategory`) VALUES
	('AR1', 'Carjacking', 'Subcategories of aggravated robbery'),
	('AR2', 'Truck hijacking', 'Subcategories of aggravated robbery'),
	('AR3', 'Robbery at residential premises', 'Subcategories of aggravated robbery'),
	('AR4', 'Robbery at non-residential premises', 'Subcategories of aggravated robbery'),
	('AR5', 'Bank robbery', 'Subcategories of aggravated robbery'),
	('AR6', 'Robbery of cash in transit', 'Subcategories of aggravated robbery'),
	('CC1', 'Murder', 'Contact Crimes (Crimes against the person)'),
	('CC2', 'Sexual offences', 'Contact Crimes (Crimes against the person)'),
	('CC3', 'Attempted Murder', 'Contact Crimes (Crimes against the person)'),
	('CC4', 'Assault with the intent to inflict grievous bodily harm', 'Contact Crimes (Crimes against the person)'),
	('CC5', 'Common assault', 'Contact Crimes (Crimes against the person)'),
	('CC6', 'Common robbery', 'Contact Crimes (Crimes against the person)'),
	('CC7', 'Robbery with aggravating circumstances', 'Contact Crimes (Crimes against the person)'),
	('CPA1', 'Illegal possession of firearms and ammunition', 'Crime detected as a result of police action'),
	('CPA2', 'Drug related crime', 'Crime detected as a result of police action'),
	('CPA3', 'Driving under the influence of alcohol or drugs', 'Crime detected as a result of police action'),
	('CPA4', 'Sexual offences as a result of police action', 'Crime detected as a result of police action'),
	('CR1', 'Arson', 'Contact related crimes'),
	('CR2', 'Malicious damage to property', 'Contact related crimes'),
	('OC1', 'Culpable homicide', 'Other'),
	('OC2', 'Public violence', 'Other'),
	('OC3', 'Crimen injuria', 'Other'),
	('OC4', 'Neglect and ill-treatment of children', 'Other'),
	('OC5', 'Kidnapping', 'Other'),
	('OS1', 'All theft not mentioned elsewhere', 'Other serious crimes'),
	('OS2', 'Commercial crime', 'Other serious crimes'),
	('OS3', 'Shoplifting', 'Other serious crimes'),
	('PR1', 'Burglary at non-residential premises', 'Property Related crimes'),
	('PR2', 'Burglary at residential premises', 'Property Related crimes'),
	('PR3', 'Theft of motor vehicle and motorcycle', 'Property Related crimes'),
	('PR4', 'Theft out of or from motor vehicle', 'Property Related crimes'),
	('PR5', 'Stock-theft', 'Property Related crimes');
/*!40000 ALTER TABLE `type_of_crime` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
