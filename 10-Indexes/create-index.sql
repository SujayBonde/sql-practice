-- B-Tree index creation
-- Target: ANSI SQL

DROP TABLE IF EXISTS customer_accounts;

CREATE TABLE customer_accounts (
    account_id INT PRIMARY KEY,
    email VARCHAR(100),
    country_code VARCHAR(5),
    created_at TIMESTAMP
);

INSERT INTO customer_accounts VALUES
(1, 'user1@gmail.com', 'US', CURRENT_TIMESTAMP),
(2, 'user2@yahoo.com', 'UK', CURRENT_TIMESTAMP),
(3, 'user3@gmail.com', 'CA', CURRENT_TIMESTAMP);

-- Secondary index definition
CREATE INDEX idx_customers_email 
ON customer_accounts(email);

SELECT * FROM customer_accounts 
WHERE email = 'user1@gmail.com';
