-- Targeted record modification
-- Target: ANSI SQL

DROP TABLE IF EXISTS inventory;

CREATE TABLE inventory (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    stock_qty INT,
    last_restocked DATE
);

INSERT INTO inventory VALUES
(1, 'Gaming Monitor', 299.99, 15, '2023-01-10'),
(2, 'Mechanical Keyboard', 89.99, 4, '2023-01-12'),
(3, 'Wireless Mouse', 49.99, 2, '2023-01-15');

-- Single column update
UPDATE inventory
SET price = 279.99
WHERE product_id = 1;

-- Multi-column update
UPDATE inventory
SET stock_qty = stock_qty + 50,
    last_restocked = '2023-11-15'
WHERE product_id = 2;

-- Calculated update based on condition
UPDATE inventory
SET price = price * 0.90
WHERE stock_qty < 5;

SELECT * FROM inventory;
