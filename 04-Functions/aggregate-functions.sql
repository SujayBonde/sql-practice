-- Standard aggregate functions
-- Target: ANSI SQL

DROP TABLE IF EXISTS sales_transactions;

CREATE TABLE sales_transactions (
    transaction_id INT PRIMARY KEY,
    cashier_id INT,
    product VARCHAR(50),
    quantity INT,
    amount DECIMAL(10, 2),
    discount DECIMAL(10, 2)
);

INSERT INTO sales_transactions VALUES
(1, 101, 'Mechanical Keyboard', 2, 180.00, 10.00),
(2, 101, 'Gaming Mouse',        1, 45.00,  0.00),
(3, 102, 'UltraWide Monitor',    1, 450.00, 50.00),
(4, 102, 'HDMI Cable',           3, 30.00,  NULL),
(5, 103, 'USB Hub',              2, 50.00,  5.00),
(6, 101, 'Desk Mat',             1, 25.00,  0.00);

-- COUNT(*) vs COUNT(col) nullability behavior
SELECT 
    COUNT(*) AS total_rows,
    COUNT(discount) AS non_null_discounts
FROM sales_transactions;

-- Basic aggregate metrics
SELECT 
    SUM(amount) AS total_gross,
    AVG(amount) AS average_amount,
    MIN(amount) AS min_amount,
    MAX(amount) AS max_amount,
    SUM(quantity) AS total_units
FROM sales_transactions;
