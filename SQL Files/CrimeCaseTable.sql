CREATE TABLE IF NOT EXISTS 'Crime_Case'(
'reportID' varchar(10) NOT NULL,
'crimeID' varchar(10) NOT NULL,
'userID' varchar(10) NOT NULL,
'date' varchar(20) NOT NULL,
'location' varchar(30) NOT NULL,
'time' varchar(10) NOT NULL,
'crimeType' varchar(20) NOT NULL,
'status' varchar(10) NOT NULL,
PRIMARY KEY('reportID'),
UNIQUE KEY 'reportID' ('reportID')
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table capewatchdb.police_station: ~13 rows (approximately)
DELETE FROM 'Crime_Case';
/*!40000 ALTER TABLE `Crime_Case` DISABLE KEYS */;
INSERT INTO 'Crime_Case' ('reportID', 'crimeID', 'userID', 'date', 'location', 'time', 'crimeType', 'status') VALUES
			('MB2015_0023', 'AR1', 'ABC123', '23.01.2017', 'athlone', '20:23', 'Carjacking', 'open');