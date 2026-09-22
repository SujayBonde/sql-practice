-- View definition for projection and abstraction
-- Target: ANSI SQL

DROP VIEW IF EXISTS v_employee_directory;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    salary DECIMAL(10, 2),
    ssn VARCHAR(11)
);

INSERT INTO departments VALUES (1, 'Engineering'), (2, 'Finance');
INSERT INTO employees VALUES
(1, 'Alice', 1, 110000, '000-11-2222'),
(2, 'Bob',   2, 95000,  '000-33-4444');

-- Projection view excluding sensitive SSN attribute
CREATE VIEW v_employee_directory AS
SELECT 
    e.emp_id,
    e.name,
    d.dept_name,
    e.salary
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id;

SELECT * FROM v_employee_directory
WHERE dept_name = 'Engineering';
