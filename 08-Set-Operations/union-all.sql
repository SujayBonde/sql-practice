-- Set union preserving duplicates
-- Target: ANSI SQL

DROP TABLE IF EXISTS online_orders;
DROP TABLE IF EXISTS store_orders;

CREATE TABLE online_orders (
    order_id INT,
    customer_id INT,
    amount DECIMAL(10, 2)
);

CREATE TABLE store_orders (
    order_id INT,
    customer_id INT,
    amount DECIMAL(10, 2)
);

INSERT INTO online_orders VALUES
(1, 101, 120.00),
(2, 102, 450.00);

INSERT INTO store_orders VALUES
(3, 101, 120.00),
(4, 103, 85.00);

-- Unchecked set concatenation
SELECT 'ONLINE' AS source, order_id, customer_id, amount FROM online_orders
UNION ALL
SELECT 'STORE' AS source, order_id, customer_id, amount FROM store_orders
ORDER BY order_id;
