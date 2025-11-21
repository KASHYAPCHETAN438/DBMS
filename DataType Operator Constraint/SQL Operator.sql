-- ============================================================
--                 SELECT DATABASE & TABLES
-- ============================================================

SHOW DATABASES;
USE sql_practices;
SHOW TABLES;

-- ============================================================
--                 CREATE EMPLOYEES TABLE
-- ============================================================

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Age INT,
    DepartmentID INT,
    Salary DECIMAL(10,2),
    City VARCHAR(50)
);

-- ============================================================
--            INSERT DATA INTO EMPLOYEES TABLE
-- ============================================================

INSERT INTO Employees (EmpID, EmpName, Age, DepartmentID, Salary, City)
VALUES
(1, 'Amit', 25, 101, 35000, 'Delhi'),
(2, 'Priya', 28, 102, 42000, 'Mumbai'),
(3, 'Ravi', 30, 103, 50000, 'Bangalore'),
(4, 'Neha', 22, 101, 30000, 'Delhi'),
(5, 'Rahul', 35, 104, 60000, 'Pune'),
(6, 'Sneha', 29, 103, 55000, 'Chennai'),
(7, 'Arjun', 31, 102, 48000, 'Mumbai');

-- Inserting NULL value correctly
INSERT INTO Employees (EmpID, EmpName, Age, DepartmentID, Salary, City)
VALUES (8, 'Ankur', 31, 102, 48000, NULL);

COMMIT;

-- ============================================================
--                 CREATE DEPARTMENT TABLE
-- ============================================================

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DeptName VARCHAR(50),
    Location VARCHAR(50)
);

-- ============================================================
--            INSERT DATA INTO DEPARTMENT TABLE
-- ============================================================

INSERT INTO Departments (DepartmentID, DeptName, Location)
VALUES
(101, 'HR', 'Delhi'),
(102, 'Finance', 'Mumbai'),
(103, 'IT', 'Bangalore'),
(104, 'Marketing', 'Pune'),
(105, 'Sales', 'Kolkata');

COMMIT;

-- ============================================================
--                 VIEW ALL TABLES
-- ============================================================

SHOW TABLES;
SELECT * FROM Departments;
SELECT * FROM Employees;

-- ============================================================
--                 ARITHMETIC OPERATORS
-- ============================================================

SELECT EmpName, Salary + 2000 AS new_salary FROM Employees;
SELECT EmpName, Salary - 2000 AS new_salary FROM Employees;
SELECT EmpName, Salary * 0.13 AS new_salary FROM Employees;
SELECT EmpName, Salary / 10 AS new_salary FROM Employees;
SELECT EmpName, Salary % 10 AS new_salary FROM Employees;

-- ============================================================
--                 COMPARISON OPERATORS
-- ============================================================

SELECT EmpName, City FROM Employees WHERE City = 'Delhi';
SELECT EmpName, City FROM Employees WHERE City != 'Delhi';
SELECT EmpName, Age FROM Employees WHERE Age > 25;
SELECT EmpName, Salary FROM Employees WHERE Salary < 50000;
SELECT EmpName, Age FROM Employees WHERE Age >= 28;
SELECT EmpName, Age FROM Employees WHERE Age <= 25;

-- ============================================================
--                 LOGICAL OPERATORS
-- ============================================================

SELECT Age, City FROM Employees WHERE Age > 18 AND City = 'Delhi';
SELECT Age, City FROM Employees WHERE City = 'Delhi' OR City = 'Mumbai';
SELECT Age, City FROM Employees WHERE NOT City = 'Delhi';

-- ============================================================
--                 BITWISE OPERATORS
-- ============================================================

SELECT 5 & 3 AS Bitwise_AND;
SELECT 5 | 3 AS Bitwise_OR;
SELECT 5 ^ 3 AS Bitwise_XOR;

-- ============================================================
--                 SPECIAL OPERATORS
-- ============================================================

-- BETWEEN
SELECT EmpName, Salary 
FROM Employees 
WHERE Salary BETWEEN 30000 AND 50000;

-- IN 
SELECT EmpName, Salary 
FROM Employees 
WHERE City IN ('Delhi','Mumbai','Pune');

-- IS NULL
SELECT EmpName, Salary 
FROM Employees 
WHERE City IS NULL;

-- IS NOT NULL
SELECT EmpName, Salary 
FROM Employees 
WHERE City IS NOT NULL;

-- EXISTS  (Corrected spelling of table)
SELECT EmpName, Salary 
FROM Employees 
WHERE EXISTS (SELECT * FROM Departments);

-- ANY (Interns table must exist)
-- SELECT EmpName, Salary FROM Employees WHERE Salary > ANY (SELECT Salary FROM Interns);

-- ALL (Interns table must exist)
-- SELECT EmpName, Salary FROM Employees WHERE Salary > ALL (SELECT Salary FROM Interns);

-- ============================================================
--     CREATE WORDS TABLE FOR LIKE OPERATOR PRACTICE
-- ============================================================

CREATE TABLE Words (
    id INT PRIMARY KEY AUTO_INCREMENT,
    word VARCHAR(50)
);

INSERT INTO Words (word)
VALUES
('Apple'),('Banana'),('Ball'),('Cat'),('Candle'),
('Cow'),('Dog'),('yellow'),('xenon'),('zebra'),
('air'),('bat'),('axe');

COMMIT;

SELECT * FROM Words;

-- ============================================================
--                 LIKE OPERATOR
-- ============================================================

-- % wildcard examples
SELECT * FROM Words WHERE word LIKE '%an%';
SELECT * FROM Words WHERE word LIKE 'D%';
SELECT * FROM Words WHERE word LIKE '%t';
SELECT * FROM Words WHERE word LIKE 'C%e';

-- _ wildcard examples
SELECT * FROM Words WHERE word LIKE '_a%';
SELECT * FROM Words WHERE word LIKE '____';
SELECT * FROM Words WHERE word LIKE '%a_';

-- REGEXP examples (Corrected)
SELECT * FROM Words WHERE word REGEXP '[^a]';           -- NOT starting with a
SELECT * FROM Words WHERE word REGEXP '^[^A-C]';        -- NOT A–C at start

-- Square bracket with REGEXP (LIKE doesn't support [])
SELECT * FROM Words WHERE word REGEXP '^[bB]';          -- starts with b or B
SELECT * FROM Words WHERE word REGEXP '^[AB]';          -- starts with A or B
SELECT * FROM Words WHERE word REGEXP '^[xyz]';         -- x y or z
SELECT * FROM Words WHERE word REGEXP '^[A-Ca-c]';      -- A–C or a–c

COMMIT;
