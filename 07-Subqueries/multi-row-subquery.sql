-- Multi-row subquery operators: ALL and ANY
-- Target: ANSI SQL

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_amount DECIMAL(10, 2)
);

INSERT INTO customers VALUES
(1, 'Alice', 'Germany'),
(2, 'Bob',   'USA'),
(3, 'Carla', 'USA'),
(4, 'David', 'UK');

INSERT INTO orders VALUES
(101, 1, 500.00),
(102, 2, 1200.00),
(103, 2, 450.00),
(104, 3, 300.00),
(105, 4, 1500.00);

-- > ALL operator: Exceeds all values in subquery set
SELECT order_id, customer_id, order_amount
FROM orders
WHERE order_amount > ALL (
    SELECT o.order_amount
    FROM orders o
    JOIN customers c ON o.customer_id = c.customer_id
    WHERE c.country = 'USA'
);

-- > ANY operator: Exceeds at least one value in subquery set
SELECT order_id, customer_id, order_amount
FROM orders
WHERE order_amount > ANY (
    SELECT o.order_amount
    FROM orders o
    JOIN customers c ON o.customer_id = c.customer_id
    WHERE c.country = 'Germany'
);
