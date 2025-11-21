-- ====== Setup ======
SHOW DATABASES;
USE pythonSql;

-- ============ NULL CONSTRAINT ===============
CREATE TABLE student_notnull_example (
    id INT NOT NULL,                 -- cannot be NULL
    name VARCHAR(50) NOT NULL,       -- cannot be NULL
    age INT NOT NULL,                -- cannot be NULL
    email VARCHAR(100) NOT NULL      -- cannot be NULL
);
INSERT INTO student_notnull_example (id, name, age, email)
VALUES
(1, 'Chetan', 23, 'chetan@example.com'),
(2, 'Rahul', 25, 'rahul@example.com'),
(3, 'Priya', 22, 'priya@example.com'),
(4, 'Aman', 24, 'aman@example.com');

select*from student_notnull_example;


-- ========== UNIQUE Constraint ========

CREATE TABLE users_unique_example (
    user_id INT,
    email VARCHAR(100) UNIQUE           -- UNIQUE constraint
);
INSERT INTO users_unique_example (user_id, email)
VALUES
(1, 'chetan@example.com'),
(2, 'rahul@example.com'),
(3, 'priya@example.com');

-- ❌ This will fail (duplicate email):
-- INSERT INTO users_unique_example VALUES (4, 'chetan@example.com');
select *from  users_unique_example;


-- ============== PRIMARY KEY Constraint ==========

CREATE TABLE employee_pk_example (
    emp_id INT PRIMARY KEY,            -- PRIMARY KEY
    emp_name VARCHAR(50)
);

INSERT INTO employee_pk_example (emp_id, emp_name)
VALUES
(101, 'Chetan'),
(102, 'Rahul'),
(103, 'Priya');

-- ❌ This will fail (duplicate primary key):
-- INSERT INTO employee_pk_example VALUES (101, 'Duplicate');
select*from employee_pk_example; 

-- =========== FOREIGN KEY Constraint ======

CREATE TABLE department_fk_example (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);
INSERT INTO department_fk_example (dept_id, dept_name)
VALUES
(1, 'Sales'),
(2, 'Engineering'),
(3, 'HR');

select *from department_fk_example;

-- Child Table (With FOREIGN KEY)
CREATE TABLE employee_fk_example (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department_fk_example(dept_id)
);
INSERT INTO employee_fk_example (emp_id, emp_name, dept_id)
VALUES
(1, 'Chetan', 1),
(2, 'Rahul', 2),
(3, 'Priya', 3);
-- ❌ This will fail because dept_id=10 does not exist:
-- INSERT INTO employee_fk_example VALUES (4, 'Aman', 10);
select*from employee_fk_example;

-- ========= DEFAULT CONSTRAINT =============

CREATE TABLE DefaultConstraint (
    id INT PRIMARY KEY,
    status VARCHAR(20) DEFAULT 'ACTIVE'
);

INSERT INTO DefaultConstraint (id) 
VALUES (1);

SELECT * FROM DefaultConstraint;



-- ========== ALTER TABLE — Adding Constraints Later  ==============

-- Add NOT NULL
ALTER TABLE student
MODIFY COLUMN name VARCHAR(50) NOT NULL;

-- Add UNIQUE
ALTER TABLE users
ADD CONSTRAINT uq_users_email UNIQUE (email);

-- Add PRIMARY KEY
ALTER TABLE employee
ADD CONSTRAINT pk_employee PRIMARY KEY (emp_id);

-- Add FOREIGN KEY
ALTER TABLE employee
ADD CONSTRAINT fk_employee_dept
FOREIGN KEY (dept_id) REFERENCES department(id)
ON DELETE SET NULL
ON UPDATE CASCADE;

-- Add CHECK
ALTER TABLE student
ADD CONSTRAINT chk_student_age CHECK (age >= 18);

-- Add DEFAULT
ALTER TABLE customer
ALTER COLUMN country SET DEFAULT 'India';

-- Add AUTO_INCREMENT
ALTER TABLE orders
MODIFY COLUMN order_id INT AUTO_INCREMENT;

-- Add INDEX
ALTER TABLE employee
ADD INDEX idx_employee_name (emp_name);












-- ====== 0) Supporting table for FK examples ======
CREATE TABLE  department (
    id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO department (dept_name) VALUES ('Sales'), ('Engineering'), ('HR');
select*from department;


-- ====== 3) EMPLOYEE table with PRIMARY KEY and FOREIGN KEY reference to department ======

CREATE TABLE employeess (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    dept_id INT,
    hire_date DATE DEFAULT (CURRENT_DATE),   -- DATE with default = today
    salary DECIMAL(12,2) DEFAULT 0.00,
    CONSTRAINT fk_employee_dept 
        FOREIGN KEY (dept_id) 
        REFERENCES department(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);
INSERT INTO employeess (emp_name, dept_id, salary) VALUES ('Rahul', 2, 45000.00);
select*from employeess;
