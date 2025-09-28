mysql> -- Create Database
mysql> CREATE DATABASE EcommerceDB;
Query OK, 1 row affected (0.01 sec)

mysql> USE EcommerceDB;
Database changed
mysql>
mysql> -- Customers Table
mysql> CREATE TABLE Customers (
    ->     CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    ->     FirstName VARCHAR(50) NOT NULL,
    ->     LastName VARCHAR(50) NOT NULL,
    ->     Email VARCHAR(100) UNIQUE,
    ->     Phone VARCHAR(20),
    ->     City VARCHAR(50),
    ->     Country VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql>
mysql> -- Products Table
mysql> CREATE TABLE Products (
    ->     ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ->     ProductName VARCHAR(100) NOT NULL,
    ->     Category VARCHAR(50),
    ->     Price DECIMAL(10,2),
    ->     Stock INT
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql>
mysql> -- Orders Table
mysql> CREATE TABLE Orders (
    ->     OrderID INT AUTO_INCREMENT PRIMARY KEY,
    ->     CustomerID INT,
    ->     OrderDate DATE,
    ->     TotalAmount DECIMAL(10,2),
    ->     FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql>
mysql> -- OrderDetails Table
mysql> CREATE TABLE OrderDetails (
    ->     OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    ->     OrderID INT,
    ->     ProductID INT,
    ->     Quantity INT,
    ->     Subtotal DECIMAL(10,2),
    ->     FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    ->     FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql>
mysql> -- Insert Customers
mysql> INSERT INTO Customers (FirstName, LastName, Email, Phone, City, Country) VALUES
    -> ('John', 'Doe', 'john@example.com', '1234567890', 'New York', 'USA'),
    -> ('Jane', 'Smith', 'jane@example.com', '9876543210', 'Los Angeles', 'USA'),
    -> ('Amit', 'Kumar', 'amit@example.com', '9988776655', 'Delhi', 'India'),
    -> ('Sara', 'Lee', 'sara@example.com', '1122334455', 'London', 'UK');
Query OK, 4 rows affected (0.02 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql>
mysql> -- Insert Products
mysql> INSERT INTO Products (ProductName, Category, Price, Stock) VALUES
    -> ('Laptop', 'Electronics', 800.00, 10),
    -> ('Smartphone', 'Electronics', 500.00, 20),
    -> ('Shoes', 'Fashion', 50.00, 100),
    -> ('Watch', 'Accessories', 150.00, 30);
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql>
mysql> -- Insert Orders
mysql> INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
    -> (1, '2025-09-01', 1300.00),
    -> (2, '2025-09-05', 500.00),
    -> (3, '2025-09-10', 200.00);
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql>
mysql> -- Insert OrderDetails
mysql> INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Subtotal) VALUES
    -> (1, 1, 1, 800.00),
    -> (1, 2, 1, 500.00),
    -> (2, 2, 1, 500.00),
    -> (3, 3, 4, 200.00);
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql>
mysql> -- Create a View for High Value Customers
mysql> CREATE VIEW HighValueCustomers AS
    -> SELECT c.CustomerID, c.FirstName, c.LastName, SUM(o.TotalAmount) AS TotalSpent
    -> FROM Customers c
    -> JOIN Orders o ON c.CustomerID = o.CustomerID
    -> GROUP BY c.CustomerID, c.FirstName, c.LastName
    -> HAVING SUM(o.TotalAmount) > 500;
Query OK, 0 rows affected (0.03 sec)

mysql> USE EcommerceDB;
Database changed
mysql> SHOW TABLES;
+-----------------------+
| Tables_in_ecommercedb |
+-----------------------+
| customers             |
| highvaluecustomers    |
| orderdetails          |
| orders                |
| products              |
+-----------------------+
5 rows in set (0.14 sec)

mysql> SELECT * FROM Customers;
+------------+-----------+----------+------------------+------------+-------------+---------+
| CustomerID | FirstName | LastName | Email            | Phone      | City        | Country |
+------------+-----------+----------+------------------+------------+-------------+---------+
|          1 | John      | Doe      | john@example.com | 1234567890 | New York    | USA     |
|          2 | Jane      | Smith    | jane@example.com | 9876543210 | Los Angeles | USA     |
|          3 | Amit      | Kumar    | amit@example.com | 9988776655 | Delhi       | India   |
|          4 | Sara      | Lee      | sara@example.com | 1122334455 | London      | UK      |
+------------+-----------+----------+------------------+------------+-------------+---------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM Products;
+-----------+-------------+-------------+--------+-------+
| ProductID | ProductName | Category    | Price  | Stock |
+-----------+-------------+-------------+--------+-------+
|         1 | Laptop      | Electronics | 800.00 |    10 |
|         2 | Smartphone  | Electronics | 500.00 |    20 |
|         3 | Shoes       | Fashion     |  50.00 |   100 |
|         4 | Watch       | Accessories | 150.00 |    30 |
+-----------+-------------+-------------+--------+-------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM Orders;
+---------+------------+------------+-------------+
| OrderID | CustomerID | OrderDate  | TotalAmount |
+---------+------------+------------+-------------+
|       1 |          1 | 2025-09-01 |     1300.00 |
|       2 |          2 | 2025-09-05 |      500.00 |
|       3 |          3 | 2025-09-10 |      200.00 |
+---------+------------+------------+-------------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM OrderDetails;
+---------------+---------+-----------+----------+----------+
| OrderDetailID | OrderID | ProductID | Quantity | Subtotal |
+---------------+---------+-----------+----------+----------+
|             1 |       1 |         1 |        1 |   800.00 |
|             2 |       1 |         2 |        1 |   500.00 |
|             3 |       2 |         2 |        1 |   500.00 |
|             4 |       3 |         3 |        4 |   200.00 |
+---------------+---------+-----------+----------+----------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM OrderDetails;
+---------------+---------+-----------+----------+----------+
| OrderDetailID | OrderID | ProductID | Quantity | Subtotal |
+---------------+---------+-----------+----------+----------+
|             1 |       1 |         1 |        1 |   800.00 |
|             2 |       1 |         2 |        1 |   500.00 |
|             3 |       2 |         2 |        1 |   500.00 |
|             4 |       3 |         3 |        4 |   200.00 |
+---------------+---------+-----------+----------+----------+
4 rows in set (0.00 sec)

mysql> -- 1. Show all Customers with their Orders
mysql> SELECT c.FirstName, c.LastName, o.OrderID, o.OrderDate, o.TotalAmount
    -> FROM Customers c
    -> JOIN Orders o ON c.CustomerID = o.CustomerID;
+-----------+----------+---------+------------+-------------+
| FirstName | LastName | OrderID | OrderDate  | TotalAmount |
+-----------+----------+---------+------------+-------------+
| John      | Doe      |       1 | 2025-09-01 |     1300.00 |
| Jane      | Smith    |       2 | 2025-09-05 |      500.00 |
| Amit      | Kumar    |       3 | 2025-09-10 |      200.00 |
+-----------+----------+---------+------------+-------------+
3 rows in set (0.00 sec)

mysql>
mysql> -- 2. Total Revenue from all Orders
mysql> SELECT SUM(TotalAmount) AS TotalRevenue
    -> FROM Orders;
+--------------+
| TotalRevenue |
+--------------+
|      2000.00 |
+--------------+
1 row in set (0.01 sec)

mysql>
mysql> -- 3. Average Revenue Per User (ARPU)
mysql> SELECT AVG(CustomerTotal) AS AvgRevenuePerCustomer
    -> FROM (
    ->     SELECT CustomerID, SUM(TotalAmount) AS CustomerTotal
    ->     FROM Orders
    ->     GROUP BY CustomerID
    -> ) AS sub;
+-----------------------+
| AvgRevenuePerCustomer |
+-----------------------+
|            666.666667 |
+-----------------------+
1 row in set (0.01 sec)

mysql>
mysql> -- 4. Most Popular Products (by quantity sold)
mysql> SELECT p.ProductName, SUM(od.Quantity) AS TotalSold
    -> FROM Products p
    -> JOIN OrderDetails od ON p.ProductID = od.ProductID
    -> GROUP BY p.ProductName
    -> ORDER BY TotalSold DESC;
+-------------+-----------+
| ProductName | TotalSold |
+-------------+-----------+
| Shoes       |         4 |
| Smartphone  |         2 |
| Laptop      |         1 |
+-------------+-----------+
3 rows in set (0.00 sec)

mysql>
mysql> -- 5. Revenue by Product Category
mysql> SELECT p.Category, SUM(od.Subtotal) AS CategoryRevenue
    -> FROM Products p
    -> JOIN OrderDetails od ON p.ProductID = od.ProductID
    -> GROUP BY p.Category;
+-------------+-----------------+
| Category    | CategoryRevenue |
+-------------+-----------------+
| Electronics |         1800.00 |
| Fashion     |          200.00 |
+-------------+-----------------+
2 rows in set (0.00 sec)

mysql>
mysql> -- 6. Customers from India only
mysql> SELECT * FROM Customers WHERE Country = 'India';
+------------+-----------+----------+------------------+------------+-------+---------+
| CustomerID | FirstName | LastName | Email            | Phone      | City  | Country |
+------------+-----------+----------+------------------+------------+-------+---------+
|          3 | Amit      | Kumar    | amit@example.com | 9988776655 | Delhi | India   |
+------------+-----------+----------+------------------+------------+-------+---------+
1 row in set (0.00 sec)

mysql>
mysql> -- 7. Orders placed in September 2025
mysql> SELECT * FROM Orders
    -> WHERE OrderDate BETWEEN '2025-09-01' AND '2025-09-30';
+---------+------------+------------+-------------+
| OrderID | CustomerID | OrderDate  | TotalAmount |
+---------+------------+------------+-------------+
|       1 |          1 | 2025-09-01 |     1300.00 |
|       2 |          2 | 2025-09-05 |      500.00 |
|       3 |          3 | 2025-09-10 |      200.00 |
+---------+------------+------------+-------------+
3 rows in set (0.00 sec)

mysql>
mysql> -- 8. Highest Spending Customer
mysql> SELECT c.FirstName, c.LastName, SUM(o.TotalAmount) AS TotalSpent
    -> FROM Customers c
    -> JOIN Orders o ON c.CustomerID = o.CustomerID
    -> GROUP BY c.CustomerID
    -> ORDER BY TotalSpent DESC
    -> LIMIT 1;
+-----------+----------+------------+
| FirstName | LastName | TotalSpent |
+-----------+----------+------------+
| John      | Doe      |    1300.00 |
+-----------+----------+------------+
1 row in set (0.00 sec)

mysql>