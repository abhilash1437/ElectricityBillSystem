-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-04-12 02:12:57.34

-- tables
-- Table: Account
CREATE TABLE Account (
    AccountId int  NOT NULL,
    CustId int  NOT NULL,
    AccountNo int  NOT NULL,
    ElectricityBoardId varchar(100)  NOT NULL,
    Customer_CustId int  NOT NULL,
    CONSTRAINT Account_pk PRIMARY KEY (AccountId)
);

-- Table: Admin
CREATE TABLE Admin (
    AdminId int  NOT NULL,
    AdminName varchar(100)  NOT NULL,
    LoginId int  NOT NULL,
    Password varchar(100)  NOT NULL,
    AdminType varchar(100)  NOT NULL,
    CONSTRAINT Admin_pk PRIMARY KEY (AdminId)
);

-- Table: Billing
CREATE TABLE Billing (
    BillingId int  NOT NULL,
    CustId int  NOT NULL,
    AccountId int  NOT NULL,
    PaymentMode varchar(100)  NOT NULL,
    PaymentDate datetime  NOT NULL,
    BillAmount float  NOT NULL,
    PaidAmount float  NOT NULL,
    ExcessPaid float  NOT NULL,
    Customer_CustId int  NOT NULL,
    CONSTRAINT Billing_pk PRIMARY KEY (BillingId)
);

-- Table: Customer
CREATE TABLE Customer (
    CustId int  NOT NULL,
    CustName varchar(100)  NOT NULL,
    Address varchar(200)  NOT NULL,
    Email varchar(100)  NOT NULL,
    CONSTRAINT Customer_pk PRIMARY KEY (CustId)
);

-- Table: ElectricityBoard
CREATE TABLE ElectricityBoard (
    ElectricityBoardId varchar(50)  NOT NULL,
    ElectricityBoardAddress varchar(100)  NOT NULL,
    Account_AccountId int  NOT NULL,
    CONSTRAINT ElectricityBoard_pk PRIMARY KEY (ElectricityBoardId)
);

-- Table: FeedBack
CREATE TABLE FeedBack (
    FeedbackId int  NOT NULL,
    CustId int  NOT NULL,
    Feedback varchar(200)  NOT NULL,
    Customer_CustId int  NOT NULL,
    CONSTRAINT FeedBack_pk PRIMARY KEY (FeedbackId)
);

-- Table: Invoice
CREATE TABLE Invoice (
    InvoiceId varchar(50)  NOT NULL,
    ElectricityBoardID varchar(50)  NOT NULL,
    AccountID int  NOT NULL,
    CustID int  NOT NULL,
    ElectricityBoard_ElectricityBoardId varchar(50)  NOT NULL,
    TariffId varchar(100)  NOT NULL,
    Tariff_TariffId varchar(100)  NOT NULL,
    CONSTRAINT Invoice_pk PRIMARY KEY (InvoiceId)
);

-- Table: Tariff
CREATE TABLE Tariff (
    TariffId varchar(100)  NOT NULL,
    TariffType varchar(100)  NOT NULL,
    TariffDescription varchar(200)  NOT NULL,
    CONSTRAINT Tariff_pk PRIMARY KEY (TariffId)
);

-- foreign keys
-- Reference: Account_Customer (table: Account)
ALTER TABLE Account ADD CONSTRAINT Account_Customer FOREIGN KEY Account_Customer (Customer_CustId)
    REFERENCES Customer (CustId);

-- Reference: Billing_Customer (table: Billing)
ALTER TABLE Billing ADD CONSTRAINT Billing_Customer FOREIGN KEY Billing_Customer (Customer_CustId)
    REFERENCES Customer (CustId);

-- Reference: ElectricityBoard_Account (table: ElectricityBoard)
ALTER TABLE ElectricityBoard ADD CONSTRAINT ElectricityBoard_Account FOREIGN KEY ElectricityBoard_Account (Account_AccountId)
    REFERENCES Account (AccountId);

-- Reference: FeedBack_Customer (table: FeedBack)
ALTER TABLE FeedBack ADD CONSTRAINT FeedBack_Customer FOREIGN KEY FeedBack_Customer (Customer_CustId)
    REFERENCES Customer (CustId);

-- Reference: Invoice_ElectricityBoard (table: Invoice)
ALTER TABLE Invoice ADD CONSTRAINT Invoice_ElectricityBoard FOREIGN KEY Invoice_ElectricityBoard (ElectricityBoard_ElectricityBoardId)
    REFERENCES ElectricityBoard (ElectricityBoardId);

-- Reference: Invoice_Tariff (table: Invoice)
ALTER TABLE Invoice ADD CONSTRAINT Invoice_Tariff FOREIGN KEY Invoice_Tariff (Tariff_TariffId)
    REFERENCES Tariff (TariffId);

-- End of file.

