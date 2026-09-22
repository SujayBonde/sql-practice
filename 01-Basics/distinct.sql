-- Deduplication of result sets
-- Target: ANSI SQL

DROP TABLE IF EXISTS customer_orders;

CREATE TABLE customer_orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_category VARCHAR(50),
    order_city VARCHAR(50)
);

INSERT INTO customer_orders VALUES
(1, 101, 'Electronics', 'New York'),
(2, 102, 'Clothing',    'Los Angeles'),
(3, 101, 'Electronics', 'New York'),
(4, 103, 'Home Goods',  'Chicago'),
(5, 102, 'Electronics', 'Los Angeles'),
(6, 104, 'Books',        'New York'),
(7, 105, 'Clothing',    'Chicago');

-- Single-column distinct
SELECT DISTINCT product_category 
FROM customer_orders;

-- Multi-column distinct combination
SELECT DISTINCT product_category, order_city 
FROM customer_orders 
ORDER BY product_category, order_city;

-- Cardinality check via distinct aggregate
SELECT 
    COUNT(*) AS total_rows,
    COUNT(DISTINCT customer_id) AS unique_customers,
    COUNT(DISTINCT product_category) AS unique_categories
FROM customer_orders;
