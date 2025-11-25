-- ==========================================================
-- STEP 1 : CHECK AVAILABLE DATABASES
-- ==========================================================
SHOW DATABASES;

-- Switch to mysql system database (contains user table)
USE mysql;

SELECT * FROM user;

-- Check all tables
SHOW TABLES;

-- Check current MySQL users
SELECT * FROM user;



-- ==========================================================
-- STEP 2 : CREATE NEW REMOTE USER
-- ==========================================================

-- Create a user who can connect from ANY system using password
CREATE USER 'Chetan'@'%' IDENTIFIED BY '7011406227';

-- Check user table after creation
SELECT * FROM user;



-- ==========================================================
-- STEP 3 : GRANT PRIVILEGES TO REMOTE USER
-- ==========================================================

-- Give full access to all databases (*.*)
GRANT ALL PRIVILEGES ON *.* TO 'Chetan'@'%';

-- Apply privilege changes
FLUSH PRIVILEGES;

-- Verify user again after granting privileges
SELECT * FROM user;



-- ==========================================================
-- STEP 4 : CHANGE BIND ADDRESS (NOT SQL COMMAND)
-- ==========================================================
-- NOTE:
-- bind-address CANNOT be changed by SQL.
-- You must edit MySQL configuration file manually.

-- ========================= Windows =========================
-- Open:  C:\xampp\mysql\bin\my.ini 
-- OR
--       C:\ProgramData\MySQL\MySQL Server 8.0\my.ini

-- FIND:
--     bind-address = 127.0.0.1
-- CHANGE TO:
--     bind-address = 0.0.0.0
-- Save file → Restart MySQL Service

-- ========================== Linux ==========================
-- Open file:
--     sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf

-- FIND:
--     bind-address = 127.0.0.1
-- CHANGE TO:
--     bind-address = 0.0.0.0
-- Save → Restart MySQL:
--     sudo systemctl restart mysql



-- ==========================================================
-- STEP 5 : FIREWALL CONFIGURATION (OUTSIDE SQL)
-- ==========================================================

-- Windows:
-- 1. Open Windows Defender Firewall
-- 2. Click: Advanced Settings
-- 3. Inbound Rules → New Rule
-- 4. Choose Port
-- 5. TCP → 3306 → Allow → Finish

-- Linux (UFW):
--     sudo ufw allow 3306/tcp
--     sudo ufw reload



-- ==========================================================
-- STEP 6 : Find IP address of Server Machine
-- ==========================================================

-- FIRST: Find IP address of server (MySQL machine):
-- Windows:   ipconfig
-- Linux:     ifconfig

-- Example server IP:
--     192.168.1.18



-- ==========================================================
-- STEP 7 : HOW TO CONNECT FROM ANOTHER SYSTEM (IMPORTANT)
-- ==========================================================


-- ====================== Connect Using MySQL CLI ===========
-- From another computer on same WiFi/LAN:
-- Replace IP and user:
-- 
--     mysql -h 192.168.1.18 -u Chetan -p
--
-- Enter password: 7011406227


-- ==================== Connect Using MySQL Workbench ===================
-- Open Workbench → New Connection
-- 
-- Connection Name:   Remote Server
-- Hostname:          192.168.1.18
-- Port:              3306
-- Username:          Chetan
-- Password:          7011406227
-- 
-- Test Connection → OK → Save


-- ==================== Connect Using Java, Python, PHP===================
-- Example JDBC URL:
-- 
--     jdbc:mysql://192.168.1.18:3306/mydatabase
--


