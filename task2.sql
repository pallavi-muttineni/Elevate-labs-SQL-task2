-- DML_operations.sql
-- Name: [N.Lahari]
-- Date: 2025-06-25

-- ====================================================================
-- Data Insertion and Handling Nulls
-- This script demonstrates creating a database and table,
-- and then using DML commands (INSERT, UPDATE, DELETE)
-- to manipulate data, including handling NULL values.
-- ====================================================================


-- 1. DATABASE AND TABLE SETUP
-- Drop the database if it exists to ensure a clean start
DROP DATABASE IF EXISTS company_hr_db;

-- Create a new database for the HR system
CREATE DATABASE company_hr_db;

-- Use the newly created database
USE company_hr_db;

-- Drop the table if it exists to ensure a clean start
DROP TABLE IF EXISTS Employees;

-- Create the Employees table
-- This table will store employee information, including self-referencing manager data.
CREATE TABLE Employees (
    employee_id INTEGER PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE, -- Ensures each employee has a unique email
    phone_number VARCHAR(20),  -- Phone number can be optional (allows NULL)
    hire_date DATE NOT NULL,
    job_id INTEGER,
    salary DECIMAL(10, 2),     -- DECIMAL is best for currency
    manager_id INTEGER,
    -- Define a foreign key for manager_id.
    -- ON DELETE SET NULL: If a manager is deleted, their subordinates are kept
    -- but their manager_id is set to NULL.
    FOREIGN KEY (manager_id) REFERENCES Employees(employee_id) ON DELETE SET NULL
);


-- 2. DATA INSERTION (INSERT STATEMENTS)
-- Demonstrates inserting complete rows, partial rows, and handling NULLs.

INSERT INTO Employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id) VALUES
(100, 'Alice', 'Manager', 'alice.manager@example.com', '111-222-3333', '2020-01-01', 10, 90000.00, NULL),
(101, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', '2023-01-15', 1, 60000.00, 100),
(102, 'Jane', 'Smith', 'jane.smith@example.com', NULL, '2022-05-20', 2, 75000.00, 100),
(103, 'Peter', 'Jones', 'peter.jones@example.com', NULL, '2024-03-10', 1, 55000.00, 101),
(104, 'Alice', 'Williams', NULL, NULL, '2023-11-01', 3, NULL, NULL),
(105, 'Robert', 'Brown', 'robert.brown@example.com', '987-654-3210', '2023-08-01', 2, 70000.00, 102);

-- Verify initial data insertion
SELECT * FROM Employees;


-- 3. DATA UPDATING (UPDATE STATEMENTS)
-- Demonstrates updating single and multiple rows.

-- Update a single row: Increase John Doe's salary
UPDATE Employees
SET salary = 65000.00
WHERE employee_id = 101;

-- Update multiple rows: Give a 5% raise to all employees hired before 2023
UPDATE Employees
SET salary = salary * 1.05
WHERE hire_date < '2023-01-01';

-- Update multiple columns: Fill in missing data for Alice Williams
UPDATE Employees
SET job_id = 4, manager_id = 100, email = 'alice.williams@example.com'
WHERE employee_id = 104;

-- Verify data after updates
SELECT * FROM Employees;


-- 4. DATA DELETION (DELETE STATEMENTS)
-- Demonstrates deleting single and multiple rows.

-- Delete a single row
DELETE FROM Employees
WHERE employee_id = 104;

-- Delete multiple rows
DELETE FROM Employees
WHERE job_id = 1;

-- Verify final state of the data
SELECT * FROM Employees;