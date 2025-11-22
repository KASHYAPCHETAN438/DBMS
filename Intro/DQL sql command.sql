-- Insert row in table ----

INSERT INTO Students (ID, Name, Age) 
VALUES (1, 'Mohit', 21);
INSERT INTO Students (ID, Name, Age) 
VALUES 
    (2, 'Chetan', 28),
    (3, 'Rohit', 26),
    (4, 'Ankit', 35),
    (5,'Ram',31);

-- -------------------------------------------

show databases;
use sql_practices;
show tables;

select * from students;

SELECT Name, Age FROM Students;
    
SELECT * FROM Students;

SELECT * FROM Students
WHERE age = 26;

SELECT * FROM Students
ORDER BY Age DESC;

SELECT * FROM Students
ORDER BY Age ASC;


-- Insert a duplicate record

INSERT INTO Students (ID, Name, Age) 
VALUES (6, 'Mohit', 21);
select*from students;

SELECT DISTINCT * FROM Students;

SELECT DISTINCT Name FROM Students;

SELECT DISTINCT Name, Age FROM Students;

SELECT Age, COUNT(*) AS Total_Age
FROM Students
GROUP BY Age;

SELECT age, COUNT(*) AS Total_age
FROM Students
GROUP BY age
HAVING COUNT(*) > 1;


SELECT * FROM Students
LIMIT 3;


SELECT TOP 3 * FROM Students;


SELECT Name AS Student_Name, age AS Students_Age
FROM Students;
