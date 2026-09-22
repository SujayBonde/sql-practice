-- Projection and computed columns
-- Target: ANSI SQL

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10, 2),
    department VARCHAR(50)
);

INSERT INTO employees VALUES
(1, 'Alice', 'Johnson', 90000.00, 'Engineering'),
(2, 'Bob', 'Smith', 75000.00, 'Marketing'),
(3, 'Carol', 'White', 60000.00, 'HR'),
(4, 'David', 'Clark', 85000.00, 'Engineering');

-- Retrieve all columns
SELECT * FROM employees;

-- Selective column projection
SELECT first_name, last_name, salary 
FROM employees;

-- Arithmetic expressions and aliases
SELECT 
    first_name, 
    salary,
    salary * 0.10 AS bonus,
    salary * 1.10 AS total_compensation
FROM employees;

-- Constant literals
SELECT 
    'Antigravity SQL' AS system_name,
    CURRENT_DATE AS query_date;
