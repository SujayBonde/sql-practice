-- Temporal functions and extraction
-- Target: ANSI SQL

DROP TABLE IF EXISTS subscriptions;

CREATE TABLE subscriptions (
    sub_id INT PRIMARY KEY,
    user_name VARCHAR(50),
    start_date DATE,
    end_date DATE,
    created_at TIMESTAMP
);

INSERT INTO subscriptions VALUES
(1, 'Alice',   '2023-01-15', '2024-01-15', '2023-01-15 09:30:00'),
(2, 'Bob',     '2023-06-01', '2023-12-01', '2023-06-01 14:15:20'),
(3, 'Charlie', '2023-09-10', '2024-09-10', '2023-09-10 18:00:00');

-- Current date and timestamp
SELECT 
    CURRENT_DATE AS current_system_date,
    CURRENT_TIMESTAMP AS current_system_ts;

-- Component extraction
SELECT 
    sub_id,
    start_date,
    EXTRACT(YEAR FROM start_date) AS start_year,
    EXTRACT(MONTH FROM start_date) AS start_month,
    EXTRACT(DAY FROM start_date) AS start_day
FROM subscriptions;
