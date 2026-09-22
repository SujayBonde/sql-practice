-- Analytical window functions: PARTITION BY and OVER
-- Target: ANSI SQL

DROP TABLE IF EXISTS department_payroll;

CREATE TABLE department_payroll (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

INSERT INTO department_payroll VALUES
(1, 'Alice',   'Engineering', 120000),
(2, 'Bob',     'Engineering', 95000),
(3, 'Charlie', 'Engineering', 110000),
(4, 'Diana',   'Marketing',   85000),
(5, 'Evan',    'Marketing',   90000),
(6, 'Fiona',   'Marketing',   75000);

-- Partitioned aggregation without row grouping
SELECT 
    emp_id,
    name,
    department,
    salary,
    ROUND(AVG(salary) OVER(PARTITION BY department), 2) AS dept_mean_salary,
    ROUND(salary - AVG(salary) OVER(PARTITION BY department), 2) AS diff_from_dept_mean,
    SUM(salary) OVER() AS total_payroll
FROM department_payroll
ORDER BY department, salary DESC;
