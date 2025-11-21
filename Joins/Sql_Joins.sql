-- 	JOINS QUERY AND NOTES 

show databases;
use pythonsql;
show tables;


-- Create Customer Table
CREATE TABLE Customer (
    customerid INT PRIMARY KEY,
    customername VARCHAR(50),
    mobileno VARCHAR(15),
    city VARCHAR(30)
);
-- Insert Records into Customer Table
INSERT INTO Customer (customerid, customername, mobileno, city) VALUES
(1, 'Rahul Sharma', '9876543210', 'Delhi'),
(2, 'Priya Singh', '9123456780', 'Mumbai'),
(3, 'Amit Verma', '9988776655', 'Bangalore');

select* from Customer;


-- Create Orders Table
CREATE TABLE Orders (
    orderid INT PRIMARY KEY,
    customerid INT,
    orderdate DATE,
    FOREIGN KEY (customerid) REFERENCES Customer(customerid)
);
-- Insert Records into Orders Table
INSERT INTO Orders (orderid, customerid, orderdate) VALUES
(101, 1, '2024-11-01'),
(102, 1, '2024-11-05'),
(103, 2, '2024-11-10');

select*from Orders;

---- INNER JOIN Query
SELECT 
    c.customerid,
    c.customername,
    o.orderid,
    o.orderdate
FROM 
    Customer c
INNER JOIN 
    Orders o
ON 
    c.customerid = o.customerid;




-- LEFT JOIN / LEFT OUTER JOIN 

SELECT c.customerid, c.customername, o.orderid
FROM customer c
LEFT JOIN orders o
ON c.customerid = o.customerid;


-- RIGHT JOIN 

SELECT c.customerid, c.customername, o.orderid
FROM customer c
RIGHT JOIN orders o
ON c.customerid = o.customerid;


-- FULL JOIN (Full Join does'nt work in mysql)

-- we can use it by alternative ways (using Union)

SELECT c.customerid, c.customername, o.orderid, o.orderdate FROM Customer c
LEFT JOIN Orders o ON c.customerid = o.customerid

UNION

SELECT c.customerid, c.customername, o.orderid, o.orderdate FROM Customer c
RIGHT JOIN Orders o ON c.customerid = o.customerid;




-- CROSS JOIN 

SELECT *
FROM customer
CROSS JOIN orders;

-- 	NATURAL JOIN

SELECT *
FROM Customer NATURAL JOIN Orders;


-- Self join
SELECT c1.customerid, c1.customername, c2.customerid AS other_customerid,
c2.customername AS other_customer FROM Customer c1
JOIN Customer c2
ON 
    c1.customerid < c2.customerid;



-- UNION 
SELECT customername AS data
FROM Customer
UNION
SELECT CAST(customerid AS CHAR) AS data
FROM Orders;


-- UNION ALL
SELECT customername AS data
FROM Customer
UNION ALL
SELECT CAST(customerid AS CHAR) AS data
FROM Orders;


