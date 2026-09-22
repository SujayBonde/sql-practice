-- Row-level filtering via predicates
-- Target: ANSI SQL

DROP TABLE IF EXISTS products;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2),
    stock_quantity INT,
    is_active BOOLEAN
);

INSERT INTO products VALUES
(1, 'Laptop Pro 15', 'Electronics', 1299.99, 25, TRUE),
(2, 'Wireless Mouse', 'Electronics', 29.99, 150, TRUE),
(3, 'Desk Chair',     'Furniture',   249.50, 8,  TRUE),
(4, 'Standing Desk',  'Furniture',   599.00, 0,  FALSE),
(5, 'Coffee Mug',     'Kitchen',     14.95,  80, TRUE),
(6, 'USB-C Cable',    'Electronics', 12.50,  200, TRUE);

-- Equality predicate
SELECT * FROM products 
WHERE category = 'Electronics';

-- Range predicate
SELECT product_name, price 
FROM products 
WHERE price >= 100.00;

-- Boolean state predicate
SELECT product_name, stock_quantity 
FROM products 
WHERE is_active = TRUE;

-- Compound conditions with explicit precedence
SELECT product_name, category, price, stock_quantity 
FROM products 
WHERE (category = 'Electronics' OR category = 'Furniture')
  AND stock_quantity > 10;
