-- Scalar string manipulation functions
-- Target: ANSI SQL

DROP TABLE IF EXISTS customer_profiles;

CREATE TABLE customer_profiles (
    id INT PRIMARY KEY,
    full_name VARCHAR(100),
    email_address VARCHAR(100),
    raw_phone VARCHAR(50)
);

INSERT INTO customer_profiles VALUES
(1, '  Alice Morgan  ', 'ALICE.MORGAN@EXAMPLE.COM', '(555)-234-5678'),
(2, 'bob builder',      'bob.builder@gmail.com',     ' 555-876-5432 '),
(3, 'charlie Brown',    'charlie_b@work.org',        '5551239876');

-- Case normalization
SELECT 
    full_name,
    UPPER(full_name) AS name_upper,
    LOWER(email_address) AS email_lower
FROM customer_profiles;

-- Whitespace trimming
SELECT 
    full_name,
    LENGTH(full_name) AS length_before,
    TRIM(full_name) AS name_trimmed,
    LENGTH(TRIM(full_name)) AS length_after
FROM customer_profiles;

-- Substring extraction (1-indexed)
SELECT 
    email_address,
    SUBSTRING(email_address, 1, 5) AS prefix_5
FROM customer_profiles;

-- Character replacement
SELECT 
    raw_phone,
    REPLACE(REPLACE(REPLACE(TRIM(raw_phone), '(', ''), ')', ''), '-', '') AS digits_only
FROM customer_profiles;
