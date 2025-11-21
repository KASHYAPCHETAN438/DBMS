show databases;
create database pythonSql;
use pythonSql;

-- ✅ 1. NUMERIC DATA TYPES

CREATE TABLE atm_numeric_example (
    tiny_errors      TINYINT,          -- small error count (0 to 127)
    small_branch_id  SMALLINT,         -- branch IDs (0 to 30000)
    medium_cashbox   MEDIUMINT,        -- cashbox capacity (0 to 1 million)
    total_transactions INT,            -- total number of ATM transactions
    account_balance  BIGINT,           -- large balance amounts (up to billions)
    temperature      FLOAT,            -- ATM machine temperature (decimal allowed)
    success_rate     DOUBLE,           -- success % with more precision
    withdrawal_limit DECIMAL(10,2)     -- exact money value (like 20000.50)
);

INSERT INTO atm_numeric_example VALUES
(5, 1025, 850000, 1245789, 9876543210, 36.5, 98.5678, 20000.50);


-- ✅ 2. STRING DATA TYPES

CREATE TABLE customer_string_example (
    code        CHAR(5),          -- fixed-length customer code (e.g. "AB123")
    fullname    VARCHAR(100),     -- variable-length name
    short_note  TEXT,             -- medium description
    review_text MEDIUMTEXT,       -- long feedback (100k+ chars)
    biography   LONGTEXT          -- extremely long bio (books/articles)
);

INSERT INTO customer_string_example VALUES
(
    'CU001',
    'Chetan Kashyap',
    'Regular customer with premium membership.',
    'Chetan likes our services and often purchases products during sale.',
    'Chetan was born in Delhi... (very long biography stored here)'
);


-- ✅ 3. BINARY / IMAGE DATA TYPES

CREATE TABLE user_documents_example (
    user_id       INT,
    profile_pic   BLOB,         -- small image (max 65 KB)
    signature_img MEDIUMBLOB,   -- medium-size sign (max 16 MB)
    degree_file   LONGBLOB      -- large PDF/Scanned certificate  (max 4 GB)
);


-- Example insert (LOAD_FILE requires correct server access)

INSERT INTO user_documents_example (user_id, profile_pic, signature_img, degree_file)
VALUES
(
    1,
    LOAD_FILE('C:\\Users\\cheta\\OneDrive\\Pictures\\Saved Pictures\\bk-1.jpg'),
    LOAD_FILE('C:\\Users\\cheta\\OneDrive\\Pictures\\Saved Pictures\\Join iimages.png'),
    LOAD_FILE('C:\Users\cheta\Downloads\\WP Average Data.pdf')
);
select*from user_documents_example; 

-- No data is insert why ? because sql by default have permission 
-- read data from only "C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\" this path
-- we need to keep all file only this path then it will insert


-- Check the path from which mysql allow to read file
SHOW VARIABLES LIKE 'secure_file_priv';

INSERT INTO user_documents_example (user_id, profile_pic, signature_img, degree_file)
VALUES
(
    1,
    LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\bk-1.jpg'),
    LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Join iimages.png'),
    LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\WP Average Data.pdf')
);

select*from user_documents_example;  

-- ✅ 4. DATE & TIME DATA TYPES

CREATE TABLE DateAndTimeExample (
    sid INT PRIMARY KEY AUTO_INCREMENT,
    sname VARCHAR(50),

    birth_date DATE,                   -- only date (YYYY-MM-DD)
    login_time TIME,                   -- only time (HH:MM:SS)

    adm_datetime DATETIME,             -- full date & time
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
                 ON UPDATE CURRENT_TIMESTAMP,   -- auto-update timestamp

    pass_year YEAR                     -- only year (YYYY)
);

-- INSERT THE RECORDS

INSERT INTO DateAndTimeExample 
(sid, sname, birth_date, login_time, adm_datetime, last_updated, pass_year)
VALUES
(1, 'Chetan', '2002-05-12', '10:30:00', '2025-11-06 10:30:00', '2025-11-06 10:30:00', 2020),
(2, 'Rahul', '2001-08-20', '11:00:00', '2025-11-06 11:00:00', '2025-11-06 11:00:00', 2019),
(3, 'Priya', '2003-02-15', '11:30:00', '2025-11-06 11:30:00', '2025-11-06 11:30:00', 2021),
(4, 'Aman',  '2000-12-01', '12:00:00', '2025-11-06 12:00:00', '2025-11-06 12:00:00', 2018);

select*from DateAndTimeExample;


-- ✅ 5 JSON DATA Type

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    details JSON
);



CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    details JSON
);


INSERT INTO employees (name, details)
VALUES (
    'Chetan',
    '{ "age": 25, "skills": ["Python", "SQL"], "address": { "city": "Delhi", "pincode": 110001 } }'
);

select*from employess;



-- ✅ 6. BOOLEAN DATA TYPE
CREATE TABLE account_status_example (
    account_id INT,
    is_active BOOLEAN,      -- TRUE = active, FALSE = disabled
    is_verified BOOLEAN
);

INSERT INTO account_status_example VALUES
(1, TRUE, FALSE);






