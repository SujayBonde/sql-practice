-- Problem: Employees earning more than department mean
-- Target: ANSI SQL

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

INSERT INTO employees VALUES
(1, 'Alice',   'Engineering', 120000),
(2, 'Bob',     'Engineering', 90000),
(3, 'Carl',    'Engineering', 95000),
(4, 'Diana',   'Marketing',   85000),
(5, 'Evan',    'Marketing',   65000);

-- Window function comparison
SELECT 
    name,
    department,
    salary,
    ROUND(dept_avg, 2) AS dept_avg
FROM (
    SELECT 
        name,
        department,
        salary,
        AVG(salary) OVER(PARTITION BY department) AS dept_avg
    FROM employees
) AS ranked
WHERE salary > dept_avg;
