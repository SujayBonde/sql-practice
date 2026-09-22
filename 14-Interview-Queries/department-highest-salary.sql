-- Problem: Department Highest Salary (LeetCode #184)
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
(5, 'Janet', 85000, 1);

-- DENSE_RANK approach handling ties
WITH DeptRank AS (
    SELECT 
        department_id,
        name,
        salary,
        DENSE_RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) as ranking
    FROM employees
)
SELECT department_id, name, salary
FROM DeptRank
WHERE ranking = 1;
