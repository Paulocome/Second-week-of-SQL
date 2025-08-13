-- ==========================================
-- SQL Project: Customers and Sales
-- ==========================================

-- 1. Create Tables
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    City VARCHAR(50)
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    CustomerID INT,
    Amount DECIMAL(10,2),
    Date DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- 2. Interactive Insertion of Customers
DECLARE @CustomerID INT;
DECLARE @Name VARCHAR(50);
DECLARE @City VARCHAR(50);

-- Example sequential input (replace with actual user input)
SET @CustomerID = 1;
SET @Name = 'Ana Silva';
SET @City = 'Maputo';

INSERT INTO Customers (CustomerID, Name, City)
VALUES (@CustomerID, @Name, @City);

-- Repeat insertion as needed for other customers
-- Example:
SET @CustomerID = 2;
SET @Name = 'John Costa';
SET @City = 'Beira';

INSERT INTO Customers (CustomerID, Name, City)
VALUES (@CustomerID, @Name, @City);

-- 3. Interactive Insertion of Sales
DECLARE @SaleID INT;
DECLARE @Amount DECIMAL(10,2);
DECLARE @SaleDate DATE;

SET @SaleID = 101;
SET @CustomerID = 1; -- link to existing customer
SET @Amount = 500.00;
SET @SaleDate = '2025-08-01';

INSERT INTO Sales (SaleID, CustomerID, Amount, Date)
VALUES (@SaleID, @CustomerID, @Amount, @SaleDate);

-- Repeat insertion for other sales

-- 4. Example Queries

-- a) Select all customers
SELECT * FROM Customers;

-- b) Select customers from Maputo
SELECT * FROM Customers
WHERE City = 'Maputo';

-- c) Select customers whose name starts with "A"
SELECT * FROM Customers
WHERE Name LIKE 'A%';

-- d) Select sales with amount >= 500
SELECT * FROM Sales
WHERE Amount >= 500;

-- e) Select sales of customers from Maputo with amount >= 500
SELECT c.Name, s.Amount, s.Date
FROM Customers c
JOIN Sales s ON c.CustomerID = s.CustomerID
WHERE c.City = 'Maputo' AND s.Amount >= 500;

-- 5. Summary:
-- SELECT   -> retrieves data
-- WHERE    -> filters records
-- %        -> wildcard for text patterns
-- >=       -> comparison operator
-- JOIN     -> combines data from multiple tables
