-- Problem: Consecutive Numbers (LeetCode #180)
-- Target: ANSI SQL

DROP TABLE IF EXISTS logs;

CREATE TABLE logs (
    id INT PRIMARY KEY,
    num INT
);

INSERT INTO logs VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 1),
(6, 2),
(7, 2);

-- Evaluation via LEAD and LAG
WITH ConsecutiveCheck AS (
    SELECT 
        num,
        LAG(num, 1) OVER(ORDER BY id) AS prev_num,
        LEAD(num, 1) OVER(ORDER BY id) AS next_num
    FROM logs
)
SELECT DISTINCT num AS consecutive_number
FROM ConsecutiveCheck
WHERE num = prev_num AND num = next_num;
