Data Insertion and Handling Nulls

## Objective

This repository contains the SQL script for **Task 2: Data Insertion and Handling Nulls**. The primary objective of this task is to practice Data Manipulation Language (DML) operations in SQL, specifically `INSERT`, `UPDATE`, and `DELETE` statements, with a strong focus on how to correctly handle `NULL` values.

## Contents

This repository includes:

* `task2_dml_operations.sql`: The main SQL script containing all the DML statements. This file demonstrates:
    * Database and table creation (`CREATE DATABASE`, `CREATE TABLE`).
    * Inserting new records, including complete rows, partial rows, and explicit/implicit `NULL` handling.
    * Updating existing records, including single and multiple rows, and setting values to `NULL`.
    * Deleting records, including single and multiple rows.
    * Verification of data changes using `SELECT` statements after each major operation.
    * Demonstration of `FOREIGN KEY` with `ON DELETE SET NULL` for managing relationships upon deletion.

## How to Run the SQL Script

To execute this SQL script and see the operations in action, follow these steps:

1.  **Prerequisites:** You need a MySQL database server installed and running, along with a MySQL client (e.g., MySQL Command Line Client, MySQL Workbench, or DBeaver).

2.  **Download the Script:** Clone this repository or download the `task2_dml_operations.sql` file directly.

3.  **Connect to MySQL:**
    * **Via Command Line:**
        ```bash
        mysql -u your_username -p
        ```
        (Enter your password when prompted.)
    * **Via MySQL Workbench/Other GUI Client:** Connect to your MySQL server using the appropriate connection details.

4.  **Execute the Script:**
    * **Via Command Line:** Once connected, you can source the SQL file:
        ```sql
        SOURCE /path/to/your/task2_dml_operations.sql;
        ```
        (Replace `/path/to/your/` with the actual path to where you saved the file.)
    * **Via MySQL Workbench/Other GUI Client:** Open the `task2_dml_operations.sql` file in a query tab and click the "Execute" or "Run" button (often a lightning bolt icon).

The script is designed to be run from start to finish. It will first drop the database and table if they exist to ensure a clean slate, then recreate them, insert data, perform updates, and finally deletions. `SELECT` statements are included to show the data at various stages.

## Key Concepts Demonstrated

* **DML (Data Manipulation Language):**
    * `INSERT INTO`: Adding new rows to a table.
    * `UPDATE`: Modifying existing data in rows.
    * `DELETE FROM`: Removing rows from a table.
* **NULL Handling:**
    * Understanding `NULL` as the absence of a value (distinct from `0` or an empty string).
    * Explicitly inserting `NULL`.
    * Omitting columns in `INSERT` to allow `NULL` or `DEFAULT` values.
    * Updating columns to `NULL`.
    * Using `IS NULL` and `IS NOT NULL` in `WHERE` clauses.
* **Constraints:**
    * `PRIMARY KEY`: Uniquely identifies each row.
    * `NOT NULL`: Ensures a column cannot contain `NULL` values.
    * `UNIQUE`: Ensures all values in a column are distinct.
    * `FOREIGN KEY`: Enforces referential integrity between tables (or self-referencing in this case).
    * `ON DELETE SET NULL`: A referential action that sets foreign key values to `NULL` when the referenced parent row is deleted.
* **Best Practices:** Use of appropriate data types (e.g., `VARCHAR` for strings, `DECIMAL` for monetary values).

---
