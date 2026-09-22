-- INNER JOIN: Equijoin intersection
-- Target: ANSI SQL

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

INSERT INTO customers VALUES
(1, 'Alice',   'Seattle'),
(2, 'Bob',     'Austin'),
(3, 'Charlie', 'Boston'),
(4, 'Diana',   'Denver');

INSERT INTO orders VALUES
(101, 1, '2023-08-01', 150.00),
(102, 1, '2023-08-05', 75.00),
(103, 2, '2023-08-10', 320.00);

-- Matching records across both tables
SELECT 
    c.customer_id,
    c.name,
    c.city,
    o.order_id,
    o.order_date,
    o.total_amount
FROM customers AS c
INNER JOIN orders AS o ON c.customer_id = o.customer_id
ORDER BY o.order_id;
