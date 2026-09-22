-- Dimensional aggregation
-- Target: ANSI SQL

DROP TABLE IF EXISTS company_employees;

CREATE TABLE company_employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    country VARCHAR(50),
    salary DECIMAL(10, 2)
);

INSERT INTO company_employees VALUES
(1, 'Alice',   'Engineering', 'USA',    120000),
(2, 'Bob',     'Engineering', 'USA',    110000),
(3, 'Charlie', 'Engineering', 'Canada', 95000),
(4, 'Diana',   'Marketing',   'USA',    80000),
(5, 'Evan',    'Marketing',   'Canada', 75000),
(6, 'Fiona',   'Sales',       'USA',    90000),
(7, 'George',  'Sales',       'Canada', 88000),
(8, 'Hannah',  'Sales',       'USA',    92000);

-- Single-column grouping
SELECT 
    department,
    COUNT(*) AS head_count,
    ROUND(AVG(salary), 2) AS mean_salary,
    SUM(salary) AS total_payroll
FROM company_employees
GROUP BY department
ORDER BY mean_salary DESC;

-- Multi-column grouping
SELECT 
    department,
    country,
    COUNT(*) AS head_count,
    AVG(salary) AS mean_salary
FROM company_employees
GROUP BY department, country
ORDER BY department, country;
