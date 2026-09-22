-- RIGHT JOIN: Right outer join
-- Target: ANSI SQL

DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT
);

INSERT INTO departments VALUES
(1, 'Engineering'),
(2, 'Sales'),
(3, 'Human Resources'),
(4, 'Legal');

INSERT INTO employees VALUES
(101, 'Alex', 1),
(102, 'Beth', 2),
(103, 'Carl', 1);

-- All departments with matched employees
SELECT 
    d.dept_id,
    d.dept_name,
    e.emp_id,
    e.emp_name
FROM employees AS e
RIGHT JOIN departments AS d ON e.dept_id = d.dept_id
ORDER BY d.dept_id;
