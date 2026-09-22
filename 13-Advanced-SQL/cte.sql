-- Common Table Expressions (CTE / WITH clause)
-- Target: ANSI SQL

DROP TABLE IF EXISTS regional_sales;

CREATE TABLE regional_sales (
    region VARCHAR(50),
    product VARCHAR(50),
    sales_amount DECIMAL(10, 2)
);

INSERT INTO regional_sales VALUES
('North', 'Laptops',  120000),
('North', 'Phones',   85000),
('South', 'Laptops',  95000),
('South', 'Phones',   110000),
('East',  'Laptops',  45000),
('East',  'Phones',   60000);

-- Multi-stage CTE pipeline
WITH RegionTotals AS (
    SELECT 
        region,
        SUM(sales_amount) AS total_revenue
    FROM regional_sales
    GROUP BY region
),
AverageRegionalRevenue AS (
    SELECT AVG(total_revenue) AS benchmark_avg
    FROM RegionTotals
)
SELECT 
    r.region,
    r.total_revenue,
    ROUND(a.benchmark_avg, 2) AS benchmark_avg,
    ROUND(r.total_revenue - a.benchmark_avg, 2) AS delta
FROM RegionTotals r
CROSS JOIN AverageRegionalRevenue a
WHERE r.total_revenue > a.benchmark_avg
ORDER BY r.total_revenue DESC;
