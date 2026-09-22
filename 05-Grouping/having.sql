-- Aggregate filtering via HAVING
-- Target: ANSI SQL

DROP TABLE IF EXISTS branch_orders;

CREATE TABLE branch_orders (
    order_id INT PRIMARY KEY,
    branch_name VARCHAR(50),
    order_total DECIMAL(10, 2)
);

INSERT INTO branch_orders VALUES
(1, 'Downtown', 250.00),
(2, 'Downtown', 320.00),
(3, 'Downtown', 180.00),
(4, 'Uptown',   50.00),
(5, 'Uptown',   75.00),
(6, 'Airport',  1200.00),
(7, 'Airport',  850.00),
(8, 'Suburbs',  30.00);

-- Filter groups by count
SELECT 
    branch_name,
    COUNT(*) AS order_count,
    SUM(order_total) AS total_sales
FROM branch_orders
GROUP BY branch_name
HAVING COUNT(*) > 2;

-- Combined WHERE and HAVING execution
SELECT 
    branch_name,
    COUNT(*) AS qualified_orders,
    AVG(order_total) AS mean_order_value
FROM branch_orders
WHERE order_total >= 100.00
GROUP BY branch_name
HAVING COUNT(*) >= 2
ORDER BY mean_order_value DESC;
