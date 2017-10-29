CREATE DATABASE  IF NOT EXISTS `capewatchdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `capewatchdb`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: capewatchdb
-- ------------------------------------------------------
-- Server version	5.7.10-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `type_of_crime`
--

DROP TABLE IF EXISTS `type_of_crime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_of_crime` (
  `crimeID` varchar(10) NOT NULL,
  `crimeName` varchar(150) NOT NULL,
  `crimeCategory` varchar(150) NOT NULL,
  PRIMARY KEY (`crimeID`),
  UNIQUE KEY `crimeID` (`crimeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_of_crime`
--

LOCK TABLES `type_of_crime` WRITE;
/*!40000 ALTER TABLE `type_of_crime` DISABLE KEYS */;
INSERT INTO `type_of_crime` VALUES ('AR1','Carjacking','Subcategories of aggravated robbery'),('AR2','Truck hijacking','Subcategories of aggravated robbery'),('AR3','Robbery at residential premises','Subcategories of aggravated robbery'),('AR4','Robbery at non-residential premises','Subcategories of aggravated robbery'),('AR5','Bank robbery','Subcategories of aggravated robbery'),('AR6','Robbery of cash in transit','Subcategories of aggravated robbery'),('CC1','Murder','Contact Crimes (Crimes against the person)'),('CC2','Sexual offences','Contact Crimes (Crimes against the person)'),('CC3','Attempted Murder','Contact Crimes (Crimes against the person)'),('CC4','Assault with the intent to inflict grievous bodily harm','Contact Crimes (Crimes against the person)'),('CC5','Common assault','Contact Crimes (Crimes against the person)'),('CC6','Common robbery','Contact Crimes (Crimes against the person)'),('CC7','Robbery with aggravating circumstances','Contact Crimes (Crimes against the person)'),('CPA1','Illegal possession of firearms and ammunition','Crime detected as a result of police action'),('CPA2','Drug related crime','Crime detected as a result of police action'),('CPA3','Driving under the influence of alcohol or drugs','Crime detected as a result of police action'),('CPA4','Sexual offences as a result of police action','Crime detected as a result of police action'),('CR1','Arson','Contact related crimes'),('CR2','Malicious damage to property','Contact related crimes'),('OC1','Culpable homicide','Other'),('OC2','Public violence','Other'),('OC3','Crimen injuria','Other'),('OC4','Neglect and ill-treatment of children','Other'),('OC5','Kidnapping','Other'),('OS1','All theft not mentioned elsewhere','Other serious crimes'),('OS2','Commercial crime','Other serious crimes'),('OS3','Shoplifting','Other serious crimes'),('PR1','Burglary at non-residential premises','Property Related crimes'),('PR2','Burglary at residential premises','Property Related crimes'),('PR3','Theft of motor vehicle and motorcycle','Property Related crimes'),('PR4','Theft out of or from motor vehicle','Property Related crimes'),('PR5','Stock-theft','Property Related crimes');
/*!40000 ALTER TABLE `type_of_crime` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-08 11:03:33
