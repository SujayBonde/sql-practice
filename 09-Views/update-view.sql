-- View replacement and modification
-- Target: ANSI SQL

DROP VIEW IF EXISTS v_active_products;
DROP TABLE IF EXISTS products;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    unit_price DECIMAL(10, 2),
    is_active BOOLEAN
);

INSERT INTO products VALUES
(1, 'Desk Lamp', 35.00, TRUE),
(2, 'Standing Mat', 49.00, TRUE),
(3, 'Old Wire', 5.00, FALSE);

-- Initial view definition
CREATE VIEW v_active_products AS
SELECT product_id, product_name, unit_price
FROM products
WHERE is_active = TRUE;

-- Redefinition via drop and recreate
DROP VIEW IF EXISTS v_active_products;

CREATE VIEW v_active_products AS
SELECT 
    product_id, 
    product_name, 
    unit_price,
    ROUND(unit_price * 1.08, 2) AS price_with_tax
FROM products
WHERE is_active = TRUE;

SELECT * FROM v_active_products;
