-- Problem: Second Highest Salary (LeetCode #176)
-- Target: ANSI SQL

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10, 2)
);

INSERT INTO employees VALUES
(1, 'Alice', 120000),
(2, 'Bob',   110000),
(3, 'Carl',  110000),
(4, 'Diana', 95000);

-- Approach 1: Scalar subquery with MAX
SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees);

-- Approach 2: DENSE_RANK CTE
WITH RankedSalaries AS (
    SELECT 
        salary,
        DENSE_RANK() OVER (ORDER BY salary DESC) as rank_num
    FROM employees
)
SELECT salary AS second_highest_salary
FROM RankedSalaries
WHERE rank_num = 2
LIMIT 1;
