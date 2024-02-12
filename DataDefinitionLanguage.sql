-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-02-08 10:02:38.081

-- tables
-- Table: Bill
CREATE TABLE Bill (
    Bill_id int  NOT NULL,
    Bill_issued_Date date  NOT NULL,
    Bill_due_date date  NOT NULL,
    Total_amount decimal(6,2)  NOT NULL,
    Consumer_number int  NOT NULL,
    Reading_id int  NOT NULL,
    Tariff_id int  NOT NULL,
    CONSTRAINT Bill_pk PRIMARY KEY (Bill_id)
);

-- Table: Consumer
CREATE TABLE Consumer (
    Consumer_number int  NOT NULL,
    Full_name varchar(20)  NOT NULL,
    Address varchar(30)  NOT NULL,
    Phone_number Varchar(15)  NOT NULL,
    Electricity_name Varchar(30)  NOT NULL,
    CONSTRAINT Consumer_pk PRIMARY KEY (Consumer_number)
);

-- Table: Electricity_company
CREATE TABLE Electricity_company (
    Electricity_name Varchar(30)  NOT NULL,
    Address varchar(40)  NULL,
    Phone_number Varchar(15)  NULL,
    CONSTRAINT Electricity_company_pk PRIMARY KEY (Electricity_name)
);

-- Table: Notification
CREATE TABLE Notification (
    Notification_id int  NOT NULL,
    Message Varchar(50)  NOT NULL,
    Total_amount int  NOT NULL,
    Due_date date  NOT NULL,
    Consumer_number int  NOT NULL,
    CONSTRAINT Notification_pk PRIMARY KEY (Notification_id)
);

-- Table: Payment
CREATE TABLE Payment (
    Payment_id int  NOT NULL,
    Payment_date date  NOT NULL,
    Amount_paid decimal(6,2)  NOT NULL,
    Payment_type varchar(20)  NOT NULL,
    Payment_status varchar(25)  NOT NULL,
    Consumer_number int  NOT NULL,
    Bill_id int  NOT NULL,
    CONSTRAINT Payment_pk PRIMARY KEY (Payment_id)
);

-- Table: Readings
CREATE TABLE Readings (
    Reading_id int  NOT NULL,
    Reading_date date  NOT NULL,
    Reading_value varchar(20)  NOT NULL,
    Meter_type varchar(20)  NOT NULL,
    Consumer_number int  NOT NULL,
    CONSTRAINT Readings_pk PRIMARY KEY (Reading_id)
);

-- Table: Tariff
CREATE TABLE Tariff (
    Tariff_id int  NOT NULL,
    Traiff_type varchar(30)  NOT NULL,
    Unit_rate decimal(6,2)  NOT NULL,
    CONSTRAINT Tariff_pk PRIMARY KEY (Tariff_id)
);

-- Table: Usage_history
CREATE TABLE Usage_history (
    Usage_history_id int  NOT NULL,
    Total_comsumption varchar(20)  NOT NULL,
    Consumer_number int  NOT NULL,
    Reading_id int  NOT NULL,
    CONSTRAINT Usage_history_pk PRIMARY KEY (Usage_history_id)
);

-- foreign keys
-- Reference: Bill_Consumer (table: Bill)
ALTER TABLE Bill ADD CONSTRAINT Bill_Consumer FOREIGN KEY Bill_Consumer (Consumer_number)
    REFERENCES Consumer (Consumer_number);

-- Reference: Bill_Readings (table: Bill)
ALTER TABLE Bill ADD CONSTRAINT Bill_Readings FOREIGN KEY Bill_Readings (Reading_id)
    REFERENCES Readings (Reading_id);

-- Reference: Bill_Tariff (table: Bill)
ALTER TABLE Bill ADD CONSTRAINT Bill_Tariff FOREIGN KEY Bill_Tariff (Tariff_id)
    REFERENCES Tariff (Tariff_id);

-- Reference: Consumer_Electricity_company (table: Consumer)
ALTER TABLE Consumer ADD CONSTRAINT Consumer_Electricity_company FOREIGN KEY Consumer_Electricity_company (Electricity_name)
    REFERENCES Electricity_company (Electricity_name);

-- Reference: Notification_Consumer (table: Notification)
ALTER TABLE Notification ADD CONSTRAINT Notification_Consumer FOREIGN KEY Notification_Consumer (Consumer_number)
    REFERENCES Consumer (Consumer_number);

-- Reference: Payment_Bill (table: Payment)
ALTER TABLE Payment ADD CONSTRAINT Payment_Bill FOREIGN KEY Payment_Bill (Bill_id)
    REFERENCES Bill (Bill_id);

-- Reference: Payment_Consumer (table: Payment)
ALTER TABLE Payment ADD CONSTRAINT Payment_Consumer FOREIGN KEY Payment_Consumer (Consumer_number)
    REFERENCES Consumer (Consumer_number);

-- Reference: Readings_Consumer (table: Readings)
ALTER TABLE Readings ADD CONSTRAINT Readings_Consumer FOREIGN KEY Readings_Consumer (Consumer_number)
    REFERENCES Consumer (Consumer_number);

-- Reference: Usage_history_Consumer (table: Usage_history)
ALTER TABLE Usage_history ADD CONSTRAINT Usage_history_Consumer FOREIGN KEY Usage_history_Consumer (Consumer_number)
    REFERENCES Consumer (Consumer_number);

-- Reference: Usage_history_Readings (table: Usage_history)
ALTER TABLE Usage_history ADD CONSTRAINT Usage_history_Readings FOREIGN KEY Usage_history_Readings (Reading_id)
    REFERENCES Readings (Reading_id);

-- End of file.

