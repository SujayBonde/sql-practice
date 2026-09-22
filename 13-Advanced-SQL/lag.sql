-- LAG window function: Backward row inspection
-- Target: ANSI SQL

DROP TABLE IF EXISTS quarterly_revenue;

CREATE TABLE quarterly_revenue (
    fiscal_year INT,
    quarter INT,
    revenue DECIMAL(12, 2),
    PRIMARY KEY (fiscal_year, quarter)
);

INSERT INTO quarterly_revenue VALUES
(2023, 1, 250000.00),
(2023, 2, 280000.00),
(2023, 3, 310000.00),
(2023, 4, 390000.00);

-- Backward offset inspection and period-over-period delta calculation
SELECT 
    fiscal_year,
    quarter,
    revenue,
    LAG(revenue, 1, 0.00) OVER(ORDER BY fiscal_year, quarter) AS prev_revenue,
    ROUND(
        ((revenue - LAG(revenue, 1) OVER(ORDER BY fiscal_year, quarter)) / 
         NULLIF(LAG(revenue, 1) OVER(ORDER BY fiscal_year, quarter), 0)) * 100, 
        2
    ) AS qoq_growth_pct
FROM quarterly_revenue;
