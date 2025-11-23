-- ===========================================
-- 1️⃣ CHECK CURRENT USERS
-- ===========================================
USE mysql;
SELECT User, Host FROM mysql.user;



-- ===========================================
-- 2️⃣ CREATE USERS
-- ===========================================

-- Local user (sirf current system se login karega)
CREATE USER 'mohit'@'localhost' IDENTIFIED BY 'Mohit123';

-- Remote user: kisi bhi IP se connect kar sakta hai
CREATE USER 'mohit_remote'@'%' IDENTIFIED BY 'Mohit123';

-- Dusra remote user
CREATE USER 'Chetan'@'%' IDENTIFIED BY 'Mohit123';

-- Sirf is specific IP se connect karega
CREATE USER 'Mohit_Specific_IP'@'192.168.1.100' IDENTIFIED BY 'Mohit123';



-- ===========================================
-- 3️⃣ GRANT PRIVILEGES (DCL)
-- ===========================================

-- mohit ko sirf SELECT on sql_practices.students
GRANT SELECT 
ON sql_practices.students 
TO 'mohit'@'localhost';

-- IP specific user + Chetan ko mysql.user par SELECT, INSERT, UPDATE
-- (⚠️ sirf practice ke liye; production me avoid karo)
GRANT SELECT, INSERT, UPDATE
ON mysql.user
TO 'Mohit_Specific_IP'@'192.168.1.100',
   'Chetan'@'%';

-- Chetan ka grant dekhne ke liye
SHOW GRANTS FOR 'Chetan'@'%';

-- Changes memory me reload karne ke liye
FLUSH PRIVILEGES;



-- ===========================================
-- 4️⃣ SHOW GRANTS FOR EACH USER
-- ===========================================
SHOW GRANTS FOR 'mohit'@'localhost';
SHOW GRANTS FOR 'Mohit_Specific_IP'@'192.168.1.100';
SHOW GRANTS FOR 'Chetan'@'%';



-- ===========================================
-- 5️⃣ GRANT TO MULTIPLE USERS ON SAME TABLE
-- ===========================================

-- mohit_remote + Chetan dono ko SELECT, INSERT, UPDATE
-- sirf students table par
GRANT SELECT, INSERT, UPDATE 
ON sql_practices.students 
TO 'mohit_remote'@'%', 'Chetan'@'%';

SHOW GRANTS FOR 'mohit_remote'@'%';
SHOW GRANTS FOR 'Chetan'@'%';



-- ===========================================
-- 6️⃣ GRANT ALL PRIVILEGES ON ONE DATABASE
-- ===========================================

-- yahan pe hum mohit_remote ko full access de rahe hain pythonsql DB par
-- (pehle 'Mohit'@'%' tha, user exist nahi karta tha → error, isliye change kiya)
GRANT ALL PRIVILEGES 
ON pythonsql.* 
TO 'mohit_remote'@'%';

SHOW GRANTS FOR 'mohit_remote'@'%';



-- ===========================================
-- 7️⃣ VIEW PRIVILEGES DIRECTLY FROM mysql.user (OPTIONAL)
-- ===========================================
SELECT User, Host, Select_priv, Insert_priv, Update_priv, Delete_priv,
       Create_priv, Drop_priv
FROM mysql.user;



-- ===========================================
-- 8️⃣ REVOKE COMMANDS (DCL – REVOKE)
-- ===========================================

-- 🔹 8.1 Revoke ek privilege: Chetan se INSERT hatana students table se
REVOKE INSERT
ON sql_practices.students
FROM 'Chetan'@'%';

SHOW GRANTS FOR 'Chetan'@'%';

-- 🔹 8.2 Revoke multiple privileges: Chetan se SELECT + UPDATE hatana
REVOKE SELECT, UPDATE
ON sql_practices.students
FROM 'Chetan'@'%';

SHOW GRANTS FOR 'Chetan'@'%';

-- 🔹 8.3 Revoke ALL PRIVILEGES: sirf iss table par mohit_remote ke liye
-- (ye tabhi chalega kyunki upar isi table par GRANT diya hua hai)
SHOW GRANTS FOR 'mohit_remote'@'%';

REVOKE ALL PRIVILEGES
ON sql_practices.students
FROM 'mohit_remote'@'%';

SHOW GRANTS FOR 'mohit_remote'@'%';

FLUSH PRIVILEGES;   -- revoke ke baad bhi ek baar laga dena best practice hai



-- ===========================================
-- 9️⃣ DELETE USERS (AGAR CHAHIYE)
-- ===========================================
-- Dhyan se: yahan host sahi rakha hai. Pehle 'mohit'@'%' tha → error
DROP USER 'mohit'@'localhost';
DROP USER 'mohit_remote'@'%';



-- Final check: kaun-kaun user bacha hai
SELECT User, Host 
FROM mysql.user;
