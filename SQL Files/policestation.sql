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

-- Dumping structure for table capewatchdb.police_station
CREATE TABLE IF NOT EXISTS `police_station` (
  `policestation` varchar(100) NOT NULL,
  `zone` varchar(100) NOT NULL,
  `address` varchar(250) NOT NULL,
  `telephone` varchar(250) NOT NULL,
  PRIMARY KEY (`policestation`),
  UNIQUE KEY `policestation` (`policestation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table capewatchdb.police_station: ~58 rows (approximately)
DELETE FROM `police_station`;
/*!40000 ALTER TABLE `police_station` DISABLE KEYS */;
INSERT INTO `police_station` (`policestation`, `zone`, `address`, `telephone`) VALUES
	('Athlone Police Station', 'Athlone', 'Corner of Jan Smuts (M17) and Klipfontein (M18) - Athlone - 7764', '021 697 9200'),
	('Belhar Police Station (satellite)', 'Belhar', 'Platteklip Crescent - Belhar - 7535', '021 953 8100'),
	('Bellvile Police Station', 'Bellville', 'Voortrekker Road -Bellvile -next to Magistrate\'s Court - Bellville - 7535', '021 918 3000'),
	('Bellvile South Police Station', 'Bellville South', 'Kasselsvlei Road -Bellville south -opposite Bellville South Industria - Bellville South - 7535', '021 950 1300'),
	('Bishop Lavis Police Station', 'Bishop Lavis', 'Corner Table Mountain Road and Myrtle - Bishop Lavis - 7490', '021 935 9802'),
	('Bothasig Police Station', 'Bothasig', 'Steurhoven Street - Bothasig - 7441', '021 559 9400'),
	('Brackenfell Police Station', 'Brackenfell', 'Brackenfell Boulevard - Brackenfell - 7560', '021 980 5700'),
	('Camps Bay Police Station', 'Camps Bay', 'Victoria Road -Camps Bay - opposite Camps Bay Swimming Pool - Camps Bay - 8040', '021 437 8140'),
	('Cape Town Airport Police Station', 'Cape Town Central', 'Between International and Domestic Terminals - Cape Town Airport - 7525', '021 927 2900'),
	('Cape Town Central Police Station', 'Cape Town Central', 'Corner of Buitenkant and Albertus streets - Cape Town - 8000', '021 467 8000 /1 /2'),
	('Claremont Police Station', 'Claremont', 'Lansdowne Road next to Post Office - Claremont - 7440', '021 657 2250'),
	('Delft Police Station', 'Delft', 'Main Road Delft - next to the Day Hospital - Kasselsvlei - 7537', '021 954 9000'),
	('Diep River Police Station', 'Diep Rivier', 'Corner of Main Road and Fairdale -Diep River - 7800', '021 710 7300'),
	('Durbanville Police Station', 'Durbanville', '2 Church street - Durbanville - 7550', '021 970 3800'),
	('Elsies River Police Station', 'Elsies River', 'Corner of Valhalla and Viking Road - Elsies River - 7480', '021 933 0300'),
	('Fish Hoek Police Station', 'Fish Hoek', 'Corner of Main and Addo - Fish hoek - 7975', '021 784 2700'),
	('Goodwood Police Station', 'Goodwood', 'Wiener Street - N1 City - Vrijzee - 7495', '021 592 4430'),
	('Grassy Park Police Station', 'Grassy Park', 'Reddy Avenue (off Victoria Road) Grassy Park - 7941', '021 700 3900'),
	('Gugulethu Police Station', 'Gugulethu', 'NY 1 Street - Gugulethu - 7750', '021 637 5945'),
	('Harare Police Station (Satellite)', 'Harare', 'Steve Biko Drive next to the Clinic', '021 363 9000'),
	('Hout Bay Police Station', 'Hout Bay', 'Corner of Main Road and Mandela Road', '021 791 9300'),
	('Kensington Police Station', 'Kensington', 'Supermarine Street - Kensington - Maitland - 7404', '021 594 7020/ 1/ 6/ 7/ 8'),
	('Khayelitsha Police Station', 'Khayelitsha', 'Bonga Drive - Site B - Bellville - 7535', '021 360 2375/6'),
	('Kirstenhof Police Station', 'Kirstenhof', 'Pollsmoor Road - Kirstenhof - 7964', '021 701 2426'),
	('Kleinvlei Police Station', 'Kleinvlei', 'Albert Philander Road - Kleinvlei - 7100', '021 902 8300'),
	('Kraaifontein Police Station', 'Kraaifontein', 'Van Riebeeck Road (M15) - Kraaifontein - next to Municipal Depot - Kraaifontein - 7569', '021 980 5500 /33 /34'),
	('Kuils River Police Station', 'Kuils Rivier', 'Corner of Jan Van Riebeeck (R102) and Station Road - Kuils River - 7579', '021 903 3333 / 900 2800'),
	('Langa Police Station', 'Langa', 'Washington Street - Langa - 7455', '021 695 8000'),
	('Lansdowne Police Station', 'Lansdowne', 'Flamingo Crescent - opposite Lumber City - Lansdowne - 7780', '021 700 9000/45'),
	('Lingelethu West Police Station (satellite)', 'Lingelethu -West', 'Makabeni Street - Lingelethu West - 7783', '021 361 1784'),
	('Macassar Police Station', 'Macassar', 'Hospital Street - next to Post Office - Macassar - 7130', '021 857 1024'),
	('Maitland Police Station', 'Maitland', 'Voortrekker Road - opposite the Post Office - Maitland - 7405', '021 506 9400 / 2022'),
	('Manenberg Police Station', 'Manenberg', 'Corner of Klipfontein and Duinefontein Road - Manenberg', '021 699 9400'),
	('Mfuleni Police Station (satellite)', 'Mfuleni', 'Main Road - 2nd building - Blue Downs - 7100', '021 909 9300'),
	('Milnerton Police Station', 'Milnerton', 'Koeberg Road - Milnerton - 7441', '021 528 3800'),
	('Mitchells Plain Police Station', 'Mitchells Plain', 'AZ Berman (M45) Mitchells Plain - next to Day Hospital - Mitchells Plain - 7785', '021 370 1600'),
	('Mowbray Police Station', 'Mowbray', 'Main Road - Mowbray - opposite Shoprite Checkers - Mowbray - 7700', '021 680 9580'),
	('Muizenberg Police Station', 'Muizenberg', 'School Road (off Main Road) - Muizenberg - 7945', '021 787 9000'),
	('Nyanga Police Station', 'Nyanga', 'N311 Ntlangano Cresent - Nyanga - 7755', '021 380 3300'),
	('Ocean View Police Station', 'Ocean View', 'Slangkop Road - at turn off to Scarborough - Sunvalley - 7985', '021 783 8306'),
	('Parow Police Station', 'Parow', 'Voortrekker Road - Parow - 7500', '021 929 7037/7000'),
	('Phillipi East Police Station (satellite)', 'Philippi East', 'Stock Road - Phillipi East - 7785', '021 370 1900'),
	('Phillipi Police Station', 'Philippi', 'Corner of Ottery (off Lansdowne) and Old Lansdowne Road - Phillipi - Phillipi - 7785', '021 690 1500'),
	('Pinelands Police Station', 'Pinelands', 'Jan Smuts Drive - Pinelands - 7405', '021 506 2022 / 2389'),
	('Ravensmead Police Station', 'Ravensmead', 'Christian Street - Ravensmead - 7493', '021 933 9000'),
	('Rondebosch Police Station', 'Rondebosch', 'Church Street - Rondebosch - opposite St Paul\'s - Rondebosch - 7700', '021 685 7345'),
	('Sea Point Police Station', 'Sea Point', 'Corner of Stanley and Bay - Green Point - Sea Point - 8060', '021 430 3700'),
	('Simon\'s Town Police Station', 'Simon\'s Town', 'Corner of Main Road and King George - Simon\'s Town - Simonstown - 7995', '021 786 8640'),
	('Sir Lowry\'s Pass Police Station (satellite of Somerset West)', 'Somerset West', 'Main Road - Sir Lowry\'s Pass - opposite Post Office - see Somerset West', '021 858 1710'),
	('Somerset West Police Station', 'Somerset West', 'Corner of Main and Pastorie - Somerset West - 7129', '021 850 1300'),
	('Steenberg Police Station', 'Steenberg', 'Cradock Road - off Concert Boulevard - Retreat - 7965', '021 702 9000'),
	('Stellenbosch Police Station', 'Stellenbosch', 'Corner of Bergzicht and du Toit - Stellenbosch - Stellenbosch - 7599', '021 809 5000'),
	('Strand Police Station', 'Strand', 'Corner of Gordon\'s Bay Road (R44) and Altena - Strand - next to Magistrate\'s Court - Strand - 7140', '021 854 9100'),
	('Strandfontein Police Station', 'Strandfontein', 'Corner of Witsands and Spine Road - Strandfontein - 7785', '021 370 1500'),
	('Table Bay Harbour Police Station', 'Table Bay Harbour', 'South Arm - Table Bay Harbour - Roggebaai - 8012', '021 403 1000'),
	('Table View Police Station', 'Table View', 'Pentz Road - Table View - next to Table View Mall - Table View - 7441', '021 521 3300'),
	('Woodstock Police Station', 'Woodstock', 'Corner of Victoria and Church - Woodstock - 7925', '021 442 3117/21'),
	('Wynberg Police Station', 'Wynberg', 'Church Street - Wynberg - opposite Maynardville - Wynberg - 7824', '021 799 1300');
/*!40000 ALTER TABLE `police_station` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
