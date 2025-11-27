/* =====================================================================
      SQL SUBQUERY NOTES (ONLY employees + departments TABLES)
      Highly Explained Version for Learning + Interview Preparation
   ===================================================================== */

-- -----------------------------------------------------
-- 1️⃣ Show all available databases
-- -----------------------------------------------------
SHOW DATABASES;
/*  
   Shows the list of all databases present in your MySQL server.
   This helps confirm whether sql_practices exists or not.
*/



-- -----------------------------------------------------
-- 2️⃣ Select your working database
-- -----------------------------------------------------
USE sql_practices;
/*
   USE tells MySQL that all the upcoming queries will run inside this DB.
   It's like entering into a folder before working on files inside it.
*/



-- -----------------------------------------------------
-- 3️⃣ Show all tables inside selected database
-- -----------------------------------------------------
SHOW TABLES;
/*
   Displays all tables present in sql_practices.
   Example: employees, departments
*/



-- -----------------------------------------------------
-- 4️⃣ View all records from employees table
-- -----------------------------------------------------
SELECT * FROM employees;
/*
   * means "all columns".
   employees table contains:
   EmpID | EmpName | Age | DepartmentID | Salary | City
*/



-- -----------------------------------------------------
-- 5️⃣ View all records from departments table
-- -----------------------------------------------------
SELECT * FROM departments;
/*
   departments table contains:
   DepartmentID | DeptName | Location
*/



/* =====================================================================
      🟦  SINGLE-ROW SUBQUERY
      ➜ A subquery that returns exactly ONE value.
      Why used?
         ✔ When you need a dynamic condition (not hard-coded)
         ✔ When inner query returns only 1 value (like MAX(), MIN(), AVG())
   ===================================================================== */

-- Example 1: Employees earning more than average salary
SELECT *
FROM employees
WHERE Salary > (
    SELECT AVG(Salary) 
    FROM employees
);
/*
   INNER QUERY (SELECT AVG(Salary) ...):
       → returns only one number (example: 39000)

   OUTER QUERY:
       → checks salary > average salary

   This is single-row because inner query returns only ONE value.
*/



-- Example 2: Employees who work in HR department (without hardcoding 101)
SELECT *
FROM employees
WHERE DepartmentID = (
    SELECT DepartmentID 
    FROM departments 
    WHERE DeptName = 'HR'
);
/*
    Subquery returns exactly one value:
        DeptName = 'HR' → DepartmentID = 101

    Why subquery?
        Because if tomorrow HR departmentID changes from 101 to 201,
        query will still work automatically.
*/



/* =====================================================================
      🟩  MULTI-ROW SUBQUERY
      ➜ Returns MULTIPLE VALUES
      Why used?
         ✔ When condition can match more than one value
         ✔ Must use IN, ANY, ALL
   ===================================================================== */

-- Example: Employees who belong to departments located in Delhi or Mumbai
SELECT *
FROM employees
WHERE DepartmentID IN (
    SELECT DepartmentID
    FROM departments
    WHERE Location IN ('Delhi', 'Mumbai')
);
/*
   INNER QUERY:
        returns multiple department IDs
        Example: 101 (Delhi), 102 (Mumbai)

   OUTER QUERY:
        finds employees whose DepartmentID belongs to those values.

   MULTI-ROW because subquery returns multiple rows.
*/



/* =====================================================================
      🟧  MULTI-COLUMN SUBQUERY (Tuple Subquery)
      ➜ Compares 2 or more columns together
   ===================================================================== */

SELECT *
FROM employees
WHERE (DepartmentID, City) IN (
    SELECT DepartmentID, Location
    FROM departments
);
/*
   INNER QUERY returns PAIRS like:
      (101, 'Delhi')
      (102, 'Mumbai')

   OUTER QUERY checks:
      (employee.DepartmentID, employee.City)
   matches these pairs.

   Why used?
      Useful when you need to match multiple columns together.
*/



/* =====================================================================
      🟥  CORRELATED SUBQUERY
      ➜ Inner query depends on outer query
      ➜ Executes once for EACH ROW of outer table
   ===================================================================== */

-- Example: Employees earning more than average salary of THEIR department
SELECT EmpName, Salary, DepartmentID
FROM employees e1
WHERE Salary > (
    SELECT AVG(Salary)
    FROM employees e2
    WHERE e1.DepartmentID = e2.DepartmentID
);
/*
   CORRELATED because:
       The inner query refers to outer query column (e1.DepartmentID)

   How it works:
       For EACH employee:
           inner query calculates avg salary OF ONLY THAT employee's department.
       Then checks salary > that dept's average.

   This runs repeatedly → one time for every employee row.
*/



/* =====================================================================
      🟨  NESTED SUBQUERY (Subquery inside subquery)
      ➜ When one subquery depends on result of another subquery
   ===================================================================== */

SELECT *
FROM employees
WHERE DepartmentID = (
    SELECT DepartmentID
    FROM departments
    WHERE Location = (
        SELECT Location FROM departments WHERE Location = 'Delhi'
    )
);
/*
   INNER (nested) SUBQUERY:
       SELECT Location FROM departments WHERE Location='Delhi'
            → returns 'Delhi'

   MIDDLE SUBQUERY:
       finds departmentID where Location='Delhi'
            → returns 101

   OUTER QUERY:
       employees whose DepartmentID = 101
*/



/* =====================================================================
      🟪  SCALAR SUBQUERY
      ➜ Returns exactly ONE value for EACH ROW
      ➜ Mostly used in SELECT list
   ===================================================================== */

-- Example: Show employee name with their department name
SELECT EmpName, Salary,
       (SELECT DeptName 
        FROM departments 
        WHERE departments.DepartmentID = employees.DepartmentID) AS DeptName
FROM employees;
/*
   For each employee row:
        subquery runs and returns department name (one value)
   Example:
        If DepartmentID = 101 → returns 'HR'

   This is scalar because each row gets ONE output.
*/



/* =====================================================================
      🟫  INLINE VIEW (Subquery in FROM)
      ➜ Acts like a temporary table / virtual table
   ===================================================================== */

-- Example: Department-wise average salary (filtered)
SELECT *
FROM (
    SELECT DepartmentID, AVG(Salary) AS AvgSal
    FROM employees
    GROUP BY DepartmentID
) AS deptAvg
WHERE AvgSal > 40000;
/*
   Step 1:
       Subquery creates a TEMP table:
           DepartmentID | AvgSal

   Step 2:
       Outer query filters rows where avg salary > 40000

   Why useful?
       When you need GROUP BY results but also want to filter using WHERE
*/



/* =====================================================================
      END OF FILE
   ===================================================================== */
