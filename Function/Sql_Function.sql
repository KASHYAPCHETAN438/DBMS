show databases;
use pythonsql;

show tables;
select*from customer;
-- ===============LENGHT FUNCTION ===============
select customername ,length('customername')  from customer;

SELECT customername, LENGTH(customername) AS name_length
FROM customer
WHERE customername = 'Priya Singh';

-- =============== UPPER FUNCTION ==============

SELECT customername, upper(customername) AS Upper_case
FROM customer
WHERE customername = 'Priya Singh';

-- =============== LOWER FUNCTION ==============

SELECT customername, lower(customername) AS Lower_case
FROM customer
WHERE customername = 'Priya Singh';

-- =============== CONCAT FUNCTION ==============

SELECT customername, concat("Hello " , customername) AS Join_String
FROM customer
WHERE customername = 'Priya Singh';


-- =============== SUB STRING FUNCTION ==============
select*from customer;
SELECT customername, substring(customername,3,5) AS Sub_String
FROM customer
WHERE customername = 'Priya Singh';


-- ######################## NUMERIC FUNCTION ##########################


SELECT * FROM employee;


-- ================ ROUND FUNCTION ===========

Select name,salary,round(salary,1) as Round_Salary 
From employee
Where emp_code=1;

-- ============== CEIL FUNCTION ================

Select name,salary,ceil(salary) as Round_Up
From employee
Where emp_code=1;

SELECT CEIL(4.1);   -- Output: 5
SELECT CEIL(4.9);   -- Output: 5
SELECT CEIL(7.0001); -- Output: 8


-- ============== FLOOR FUNCTION ===============

Select name,salary, floor(salary) as Round_Up
From employee
Where emp_code=1;

SELECT FLOOR(4.9);   -- Output: 4
SELECT FLOOR(-4.1);   -- Output: -5
SELECT FLOOR(7.99);  -- Output: 7
SELECT FLOOR(-4.1);   -- Output: -5


-- ============== POWER FUNCTION ===============

SELECT POWER(2, 3);


-- ################### CURRENT DATE & TIME ####################

-- ================ NOW FUNCTION =================

SELECT NOW();

-- ================ CURDATE FUNCTION =================

SELECT CURDATE();


-- ================ YEAR FUNCTION =================

SELECT YEAR('2025-10-15');

-- ================ MONTHNAME FUNCTION =================

SELECT monthname('2025-10-15');


-- ################## CONTROL FLOW FUNCTION #############

-- =============== IF() FUNCTION ======================

SELECT IF(55000 > 50000, 'High', 'Low') AS SalaryStatus;


-- =============== IFNULL() FUNCTION ===================

SELECT IFNULL(NULL, 'No Value') AS Result;


-- =============== NULLIF() FUNCTION ===================

SELECT NULLIF(10, 10) AS Result;   -- Output: NULL


-- =============== CASE FUNCTION =======================

SELECT 
  CASE
     WHEN 92 >= 90 THEN 'A'
     WHEN 92 >= 75 THEN 'B'
     ELSE 'Fail'
  END AS Grade;




-- ################ SYSTEM FUNCTIONS ###################

-- ===================  VERSION()  ==================

SELECT VERSION();

-- ===================  DATABASE()  =================

SELECT DATABASE();



-- ===================  USER() =======================

SELECT USER();


-- ===================  CONNECTION_ID() ===============

SELECT CONNECTION_ID();


-- =================== LAST_INSERT_ID() ===============

INSERT INTO test_table(name) VALUES('Mohit');
SELECT LAST_INSERT_ID();


-- ===================  ROW_COUNT()  ===================

UPDATE employee SET salary = salary + 5000;
SELECT ROW_COUNT();



-- ################# AGGREGATE FUNCTION ##################
select*from employee;


-- ================= COUNT() FUNCTION ====================

SELECT  COUNT(*) FROM employee;

SELECT name, age, COUNT(age) AS count_by_age
FROM employee
GROUP BY age,name;



-- ================= SUM() FUNCTION ======================

SELECT  SUM(salary) FROM employee;

SELECT name, salary, sum(salary) AS Sum_salary
FROM employee
GROUP BY name,salary;


-- ================= AVG() FUNCTION ======================

SELECT AVG(Age) FROM employee;


-- ================= MIN() FUNCTION ======================

SELECT MIN(Age) FROM employee;


-- ================= MAX() FUNCTION ======================

SELECT MAX(Age) FROM employee;

