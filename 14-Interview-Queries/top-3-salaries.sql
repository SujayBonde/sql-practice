-- Problem: Top 3 Department Salaries (LeetCode #185)
-- Target: ANSI SQL

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10, 2),
    department_id INT
);

INSERT INTO employees VALUES
(1, 'Joe',   85000, 1),
(2, 'Henry', 80000, 2),
(3, 'Sam',   60000, 2),
(4, 'Max',   90000, 1),
(5, 'Janet', 69000, 1),
(6, 'Randy', 85000, 1),
(7, 'Will',  70000, 1);

WITH RankedSalaries AS (
    SELECT 
        department_id,
        name,
        salary,
        DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rnk
    FROM employees
)
SELECT department_id, name, salary, rnk
FROM RankedSalaries
WHERE rnk <= 3
ORDER BY department_id, rnk;
