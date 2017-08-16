CREATE TABLE IF NOT EXISTS 'Crime_Location'(
'location' varchar(30) NOT NULL,
'policeZone' varchar(30) NOT NULL,
PRIMARY KEY ('location'),
UNIQUE KEY 'location' ('location')
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table capewatchdb.police_station: ~13 rows (approximately)
DELETE FROM 'Crime_Location';
/*!40000 ALTER TABLE `Crime_Location` DISABLE KEYS */;
INSERT INTO 'Crime_Location' ('location', 'policeZone' ) VALUES
			('207 Lawrence Road', 'Athlone');