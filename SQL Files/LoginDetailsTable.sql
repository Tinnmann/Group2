CREATE TABLE IF NOT EXISTS 'Login_Details'(
'userID' varchar(10) NOT NULL,
'email' varchar(30) NOT NULL, 
'password' varchar(30) NOT NULL,
PRIMARY KEY('userID'),
UNIQUE KEY 'useriD' ('userID')
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table capewatchdb.police_station: ~13 rows (approximately)
DELETE FROM 'Login_Details'
/*!40000 ALTER TABLE `Login_Details` DISABLE KEYS */;
INSERT INTO 'Login_Details' ('userID', 'email', 'password') VALUES
			('ABC123', 'tylergray207@gmail.com', '1996TG');