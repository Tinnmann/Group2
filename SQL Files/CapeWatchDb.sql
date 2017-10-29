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
-- Table structure for table `crime_case`
--

DROP TABLE IF EXISTS `crime_case`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crime_case` (
  `reportID` varchar(10) NOT NULL,
  `crimeID` varchar(10) NOT NULL,
  `userID` varchar(10) NOT NULL,
  `date` varchar(20) NOT NULL,
  `location` varchar(30) NOT NULL,
  `time` varchar(10) NOT NULL,
  `crimeType` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`reportID`),
  UNIQUE KEY `reportID` (`reportID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crime_case`
--

LOCK TABLES `crime_case` WRITE;
/*!40000 ALTER TABLE `crime_case` DISABLE KEYS */;
INSERT INTO `crime_case` VALUES ('0123456789','AR1','ABC123','23.01.2017','athlone','20:23','Carjacking','open');
/*!40000 ALTER TABLE `crime_case` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crime_location`
--

DROP TABLE IF EXISTS `crime_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crime_location` (
  `location` varchar(30) NOT NULL,
  `policeZone` varchar(30) NOT NULL,
  PRIMARY KEY (`location`),
  UNIQUE KEY `location` (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crime_location`
--

LOCK TABLES `crime_location` WRITE;
/*!40000 ALTER TABLE `crime_location` DISABLE KEYS */;
INSERT INTO `crime_location` VALUES ('207 Lawrence Road','Athlone');
/*!40000 ALTER TABLE `crime_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `injured_party`
--

DROP TABLE IF EXISTS `injured_party`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `injured_party` (
  `reportID` varchar(10) NOT NULL,
  `age` varchar(5) NOT NULL,
  `race` varchar(10) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `area` varchar(30) NOT NULL,
  PRIMARY KEY (`reportID`),
  UNIQUE KEY `reportID` (`reportID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `injured_party`
--

LOCK TABLES `injured_party` WRITE;
/*!40000 ALTER TABLE `injured_party` DISABLE KEYS */;
INSERT INTO `injured_party` VALUES ('0123456789','15','coloured','female','Athlone');
/*!40000 ALTER TABLE `injured_party` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `police_station`
--

DROP TABLE IF EXISTS `police_station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `police_station` (
  `policestation` varchar(100) NOT NULL,
  `zone` varchar(100) NOT NULL,
  `address` varchar(250) NOT NULL,
  `telephone` varchar(250) NOT NULL,
  PRIMARY KEY (`policestation`),
  UNIQUE KEY `policestation` (`policestation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `police_station`
--

LOCK TABLES `police_station` WRITE;
/*!40000 ALTER TABLE `police_station` DISABLE KEYS */;
INSERT INTO `police_station` VALUES ('Athlone Police Station','Athlone','Corner of Jan Smuts (M17) and Klipfontein (M18) - Athlone - 7764','021 697 9200'),('Belhar Police Station (satellite)','Belhar','Platteklip Crescent - Belhar - 7535','021 953 8100'),('Bellvile Police Station','Bellville','Voortrekker Road -Bellvile -next to Magistrate\'s Court - Bellville - 7535','021 918 3000'),('Bellvile South Police Station','Bellville South','Kasselsvlei Road -Bellville south -opposite Bellville South Industria - Bellville South - 7535','021 950 1300'),('Bishop Lavis Police Station','Bishop Lavis','Corner Table Mountain Road and Myrtle - Bishop Lavis - 7490','021 935 9802'),('Bothasig Police Station','Bothasig','Steurhoven Street - Bothasig - 7441','021 559 9400'),('Brackenfell Police Station','Brackenfell','Brackenfell Boulevard - Brackenfell - 7560','021 980 5700'),('Camps Bay Police Station','Camps Bay','Victoria Road -Camps Bay - opposite Camps Bay Swimming Pool - Camps Bay - 8040','021 437 8140'),('Cape Town Airport Police Station','Cape Town Central','Between International and Domestic Terminals - Cape Town Airport - 7525','021 927 2900'),('Cape Town Central Police Station','Cape Town Central','Corner of Buitenkant and Albertus streets - Cape Town - 8000','021 467 8000 /1 /2'),('Claremont Police Station','Claremont','Lansdowne Road next to Post Office - Claremont - 7440','021 657 2250'),('Delft Police Station','Delft','Main Road Delft - next to the Day Hospital - Kasselsvlei - 7537','021 954 9000'),('Diep River Police Station','Diep Rivier','Corner of Main Road and Fairdale -Diep River - 7800','021 710 7300'),('Durbanville Police Station','Durbanville','2 Church street - Durbanville - 7550','021 970 3800'),('Elsies River Police Station','Elsies River','Corner of Valhalla and Viking Road - Elsies River - 7480','021 933 0300'),('Fish Hoek Police Station','Fish Hoek','Corner of Main and Addo - Fish hoek - 7975','021 784 2700'),('Goodwood Police Station','Goodwood','Wiener Street - N1 City - Vrijzee - 7495','021 592 4430'),('Grassy Park Police Station','Grassy Park','Reddy Avenue (off Victoria Road) Grassy Park - 7941','021 700 3900'),('Gugulethu Police Station','Gugulethu','NY 1 Street - Gugulethu - 7750','021 637 5945'),('Harare Police Station (Satellite)','Harare','Steve Biko Drive next to the Clinic','021 363 9000'),('Hout Bay Police Station','Hout Bay','Corner of Main Road and Mandela Road','021 791 9300'),('Kensington Police Station','Kensington','Supermarine Street - Kensington - Maitland - 7404','021 594 7020/ 1/ 6/ 7/ 8'),('Khayelitsha Police Station','Khayelitsha','Bonga Drive - Site B - Bellville - 7535','021 360 2375/6'),('Kirstenhof Police Station','Kirstenhof','Pollsmoor Road - Kirstenhof - 7964','021 701 2426'),('Kleinvlei Police Station','Kleinvlei','Albert Philander Road - Kleinvlei - 7100','021 902 8300'),('Kraaifontein Police Station','Kraaifontein','Van Riebeeck Road (M15) - Kraaifontein - next to Municipal Depot - Kraaifontein - 7569','021 980 5500 /33 /34'),('Kuils River Police Station','Kuils Rivier','Corner of Jan Van Riebeeck (R102) and Station Road - Kuils River - 7579','021 903 3333 / 900 2800'),('Langa Police Station','Langa','Washington Street - Langa - 7455','021 695 8000'),('Lansdowne Police Station','Lansdowne','Flamingo Crescent - opposite Lumber City - Lansdowne - 7780','021 700 9000/45'),('Lingelethu West Police Station (satellite)','Lingelethu -West','Makabeni Street - Lingelethu West - 7783','021 361 1784'),('Macassar Police Station','Macassar','Hospital Street - next to Post Office - Macassar - 7130','021 857 1024'),('Maitland Police Station','Maitland','Voortrekker Road - opposite the Post Office - Maitland - 7405','021 506 9400 / 2022'),('Manenberg Police Station','Manenberg','Corner of Klipfontein and Duinefontein Road - Manenberg','021 699 9400'),('Mfuleni Police Station (satellite)','Mfuleni','Main Road - 2nd building - Blue Downs - 7100','021 909 9300'),('Milnerton Police Station','Milnerton','Koeberg Road - Milnerton - 7441','021 528 3800'),('Mitchells Plain Police Station','Mitchells Plain','AZ Berman (M45) Mitchells Plain - next to Day Hospital - Mitchells Plain - 7785','021 370 1600'),('Mowbray Police Station','Mowbray','Main Road - Mowbray - opposite Shoprite Checkers - Mowbray - 7700','021 680 9580'),('Muizenberg Police Station','Muizenberg','School Road (off Main Road) - Muizenberg - 7945','021 787 9000'),('Nyanga Police Station','Nyanga','N311 Ntlangano Cresent - Nyanga - 7755','021 380 3300'),('Ocean View Police Station','Ocean View','Slangkop Road - at turn off to Scarborough - Sunvalley - 7985','021 783 8306'),('Parow Police Station','Parow','Voortrekker Road - Parow - 7500','021 929 7037/7000'),('Phillipi East Police Station (satellite)','Philippi East','Stock Road - Phillipi East - 7785','021 370 1900'),('Phillipi Police Station','Philippi','Corner of Ottery (off Lansdowne) and Old Lansdowne Road - Phillipi - Phillipi - 7785','021 690 1500'),('Pinelands Police Station','Pinelands','Jan Smuts Drive - Pinelands - 7405','021 506 2022 / 2389'),('Ravensmead Police Station','Ravensmead','Christian Street - Ravensmead - 7493','021 933 9000'),('Rondebosch Police Station','Rondebosch','Church Street - Rondebosch - opposite St Paul\'s - Rondebosch - 7700','021 685 7345'),('Sea Point Police Station','Sea Point','Corner of Stanley and Bay - Green Point - Sea Point - 8060','021 430 3700'),('Simon\'s Town Police Station','Simon\'s Town','Corner of Main Road and King George - Simon\'s Town - Simonstown - 7995','021 786 8640'),('Sir Lowry\'s Pass Police Station (satellite of Somerset West)','Somerset West','Main Road - Sir Lowry\'s Pass - opposite Post Office - see Somerset West','021 858 1710'),('Somerset West Police Station','Somerset West','Corner of Main and Pastorie - Somerset West - 7129','021 850 1300'),('Steenberg Police Station','Steenberg','Cradock Road - off Concert Boulevard - Retreat - 7965','021 702 9000'),('Stellenbosch Police Station','Stellenbosch','Corner of Bergzicht and du Toit - Stellenbosch - Stellenbosch - 7599','021 809 5000'),('Strand Police Station','Strand','Corner of Gordon\'s Bay Road (R44) and Altena - Strand - next to Magistrate\'s Court - Strand - 7140','021 854 9100'),('Strandfontein Police Station','Strandfontein','Corner of Witsands and Spine Road - Strandfontein - 7785','021 370 1500'),('Table Bay Harbour Police Station','Table Bay Harbour','South Arm - Table Bay Harbour - Roggebaai - 8012','021 403 1000'),('Table View Police Station','Table View','Pentz Road - Table View - next to Table View Mall - Table View - 7441','021 521 3300'),('Woodstock Police Station','Woodstock','Corner of Victoria and Church - Woodstock - 7925','021 442 3117/21'),('Wynberg Police Station','Wynberg','Church Street - Wynberg - opposite Maynardville - Wynberg - 7824','021 799 1300');
/*!40000 ALTER TABLE `police_station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `police_user`
--

DROP TABLE IF EXISTS `police_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `police_user` (
  `name` varchar(20) NOT NULL,
  `surname` varchar(20) NOT NULL,
  `division` varchar(100) NOT NULL,
  `rank` varchar(100) NOT NULL,
  `policeStation` varchar(100) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `OfficerID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`OfficerID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `police_user`
--

LOCK TABLES `police_user` WRITE;
/*!40000 ALTER TABLE `police_user` DISABLE KEYS */;
INSERT INTO `police_user` VALUES ('Tyler','Gray','Combanting and Investigation Division','Genral','Athlone Police Station','','',1);
/*!40000 ALTER TABLE `police_user` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Dumping events for database 'capewatchdb'
--

--
-- Dumping routines for database 'capewatchdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-08 11:15:22
