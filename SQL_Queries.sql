-- SQL Query Set for Customer Order Analysis
-- Author: Akshaya
-- Created: July 2025
-- Description: This file contains table creation, data insertion, and 10 SQL queries for business analysis.

use aksh;

DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers (
  customer_id VARCHAR(10) PRIMARY KEY,
  customer_name VARCHAR(100),
  city VARCHAR(100),
  state VARCHAR(100),
  signup_date DATE
);

CREATE TABLE Orders (
  order_id INT PRIMARY KEY,
  customer_id VARCHAR(10),   -- ✅ Match with Customers table
  order_date DATE,
  total_amount DECIMAL(10,2),
  payment_mode VARCHAR(50),
  delivery_status VARCHAR(50),
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Customers (customer_id, customer_name, city, state, signup_date) VALUES
('C101', 'Akshay R', 'Chennai', 'Tamil Nadu', '2023-01-10'),
('C102', 'Sneha M', 'Hyderabad', 'Telangana', '2023-02-15'),
('C103', 'Rajiv K', 'Bangalore', 'Karnataka', '2022-11-20'),
('C104', 'Meena Iyer', 'Coimbatore', 'Tamil Nadu', '2022-10-05'),
('C105', 'Varun Singh', 'Delhi', 'Delhi', '2023-03-12'),
('C106', 'Priya Das', 'Mumbai', 'Maharashtra', '2023-04-01'),
('C107', 'Anish Jain', 'Jaipur', 'Rajasthan', '2023-02-20'),
('C108', 'Riya Sen', 'Kolkata', 'West Bengal', '2023-05-25'),
('C109', 'Suraj Nair', 'Kochi', 'Kerala', '2022-12-18'),
('C110', 'Kavya Reddy', 'Vizag', 'Andhra Pradesh', '2023-01-30'),
('C111', 'Vikas Mehra', 'Pune', 'Maharashtra', '2023-03-28');

INSERT INTO Orders (order_id, customer_id, order_date, total_amount, payment_mode, delivery_status) VALUES
(1001, 'C101', '2025-06-01', 4499, 'Card', 'Delivered'),
(1002, 'C102', '2025-06-02', 5998, 'UPI', 'Cancelled'),
(1003, 'C101', '2025-06-03', 750, 'Wallet', 'Delivered'),
(1004, 'C103', '2025-06-04', 9999, 'Card', 'Returned'),
(1005, 'C104', '2025-06-05', 720, 'COD', 'Delivered'),
(1006, 'C105', '2025-06-06', 8999, 'UPI', 'Delivered'),
(1007, 'C106', '2025-06-07', 1398, 'Wallet', 'Delivered'),
(1008, 'C101', '2025-06-08', 798, 'Card', 'Delivered'),
(1009, 'C102', '2025-06-09', 495, 'COD', 'Delivered'),
(1010, 'C107', '2025-06-10', 299, 'Wallet', 'Cancelled'),
(1011, 'C108', '2025-06-11', 999, 'Card', 'Delivered'),
(1012, 'C109', '2025-06-12', 300, 'UPI', 'Delivered'),
(1013, 'C110', '2025-06-13', 747, 'Wallet', 'In Transit'),
(1014, 'C103', '2025-06-14', 199, 'Card', 'Delivered'),
(1015, 'C111', '2025-06-15', 2499, 'COD', 'Delivered');

-- Query 1: Total revenue from all orders
SELECT SUM(total_amount) AS total_revenue
FROM Orders;

-- Query 2: Average order value
SELECT AVG(total_amount) AS avg_order_value
FROM Orders;

-- Query 3: Total number of orders per customer
SELECT c.customer_name, COUNT(o.order_id) AS total_orders
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- Query 4: Top 5 customers by total order value
SELECT c.customer_name, SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 5;

-- Query 5: Orders with value greater than ₹5000
SELECT *
FROM Orders
WHERE total_amount > 5000;

-- Query 6: Monthly order trend
SELECT 
  MONTH(order_date) AS order_month, 
  COUNT(*) AS total_orders
FROM Orders
GROUP BY order_month
ORDER BY order_month;

-- Query 7: Most popular payment modes
SELECT payment_mode, COUNT(*) AS usage_count
FROM Orders
GROUP BY payment_mode
ORDER BY usage_count DESC;

-- Query 8: Number of orders by delivery status
SELECT delivery_status, COUNT(*) AS count
FROM Orders
GROUP BY delivery_status;

-- Query 9: Average spend per city
SELECT c.city, AVG(o.total_amount) AS avg_spend
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY avg_spend DESC;

-- Query 10: CASE statement – classify orders by value
SELECT 
  order_id,
  total_amount,
  CASE 
    WHEN total_amount >= 5000 THEN 'High Value'
    WHEN total_amount BETWEEN 1000 AND 4999 THEN 'Medium Value'
    ELSE 'Low Value'
  END AS order_category
FROM Orders;