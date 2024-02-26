
-- Indexes
-- i
CREATE INDEX Consumer_Phone_idx
ON Consumer(Phone_number);


-- ii
CREATE INDEX Meter_Reading_idx
ON Readings(Meter_type);

-- iii
CREATE INDEX Payment_type_idx
ON Payment(Payment_type);



-- Views
-- i
CREATE VIEW ConsumerElectricityDetails AS
SELECT EC.Electricity_name, C.Full_name, EC.Phone_number AS 'Company Phone',
C.Phone_number AS 'Consumer Phone'
FROM Electricity_company EC JOIN Consumer C 
ON EC.Electricity_name=C.Electricity_name;

SELECT * FROM ConsumerElectricityDetails;


-- ii
CREATE VIEW UsageHistoryReadings AS 
SELECT H.Consumer_number, R.Reading_value, R.Reading_date, R.Meter_type, H.Total_comsumption
FROM Usage_history H JOIN Readings R 
ON H.Reading_id=R.Reading_id
GROUP BY R.Reading_value, R.Reading_date, R.Meter_type, H.Consumer_number, H.Total_comsumption;


SELECT * FROM UsageHistoryReadings;


-- Transactions
-- i
START TRANSACTION;

DELETE FROM Usage_history WHERE Usage_history_id = '4';

SELECT * FROM Usage_history;

ROLLBACK;

-- ii
DELETE FROM Usage_history WHERE Usage_history_id = '4';

SELECT * FROM Usage_history;

COMMIT;


--- Database Security
-- user1
drop user 'User1'@'BillManagementSystem';

CREATE USER 'User1'@'BillManagementSystem' IDENTIFIED WITH 
mysql_native_password BY 'USRroot';

GRANT ALL ON `BillManagementSystem`.* TO 'User1'@'BillManagementSystem';

SHOW GRANTS FOR 'User1'@'BillManagementSystem';

-- user2 
CREATE USER 'UserIan'@'BillManagementSystem' IDENTIFIED WITH 
mysql_native_password BY 'ianbriggs@245';

GRANT SELECT,UPDATE ON `BillManagementSystem`.Readings TO 
'UserIan'@'BillManagementSystem';

SHOW GRANTS FOR 'UserIan'@'BillManagementSystem';

