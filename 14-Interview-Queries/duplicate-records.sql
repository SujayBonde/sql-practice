-- Problem: Identify duplicate records
-- Target: ANSI SQL

DROP TABLE IF EXISTS user_contacts;

CREATE TABLE user_contacts (
    id INT PRIMARY KEY,
    email VARCHAR(100),
    phone VARCHAR(20)
);

INSERT INTO user_contacts VALUES
(1, 'john@example.com', '555-0100'),
(2, 'jane@example.com', '555-0200'),
(3, 'john@example.com', '555-0100'),
(4, 'john@example.com', '555-9999'),
(5, 'mark@example.com', '555-0300');

-- Duplicates on single column
SELECT email, COUNT(*) AS occurrences
FROM user_contacts
GROUP BY email
HAVING COUNT(*) > 1;

-- Duplicates on composite key (email, phone)
SELECT email, phone, COUNT(*) AS occurrences
FROM user_contacts
GROUP BY email, phone
HAVING COUNT(*) > 1;
