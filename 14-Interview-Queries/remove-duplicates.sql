-- Problem: Remove duplicate rows retaining minimum identifier (LeetCode #196)
-- Target: ANSI SQL

DROP TABLE IF EXISTS customer_leads;

CREATE TABLE customer_leads (
    lead_id INT PRIMARY KEY,
    email VARCHAR(100),
    full_name VARCHAR(50)
);

INSERT INTO customer_leads VALUES
(1, 'alex@domain.com', 'Alex Smith'),
(2, 'beth@domain.com', 'Beth White'),
(3, 'alex@domain.com', 'Alex Smith'),
(4, 'beth@domain.com', 'Beth White'),
(5, 'carl@domain.com', 'Carl Jones');

-- Deduplication: Delete rows where ID != minimum ID per group
DELETE FROM customer_leads
WHERE lead_id NOT IN (
    SELECT MIN(lead_id)
    FROM (SELECT * FROM customer_leads) AS cl_temp
    GROUP BY email
);

SELECT * FROM customer_leads;
