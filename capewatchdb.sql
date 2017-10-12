-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 11, 2017 at 09:09 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `capewatchdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `crime_case`
--

CREATE TABLE `crime_case` (
  `reportID` int(10) NOT NULL,
  `crimeID` varchar(10) NOT NULL,
  `userID` varchar(10) NOT NULL,
  `date` varchar(20) NOT NULL,
  `location` varchar(30) NOT NULL,
  `time` varchar(10) NOT NULL,
  `crimeType` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `crime_case`
--

INSERT INTO `crime_case` (`reportID`, `crimeID`, `userID`, `date`, `location`, `time`, `crimeType`, `status`) VALUES
(1, 'AR1', '1', '03/15/2017', 'Athlone', '02:21', 'Carjacking', 'open '),
(2, 'AR2', '1', '08/07/2011', 'Bellville', '14:01', 'Truck Hijacking', 'closed '),
(3, 'AR3', '2', '08/25/2016', 'Bellville South ', '02:00', 'Robbery res', 'open'),
(34665682, 'PR5', '1', '10/09/2017', 'Bothasig', '05:00', 'Stock-theft', 'open'),
(34665683, 'PR3', '1', '10/02/2017', 'Camps Bay', '18:01', 'Vehicle theft', 'closed '),
(34665684, 'CC5', '2', '10/04/2017', 'Bellville', '15:01', 'Common Assault', 'open'),
(34665685, 'CC1', '2', '09/26/2017', 'Elsies River', '02:17', 'Murder', 'open'),
(34665686, 'CC7', '1', '09/28/2017', 'Delft', '15:04', 'Robbery', 'open'),
(34665687, 'CPA4', '2', '10/01/2017', 'Brackenfell', '00:01', 'Sexual Off Police', 'open'),
(34665689, 'CC1', '4', '09/25/2017', 'Bellville', '22:00', 'Murder', 'open');

-- --------------------------------------------------------

--
-- Table structure for table `crime_location`
--

CREATE TABLE `crime_location` (
  `location` varchar(30) NOT NULL,
  `policeZone` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `crime_location`
--

INSERT INTO `crime_location` (`location`, `policeZone`) VALUES
('207 Lawrence Road', 'Athlone');

-- --------------------------------------------------------

--
-- Table structure for table `injured_party`
--

CREATE TABLE `injured_party` (
  `reportID` int(10) NOT NULL,
  `age` varchar(5) NOT NULL,
  `race` varchar(10) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `area` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `injured_party`
--

INSERT INTO `injured_party` (`reportID`, `age`, `race`, `gender`, `area`) VALUES
(1, '15', 'Black', 'male', 'Athlone'),
(10, '33', 'Black', 'male', 'Bellville South '),
(34665677, '23', 'Black', 'male', 'Bellville'),
(34665678, '47', 'White', 'female', 'Claremont'),
(34665679, '24', 'White', 'female', 'Camps Bay'),
(34665680, '25', 'White', 'male', 'Cape Town Central'),
(34665681, '28', 'White', 'male', 'Bothasig'),
(34665682, '34', 'Coloured', 'female', 'Camps Bay'),
(34665683, '26', 'Black', 'female', 'Bellville'),
(34665684, '34', 'Coloured', 'male', 'Elsies River'),
(34665685, '40', 'Black', 'female', 'Delft'),
(34665686, '26', 'Black', 'female', 'Brackenfell'),
(34665687, '29', '', '', 'Bellville');

-- --------------------------------------------------------

--
-- Table structure for table `login_details`
--

CREATE TABLE `login_details` (
  `userID` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login_details`
--

INSERT INTO `login_details` (`userID`, `email`, `password`) VALUES
('ABC123', 'tylergray207@gmail.com', '1996TG');

-- --------------------------------------------------------

--
-- Table structure for table `police_station`
--

CREATE TABLE `police_station` (
  `policestation` varchar(100) NOT NULL,
  `zone` varchar(100) NOT NULL,
  `address` varchar(250) NOT NULL,
  `telephone` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `police_station`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `police_user`
--

CREATE TABLE `police_user` (
  `officerID` varchar(45) NOT NULL,
  `name` varchar(20) NOT NULL,
  `surname` varchar(20) NOT NULL,
  `division` varchar(100) NOT NULL,
  `rank` varchar(100) NOT NULL,
  `policeStation` varchar(100) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `police_user`
--

INSERT INTO `police_user` (`officerID`, `name`, `surname`, `division`, `rank`, `policeStation`, `email`, `password`) VALUES
('1', 'Tyler', 'Gray', 'Combanting and Investigation Division\r\n', 'Genral\r\n\r\n', 'Athlone Police Station\r\n\r\n', 'tyler@gmail.com', 'mouse1996'),
('2', 'Tinashe', 'Madzingaidzo', 'Internal Stability Division', 'General', 'Durbanville Police Station', 'tinmadzin@gmail.com', 'ThePhantom');

-- --------------------------------------------------------

--
-- Table structure for table `type_of_crime`
--

CREATE TABLE `type_of_crime` (
  `crimeID` varchar(10) NOT NULL,
  `crimeName` varchar(150) NOT NULL,
  `crimeCategory` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `type_of_crime`
--

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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `crime_case`
--
ALTER TABLE `crime_case`
  ADD PRIMARY KEY (`reportID`),
  ADD UNIQUE KEY `reportID` (`reportID`);

--
-- Indexes for table `crime_location`
--
ALTER TABLE `crime_location`
  ADD PRIMARY KEY (`location`),
  ADD UNIQUE KEY `location` (`location`);

--
-- Indexes for table `injured_party`
--
ALTER TABLE `injured_party`
  ADD PRIMARY KEY (`reportID`),
  ADD UNIQUE KEY `reportID` (`reportID`);

--
-- Indexes for table `login_details`
--
ALTER TABLE `login_details`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `useriD` (`userID`);

--
-- Indexes for table `police_station`
--
ALTER TABLE `police_station`
  ADD PRIMARY KEY (`policestation`),
  ADD UNIQUE KEY `policestation` (`policestation`);

--
-- Indexes for table `police_user`
--
ALTER TABLE `police_user`
  ADD PRIMARY KEY (`officerID`);

--
-- Indexes for table `type_of_crime`
--
ALTER TABLE `type_of_crime`
  ADD PRIMARY KEY (`crimeID`),
  ADD UNIQUE KEY `crimeID` (`crimeID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `crime_case`
--
ALTER TABLE `crime_case`
  MODIFY `reportID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34665690;
--
-- AUTO_INCREMENT for table `injured_party`
--
ALTER TABLE `injured_party`
  MODIFY `reportID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34665688;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
