-- Granular rollback to savepoint
-- Target: ANSI SQL

DROP TABLE IF EXISTS cart_checkout;

CREATE TABLE cart_checkout (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(50),
    price DECIMAL(10, 2)
);

BEGIN TRANSACTION;

INSERT INTO cart_checkout VALUES (1, 'Laptop', 1200.00);
SAVEPOINT sp_item_1;

INSERT INTO cart_checkout VALUES (2, 'Mouse', 40.00);
SAVEPOINT sp_item_2;

INSERT INTO cart_checkout VALUES (3, 'Invalid Item', 400.00);

-- Partial rollback to savepoint
ROLLBACK TO SAVEPOINT sp_item_2;

-- Commit retained statements
COMMIT;

SELECT * FROM cart_checkout;
