-- LEFT JOIN: Left outer join with anti-join pattern
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

-- Left join preserving unmatched left rows
SELECT 
    c.customer_id,
    c.name,
    o.order_id,
    o.total_amount
FROM customers AS c
LEFT JOIN orders AS o ON c.customer_id = o.customer_id
ORDER BY c.customer_id;

-- Anti-join: Unmatched left rows
SELECT 
    c.customer_id,
    c.name,
    c.city
FROM customers AS c
LEFT JOIN orders AS o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
