-- Scalar subquery evaluation
-- Target: ANSI SQL

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

INSERT INTO employees VALUES
(1, 'Alice',   'Engineering', 115000),
(2, 'Bob',     'Engineering', 95000),
(3, 'Charlie', 'HR',          62000),
(4, 'Diana',   'Marketing',   88000),
(5, 'Evan',    'Engineering', 130000),
(6, 'Fiona',   'Marketing',   72000);

-- Predicate with scalar comparison
SELECT name, department, salary 
FROM employees
WHERE salary > (
    SELECT AVG(salary) 
    FROM employees
);

-- Scalar projection subquery
SELECT 
    name,
    salary,
    (SELECT MAX(salary) FROM employees) AS max_salary,
    (SELECT MAX(salary) FROM employees) - salary AS delta_from_max
FROM employees;
