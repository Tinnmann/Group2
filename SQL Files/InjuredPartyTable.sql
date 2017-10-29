CREATE TABLE IF NOT EXISTS 'Injured_Party' (
'reportID' varchar(10) NOT NULL,
'age' varchar(5) NOT NULL,
'race' varchar(10) NOT NULL,
'gender' varchar(10) NOT NULL,
'area' varchar(30) NOT NULL,
PRIMARY KEY('reportID'),
UNIQUE KEY 'reportID' ('reportID')
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table capewatchdb.police_station: ~13 rows (approximately)
DELETE FROM 'Injured_Party';
/*!40000 ALTER TABLE `Injured_Party` DISABLE KEYS */;
INSERT INTO 'Injured_Party' ('reportID', 'age', 'race', 'gender', 'area') VALUES
			('MB2015_0023', '15', 'coloured', 'female', 'Athlone');