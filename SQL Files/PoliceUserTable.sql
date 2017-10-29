CREATE TABLE IF NOT EXISTS 'Police_User' (
'userID' varchar(10) NOT NULL,
'name' varchar(20) NOT NULL,
'surname' varchar(20) NOT NULL,
'division' varchar(100) NOT NULL,
'rank' varchar(100) NOT NULL,
'policeStation' varchar(100) NOT NULL,
PRIMARY KEY ('userID'),
UNIQUE KEY 'userID' ('userID')
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table capewatchdb.police_station: ~13 rows (approximately)
DELETE FROM 'Police_User';
/*!40000 ALTER TABLE `Police_User` DISABLE KEYS */;
INSERT INTO 'Police_User' ('userID', 'name', 'surname', 'division', 'rank', 'policeStation') VALUES
			('ABC123', 'Tyler', 'Gray', 'Combanting and Investigation Division', 'Genral', 'Athlone Police Station'),
			
			
