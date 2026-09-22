-- Data insertion operations
-- Target: ANSI SQL

DROP TABLE IF EXISTS new_leads;
DROP TABLE IF EXISTS contacts;

CREATE TABLE contacts (
    contact_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    status VARCHAR(20) DEFAULT 'ACTIVE'
);

CREATE TABLE new_leads (
    lead_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    contact_email VARCHAR(100)
);

-- Single-row insert
INSERT INTO contacts (contact_id, name, email) 
VALUES (1, 'Alice Walker', 'alice@company.org');

-- Multi-row batch insert
INSERT INTO contacts (contact_id, name, email) VALUES
(2, 'Bob Builder', 'bob@builder.org'),
(3, 'Charlie Chaplin', 'charlie@chaplin.org');

-- Insert with DEFAULT keyword
INSERT INTO contacts (contact_id, name, email, status)
VALUES (4, 'David Beckham', 'david@beckham.org', DEFAULT);

-- INSERT INTO ... SELECT pattern
INSERT INTO new_leads VALUES
(10, 'Eve Polastri', 'eve@agency.gov'),
(11, 'Villanelle', 'villanelle@assassin.fr');

INSERT INTO contacts (contact_id, name, email)
SELECT lead_id, full_name, contact_email 
FROM new_leads;

SELECT * FROM contacts;
