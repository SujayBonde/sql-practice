-- Mathematical scalar functions
-- Target: ANSI SQL

DROP TABLE IF EXISTS product_pricing;

CREATE TABLE product_pricing (
    product_id INT PRIMARY KEY,
    name VARCHAR(50),
    cost_price DECIMAL(10, 4),
    markup_factor DECIMAL(5, 3),
    stock_boxes INT,
    units_per_box INT
);

INSERT INTO product_pricing VALUES
(1, 'Espresso Blend', 12.3456, 1.455, 14, 6),
(2, 'Cold Brew Roast', 8.7891, 1.333, 25, 4),
(3, 'French Roast',   15.5555, 1.625, 9,  12);

-- Rounding, ceiling, and floor
SELECT 
    name,
    cost_price,
    ROUND(cost_price, 2) AS rounded_2,
    ROUND(cost_price, 0) AS rounded_int,
    CEIL(cost_price) AS ceiling_val,
    FLOOR(cost_price) AS floor_val
FROM product_pricing;

-- Absolute value and modulus
SELECT 
    ABS(-150.25) AS abs_negative,
    MOD(27, 4) AS mod_result;
