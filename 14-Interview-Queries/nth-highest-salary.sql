-- Problem: Nth Highest Salary (LeetCode #177)
-- Target: ANSI SQL

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10, 2)
);

INSERT INTO employees VALUES
(1, 'Alice', 150000),
(2, 'Bob',   140000),
(3, 'Carl',  130000),
(4, 'Diana', 130000),
(5, 'Evan',  110000);

-- Nth salary extraction via DENSE_RANK (e.g. N = 3)
WITH RankedSalaries AS (
    SELECT 
        salary,
        DENSE_RANK() OVER (ORDER BY salary DESC) as ranking
    FROM employees
)
SELECT salary AS nth_highest_salary
FROM RankedSalaries
WHERE ranking = 3
LIMIT 1;
