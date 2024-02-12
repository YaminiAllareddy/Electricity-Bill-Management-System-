

-- Table: Electricity_company
INSERT INTO Electricity_company VALUES ('AEP Energy', '9118 Jerde Branch Suite 617 Raphaelle', '95858867167');
INSERT INTO Electricity_company VALUES ('Southern California', '592 Orrin Court Lake Skyechester', '7455068159');
INSERT INTO Electricity_company VALUES ('Beyond Power', '328 Efrain Park Denesikville', '4945998467');

-- Table: Consumer
INSERT INTO Consumer VALUES ('43242376', 'Wade Gill', '14767 Armando Avenue Apt.', '17653489375', 'AEP Energy');
INSERT INTO Consumer VALUES ('65661993', 'Ian Briggs', '5738 Jamie Turnpike Apt.', '5838241446', 'Southern California');
INSERT INTO Consumer VALUES ('50261572', 'Ivy Newman', '18826 Kuphal Islands Apt.', '2737390902', 'AEP Energy');
INSERT INTO Consumer VALUES ('1051785', 'Alana Meyer ', '74388 Furman Port Apt. 622', '2258373626','Beyond Power');
INSERT INTO Consumer VALUES ('66630947', 'Natalia Morales', '896 Liliane Parkways Suite 012', '4342293722', 'Southern California');

-- Table: Readings
INSERT INTO Readings VALUES (592, '12/5/23', '773.6 kWh', 'Analog Meter', '65661993');
INSERT INTO Readings VALUES (651, '6/1/24', '784.00 kWh', 'Digital Meter', '1051785');
INSERT INTO Readings VALUES (754, '12/2/23', '933.29 kWh', 'Smart Meter', '66630947');
INSERT INTO Readings VALUES (356, '17/10/23', '429.15 kWh', 'Digital Meter', '43242376');
INSERT INTO Readings VALUES (321, '25/01/24', '674.40 kWh', 'Prepaid Meter', '66630947');

-- Table: Tariff
INSERT INTO Tariff VALUES ('1', 'Specific tariffs', '26');
INSERT INTO Tariff VALUES ('2', 'Ad valorem tariffs', '38');
INSERT INTO Tariff VALUES ('3', 'Flat rate tariff', '42');
INSERT INTO Tariff VALUES ('4', 'Block rate tariff', '33');

-- Table: Bill
INSERT INTO Bill VALUES ('1', '2023/09/26', '2023/10/20', '762', '65661993', '754', '2');
INSERT INTO Bill VALUES ('2', '2023/05/23', '2023/06/15', '458', '66630947', '321', '1');
INSERT INTO Bill VALUES ('3', '2023/10/31', '2023/11/15', '599', '43242376', '592', '4');
INSERT INTO Bill VALUES ('4', '2023/08/30', '2023/09/19', '637', '50261572', '754', '3');
INSERT INTO Bill VALUES ('5', '2024/3/1', '2024/01/14', '514', '1051785', '592', '2');

-- Table: Payment
INSERT INTO Payment VALUES ('1', '2023/06/15', '458', 'Card', 'Paid', '66630947', '2');
INSERT INTO Payment VALUES ('2', '2023/11/10', '762', 'UPI', 'Payment successful', '65661993', '1');
INSERT INTO Payment VALUES ('3', '2024/01/14', '514', 'Cash', 'Paid', '1051785', '5');
INSERT INTO Payment VALUES ('4', '2023/11/12', '599', 'Card', 'Paid', '43242376', '3');
INSERT INTO Payment VALUES ('5', '2023/10/09', '637', 'UPI', 'Payment done', '50261572', '4');

-- Table: Usage_history
INSERT INTO Usage_history VALUES ('1', '879', '50261572', '651');
INSERT INTO Usage_history VALUES ('2', '820', '66630947', '321');
INSERT INTO Usage_history VALUES ('3', '341', '1051785', '651');
INSERT INTO Usage_history VALUES ('4', '903', '65661993', '356');

-- Table: Notification
INSERT INTO Notification VALUES ('1', 'Electricity bill is available', '458', '2023/06/15', '66630947');
INSERT INTO Notification VALUES ('2', 'Electricity bill due date is on 20-10-2023', '762', '2023/10/20', '65661993');
INSERT INTO Notification VALUES ('3', 'The electricity bill is added to your account', '514', '2024/01/14', '1051785');