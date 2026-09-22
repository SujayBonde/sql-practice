-- Subquery membership predicates: IN and NOT IN
-- Target: ANSI SQL

DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS catalog_products;

CREATE TABLE catalog_products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50)
);

CREATE TABLE order_items (
    item_id INT PRIMARY KEY,
    product_id INT,
    quantity INT
);

INSERT INTO catalog_products VALUES
(1, 'Ergonomic Chair', 'Furniture'),
(2, 'Standing Desk',  'Furniture'),
(3, 'Wireless Mouse', 'Electronics'),
(4, 'Mechanical Keys','Electronics'),
(5, 'Coffee Mug',     'Accessories');

INSERT INTO order_items VALUES
(101, 1, 2),
(102, 3, 5),
(103, 1, 1);

-- Inclusion check
SELECT product_id, product_name, category
FROM catalog_products
WHERE product_id IN (
    SELECT DISTINCT product_id 
    FROM order_items
);

-- Exclusion check with NULL guard
SELECT product_id, product_name, category
FROM catalog_products
WHERE product_id NOT IN (
    SELECT product_id 
    FROM order_items 
    WHERE product_id IS NOT NULL
);
