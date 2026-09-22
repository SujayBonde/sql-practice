-- Data retrieval and projection
-- Target: ANSI SQL

DROP TABLE IF EXISTS store_sales;

CREATE TABLE store_sales (
    sale_id INT PRIMARY KEY,
    store_branch VARCHAR(50),
    item_name VARCHAR(100),
    unit_price DECIMAL(8, 2),
    units_sold INT,
    sale_date DATE
);

INSERT INTO store_sales VALUES
(1, 'North Branch', 'Espresso Machine', 450.00, 4, '2023-11-01'),
(2, 'North Branch', 'Coffee Beans 1kg',  22.00, 30, '2023-11-01'),
(3, 'South Branch', 'Espresso Machine', 450.00, 2, '2023-11-02'),
(4, 'South Branch', 'Milk Frother',      45.00, 15, '2023-11-02'),
(5, 'West Branch',  'Coffee Grinder',    120.00, 8, '2023-11-03');

-- Computed projection
SELECT 
    sale_id,
    store_branch,
    item_name,
    unit_price,
    units_sold,
    unit_price * units_sold AS total_revenue
FROM store_sales;

-- Compound predicate filter
SELECT item_name, unit_price, units_sold 
FROM store_sales 
WHERE store_branch = 'North Branch' AND units_sold >= 5;

-- Ordered limit
SELECT store_branch, item_name, (unit_price * units_sold) AS revenue
FROM store_sales
ORDER BY revenue DESC
LIMIT 1;
