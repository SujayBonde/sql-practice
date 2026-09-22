-- CROSS JOIN: Cartesian product
-- Target: ANSI SQL

DROP TABLE IF EXISTS product_sizes;
DROP TABLE IF EXISTS product_colors;

CREATE TABLE product_sizes (
    size_code VARCHAR(10) PRIMARY KEY,
    size_name VARCHAR(20)
);

CREATE TABLE product_colors (
    color_code VARCHAR(10) PRIMARY KEY,
    color_name VARCHAR(20)
);

INSERT INTO product_sizes VALUES 
('S', 'Small'), 
('M', 'Medium'), 
('L', 'Large'), 
('XL', 'Extra Large');

INSERT INTO product_colors VALUES 
('RED', 'Crimson Red'), 
('BLU', 'Navy Blue'), 
('BLK', 'Onyx Black');

-- Exhaustive combination matrix
SELECT 
    s.size_code,
    s.size_name,
    c.color_code,
    c.color_name,
    s.size_code || '-' || c.color_code AS variant_sku
FROM product_sizes AS s
CROSS JOIN product_colors AS c
ORDER BY s.size_code, c.color_code;
