show databases;
use sql_practices;
show tables;

--  Insert a Single Record

INSERT INTO Students (ID, Name, Age) 
VALUES (1, 'Mohit', 21);




-- Insert Multiple Records at Once

INSERT INTO Students (ID, Name, Age) 
VALUES 
    (2, 'Chetan', 22),
    (3, 'Rohit', 23),
    (4, 'Ankit', 20);


select *from students;


-- ================== USE OF UPDATE COMMAND ===============

-- Update a single record

-- Change Mohit's age from 21 to 22

UPDATE Students
SET Age = 22
WHERE ID = 1;

-- Update multiple records

-- Add 1 year to all students whose age is less than 22

UPDATE Students
SET Age = Age + 1
WHERE Age < 22;

-- ======= How to work Select Command =====

select*from students;




SELECT Name, Age FROM Students;



SELECT * FROM Students
WHERE Age > 21;


-- ====== How Delete command work ===

-- Delete all records (Rows)
DELETE FROM Students;

select *from students;


-- single records

DELETE FROM Students
WHERE ID = 4;

