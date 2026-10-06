-- bankdb_setup.sql | BankDB sample database for the BI course
-- Platform: SQL Server (SSMS). Open in SSMS and press F5.

CREATE DATABASE BankDB;
GO
USE BankDB;
GO

CREATE TABLE dbo.Branches (
    BranchID   INT PRIMARY KEY,
    BranchName NVARCHAR(50) NOT NULL,
    City       NVARCHAR(50) NOT NULL
);

CREATE TABLE dbo.Customers (
    CustomerID INT PRIMARY KEY,
    FirstName  NVARCHAR(50) NOT NULL,
    LastName   NVARCHAR(50) NOT NULL,
    City       NVARCHAR(50),
    JoinDate   DATE
);

CREATE TABLE dbo.Accounts (
    AccountID   INT PRIMARY KEY,
    CustomerID  INT NOT NULL REFERENCES dbo.Customers(CustomerID),
    BranchID    INT NOT NULL REFERENCES dbo.Branches(BranchID),
    AccountType NVARCHAR(20),
    OpenDate    DATE,
    Balance     DECIMAL(12,2)
);

CREATE TABLE dbo.Transactions (
    TransactionID   INT IDENTITY(1,1) PRIMARY KEY,
    AccountID       INT NOT NULL REFERENCES dbo.Accounts(AccountID),
    TransactionDate DATE NOT NULL,
    TransactionType NVARCHAR(20) NOT NULL,   -- Deposit, Withdrawal, Transfer, Fee
    Amount          DECIMAL(12,2) NOT NULL
);

CREATE TABLE dbo.Loans (
    LoanID       INT PRIMARY KEY,
    CustomerID   INT NOT NULL REFERENCES dbo.Customers(CustomerID),
    BranchID     INT NOT NULL REFERENCES dbo.Branches(BranchID),
    LoanType     NVARCHAR(20),
    Principal    DECIMAL(12,2),
    InterestRate DECIMAL(5,2),
    StartDate    DATE,
    Status       NVARCHAR(20)
);
GO

INSERT INTO dbo.Branches VALUES
(1, 'Richmond Hill Main', 'Richmond Hill'),
(2, 'Toronto Downtown',   'Toronto'),
(3, 'Markham Centre',     'Markham');

INSERT INTO dbo.Customers VALUES
(1, 'Sara',  'Ahmadi', 'Richmond Hill', '2021-03-15'),
(2, 'John',  'Smith',  'Toronto',       '2019-07-01'),
(3, 'Li',    'Chen',   'Markham',       '2022-01-20'),
(4, 'Maria', 'Garcia', 'Toronto',       '2023-05-10'),
(5, 'David', 'Brown',  'Richmond Hill', '2020-11-05'),
(6, 'Emily', 'Wilson', 'Markham',       '2024-02-28');   -- no account yet

INSERT INTO dbo.Accounts VALUES
(1001, 1, 1, 'Chequing', '2021-03-15',  2500.00),
(1002, 1, 1, 'Savings',  '2021-04-01', 12000.00),
(1003, 2, 2, 'Chequing', '2019-07-01',   850.50),
(1004, 3, 3, 'Savings',  '2022-01-20', 30000.00),
(1005, 4, 2, 'Chequing', '2023-05-10',  4200.00),
(1006, 5, 1, 'Chequing', '2020-11-05',   150.00),
(1007, 5, 1, 'Savings',  '2024-06-01',     0.00);   -- no transactions

INSERT INTO dbo.Transactions (AccountID, TransactionDate, TransactionType, Amount) VALUES
(1001, '2026-07-02', 'Deposit',    3000.00),
(1001, '2026-07-05', 'Withdrawal',  400.00),
(1001, '2026-08-01', 'Fee',          15.00),
(1002, '2026-07-15', 'Deposit',    1000.00),
(1003, '2026-07-03', 'Deposit',    1200.00),
(1003, '2026-07-20', 'Withdrawal',  350.00),
(1003, '2026-08-10', 'Withdrawal',  200.00),
(1004, '2026-07-30', 'Deposit',    5000.00),
(1004, '2026-09-01', 'Transfer',   2000.00),
(1005, '2026-08-05', 'Deposit',    2500.00),
(1005, '2026-08-18', 'Withdrawal',  900.00),
(1005, '2026-09-02', 'Fee',          15.00),
(1006, '2026-07-11', 'Withdrawal',   60.00),
(1006, '2026-09-15', 'Deposit',     200.00);

INSERT INTO dbo.Loans VALUES
(1, 2, 2, 'Mortgage',       450000.00, 4.79, '2022-06-01', 'Active'),
(2, 3, 3, 'Car',             35000.00, 6.50, '2024-03-15', 'Active'),
(3, 5, 1, 'Personal',        10000.00, 8.99, '2021-01-10', 'Closed'),
(4, 1, 1, 'Line of Credit',  20000.00, 7.25, '2025-09-01', 'Active');
GO

-- Test: you should see 3 branches
SELECT * FROM dbo.Branches;