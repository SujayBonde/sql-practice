-- Data insertion: single-row, multi-row, and default values
-- Target: ANSI SQL

DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL,
    location VARCHAR(100)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    hire_date DATE,
    salary DECIMAL(10, 2),
    department_id INT
);

-- Single-row insert with explicit column list
INSERT INTO departments (department_id, department_name, location)
VALUES (1, 'Engineering', 'San Francisco');

-- Batch insert
INSERT INTO departments (department_id, department_name, location)
VALUES 
    (2, 'Human Resources', 'New York'),
    (3, 'Marketing', 'Chicago'),
    (4, 'Finance', 'Boston');

-- Child record insertion
INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, salary, department_id)
VALUES
    (101, 'Alice', 'Smith', 'alice@company.com', '2021-03-15', 95000.00, 1),
    (102, 'Bob', 'Jones', 'bob@company.com', '2020-07-01', 82000.00, 1),
    (103, 'Charlie', 'Brown', 'charlie@company.com', '2019-11-20', 65000.00, 2),
    (104, 'Diana', 'Prince', 'diana@company.com', '2022-01-10', 78000.00, 3),
    (105, 'Evan', 'Wright', NULL, '2023-05-04', 55000.00, 4);

-- Verification
SELECT * FROM departments;
SELECT * FROM employees;
