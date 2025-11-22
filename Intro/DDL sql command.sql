
-- how to create database
create database SQL_Practices;

-- How to view databases
show databases;

-- how to use praticular databases
use  sql_practices;


-- Create a table
CREATE TABLE Students (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT
);

-- View table structure
desc students;
describe students;




-- How to view list of table inside a database

show tables;




-- Rename table 'student' to 'student_info'

RENAME TABLE students TO student_info;

show tables;

-- --------- Perform Alter operation on table --------

-- Drop a column
ALTER TABLE student_info DROP COLUMN email;
desc student_info;

-- Drop email column

-- Modify a column type
ALTER TABLE student_info MODIFY COLUMN email varchar(80);     
desc student_info;

-- we resize email 50 to 80

-- Add a new column
ALTER TABLE student_info ADD COLUMN email VARCHAR(50);
desc student_info;



-- Inset data into tables

INSERT INTO Student_info (ID, Name, Age)
VALUES 
    (2, 'Chetan', 21),
    (3, 'Riya', 19),
    (4, 'Ankit', 22);
    
select * from student_info;



-- How work truncate command 

TRUNCATE TABLE student_info;

select * from student_info;

desc student_info;

-- How to work Drop command

Drop table student_info;

show tables;

-- in sql_practice database doesn't have any table 
-- because we drop it, so it completly deleted.

-- View the database is exit or not 
show databases;

-- sql_practies database is exit before use drop command

-- Drop the database 
Drop database sql_practices;

-- View the database is exit or not after use drop command
show databases;



