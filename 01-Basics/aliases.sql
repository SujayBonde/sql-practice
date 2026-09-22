-- Column and table aliasing
-- Target: ANSI SQL

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS clients;

CREATE TABLE clients (
    client_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    client_id INT,
    order_amount DECIMAL(10, 2),
    tax_rate DECIMAL(4, 2)
);

INSERT INTO clients VALUES 
(1, 'Sara', 'Connor'),
(2, 'John', 'Doe');

INSERT INTO orders VALUES
(1001, 1, 250.00, 0.08),
(1002, 2, 499.99, 0.07);

-- Standard concatenation and column aliases
SELECT 
    first_name AS given_name,
    last_name AS surname,
    first_name || ' ' || last_name AS full_name
FROM clients;

-- Quoted identifiers for aliases with spaces
SELECT 
    order_id,
    order_amount,
    order_amount * tax_rate AS "tax_amount",
    order_amount * (1 + tax_rate) AS "gross_total"
FROM orders;

-- Table qualifiers with alias prefix
SELECT 
    c.client_id,
    c.first_name,
    o.order_id,
    o.order_amount
FROM clients AS c
JOIN orders AS o ON c.client_id = o.client_id;
