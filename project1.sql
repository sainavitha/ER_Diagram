create database Electricitybill;
use Electricitybill;
CREATE TABLE Customer (
    Cust_Id INT PRIMARY KEY,
    Cust_Name VARCHAR(255),
    Address VARCHAR(255),
    State VARCHAR(255),
    City VARCHAR(255),
    Pincode VARCHAR(10)
);
CREATE TABLE Admin (
    Admin_Id INT PRIMARY KEY,
    Admin_Name VARCHAR(255),
    Cust_Id INT,
    FOREIGN KEY (Cust_Id) REFERENCES Customer(Cust_Id)
);
CREATE TABLE Account (
    Acc_Id INT PRIMARY KEY,
    Acc_Name VARCHAR(255),
    Cust_Id INT,
    Name VARCHAR(255),
    FOREIGN KEY (Cust_Id) REFERENCES Customer(Cust_Id)
);
CREATE TABLE Billing (
    Meter_Number INT PRIMARY KEY,
    Acc_Id INT,
    Cust_Id INT,
    Amount DECIMAL(10, 2),
    Per_Unit DECIMAL(10, 2),
    Monthly_Units INT,
    FOREIGN KEY (Acc_Id) REFERENCES Account(Acc_Id),
    FOREIGN KEY (Cust_Id) REFERENCES Customer(Cust_Id)
);
CREATE TABLE Tariff (
    Tariff_Id INT PRIMARY KEY,
    Tariff_Type VARCHAR(255)
);
CREATE TABLE Elec_Board (
    Eboard_Id INT PRIMARY KEY,
    Board_Name VARCHAR(255)
);
CREATE TABLE Invoice (
    Invoice_Id INT PRIMARY KEY,
    Eboard_Id INT,
    Tariff_Id INT,
    Acc_No INT,
    Reading_Date DATE,
    Meter_Number INT,
    FOREIGN KEY (Eboard_Id) REFERENCES Elec_Board(Eboard_Id),
    FOREIGN KEY (Tariff_Id) REFERENCES Tariff(Tariff_Id),
    FOREIGN KEY (Acc_No) REFERENCES Account(Acc_Id),
    FOREIGN KEY (Meter_Number) REFERENCES Billing(Meter_Number)
);
