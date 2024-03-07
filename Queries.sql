
-- Trigger
DELIMITER $$
CREATE TRIGGER Usage_history_update
AFTER INSERT ON Readings
FOR EACH ROW
BEGIN 
	DECLARE Sum_of_consumption decimal(7,2);

	SELECT SUM(Reading_value) INTO Sum_of_consumption
	FROM Readings
	WHERE Consumer_number = NEW.Consumer_number;
	
	INSERT INTO Usage_history(Total_comsumption, Consumer_number, Reading_id)
	VALUES(Sum_of_consumption, NEW.Consumer_number, NEW.Reading_id);

END$$


INSERT INTO Readings VALUES (322, '25/02/24', '300 kWh', 'Prepaid Meter', '1051785');

SELECT * FROM Usage_history;


-- Locking and Concurrent Access
-- read
LOCK TABLE Tariff READ;

INSERT INTO Tariff VALUES ('6', 'Commercial tariff', '38');

SELECT * FROM Tariff;

-- write 
LOCK TABLE Tariff WRITE;

INSERT INTO Tariff VALUES ('6', 'Commercial tariff', '38');

SELECT * FROM Tariff;

--
mysqldump -u root -p BillManagementSystem > D:/backup.sql

