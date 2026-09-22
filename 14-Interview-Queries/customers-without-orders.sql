-- Problem: Customers Who Never Order (LeetCode #183)
-- Target: ANSI SQL

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE orders (
    id INT PRIMARY KEY,
    customer_id INT
);

INSERT INTO customers VALUES (1, 'Joe'), (2, 'Henry'), (3, 'Sam'), (4, 'Max');
INSERT INTO orders VALUES (1, 3), (2, 1);

-- Approach 1: Anti-join via LEFT JOIN
SELECT c.name AS customers_without_orders
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
WHERE o.id IS NULL;

-- Approach 2: NOT EXISTS predicate
SELECT c.name AS customers_without_orders
FROM customers c
WHERE NOT EXISTS (
    SELECT 1 FROM orders o WHERE o.customer_id = c.id
);
