CREATE DATABASE GroceryStoreDB;
USE GroceryStoreDB;

-- 2. Create Tables
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    StockQuantity INT
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Phone VARCHAR(15)
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    QuantitySold INT,
    SaleDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- 3. Insert Sample Data
INSERT INTO Products VALUES
(1, 'Apples', 'Fruits', 120.00, 50),
(2, 'Milk', 'Dairy', 45.00, 30),
(3, 'Bread', 'Bakery', 35.00, 20),
(4, 'Eggs', 'Poultry', 5.00, 200);

INSERT INTO Customers VALUES
(101, 'Rahul', 'Sharma', '9876543210'),
(102, 'Priya', 'Verma', '9876501234');

INSERT INTO Sales VALUES
(1, 1, 101, 2, '2025-08-10'),
(2, 3, 102, 1, '2025-08-10'),
(3, 4, 101, 12, '2025-08-09');

-- 4. Example Queries

-- Show sales with customer and product details
SELECT s.SaleID, c.FirstName, p.ProductName, s.QuantitySold, s.SaleDate
FROM Sales s
JOIN Customers c ON s.CustomerID = c.CustomerID
JOIN Products p ON s.ProductID = p.ProductID;

-- Check products with low stock
SELECT ProductName, StockQuantity
FROM Products
WHERE StockQuantity < 10;

-- Calculate total sales per product
SELECT p.ProductName, SUM(s.QuantitySold) AS TotalSold
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY p.ProductName;

-- Update stock after a sale
UPDATE Products
SET StockQuantity = StockQuantity - 2
WHERE ProductID = 1;

