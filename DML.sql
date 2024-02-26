
-- two insert statements
INSERT INTO Consumer VALUES ('66630948', 'Charles Miller', '9561 DuBuque Light Framimouth', '5748230422', 'AEP Energy');

INSERT INTO Tariff VALUES ('5', 'Revenue Tariff', '35');



-- two update statements
-- i
SELECT * FROM Electricity_company
WHERE Electricity_name='Beyond Power';


UPDATE Electricity_company
SET Phone_number='8026011144'
WHERE Electricity_name='Beyond Power';

-- ii
SELECT * FROM Tariff WHERE Tariff_id='4';

UPDATE Tariff
SET Unit_rate='30'
WHERE Tariff_id='4';


-- delete statement
SELECT * FROM Consumer WHERE Consumer_number='66630948';

DELETE FROM Consumer WHERE Consumer_number='66630948';


-- select statement
SELECT * FROM Readings;

-- 2 join statements
-- i
SELECT EC.Electricity_name, C.Full_name, C.Phone_number
FROM Consumer C JOIN Electricity_company EC 
ON EC.Electricity_name = C.Electricity_name;

-- ii
SELECT T.Traiff_type, T.Unit_rate, B.Consumer_number, B.Total_amount
FROM Tariff T JOIN Bill B 
ON T.Tariff_id=B.Tariff_id;

-- two summary statements
-- i
SELECT Consumer_number, SUM(Total_amount) AS 'TOTALAMOUNT'
FROM Bill
GROUP BY Consumer_number
ORDER BY TOTALAMOUNT;

-- ii
SELECT Reading_id, AVG(Total_comsumption) AS 'AVGCONSUMPTION'
FROM Usage_history
GROUP BY Reading_id
ORDER BY AVGCONSUMPTION;



-- multi-table query
SELECT EC.Electricity_name, C.Full_name, B.Bill_issued_Date, P.Amount_paid
FROM Electricity_company EC JOIN Consumer C 
ON EC.Electricity_name=C.Electricity_name
JOIN Bill B ON C.Consumer_number=B.Consumer_number
JOIN Payment P ON B.Bill_id=P.Bill_id;


-- query of your choice
SELECT C.Full_name, H.Reading_id, H.Total_comsumption
FROM Consumer C JOIN Usage_history H
ON C.Consumer_number = H.Consumer_number;
