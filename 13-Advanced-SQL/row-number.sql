-- ROW_NUMBER window function
-- Target: ANSI SQL

DROP TABLE IF EXISTS runner_times;

CREATE TABLE runner_times (
    runner_id INT PRIMARY KEY,
    runner_name VARCHAR(50),
    category VARCHAR(20),
    finish_seconds INT
);

INSERT INTO runner_times VALUES
(1, 'Ken',    'Marathon', 7300),
(2, 'Eliud',  'Marathon', 7210),
(3, 'Mo',     'Marathon', 7210),
(4, 'Usain',  'Sprint',   958),
(5, 'Tyson',  'Sprint',   969);

-- Deterministic sequential row numbering
SELECT 
    category,
    ROW_NUMBER() OVER(PARTITION BY category ORDER BY finish_seconds ASC) AS seq_rank,
    runner_name,
    finish_seconds
FROM runner_times;
