-- FOREIGN KEY constraint and referential integrity policies
-- Target: ANSI SQL

DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    CONSTRAINT fk_customer
        FOREIGN KEY (customer_id) 
        REFERENCES customers(customer_id) 
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE order_items (
    item_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_name VARCHAR(100),
    CONSTRAINT fk_order 
        FOREIGN KEY (order_id) 
        REFERENCES orders(order_id)
        ON DELETE CASCADE
);

INSERT INTO customers VALUES (1, 'Alice Wonder'), (2, 'Bob Builder');
INSERT INTO orders VALUES (101, 1, '2023-10-01'), (102, 2, '2023-10-02');
INSERT INTO order_items VALUES (1, 101, 'Mechanical Keyboard'), (2, 101, 'Gaming Mouse');

-- Cascade delete verification
DELETE FROM customers WHERE customer_id = 1;

SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM order_items;
