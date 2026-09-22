-- LEAD window function: Forward row inspection
-- Target: ANSI SQL

DROP TABLE IF EXISTS monthly_metric;

CREATE TABLE monthly_metric (
    month_num INT PRIMARY KEY,
    revenue DECIMAL(10, 2)
);

INSERT INTO monthly_metric VALUES
(1, 10000.00),
(2, 12500.00),
(3, 11800.00),
(4, 15000.00);

-- Forward offset inspection
SELECT 
    month_num,
    revenue,
    LEAD(revenue, 1) OVER(ORDER BY month_num ASC) AS next_month_revenue,
    ROUND(LEAD(revenue, 1) OVER(ORDER BY month_num ASC) - revenue, 2) AS forward_delta
FROM monthly_metric;
