-- Set union with distinct deduplication
-- Target: ANSI SQL

DROP TABLE IF EXISTS eu_clients;
DROP TABLE IF EXISTS us_clients;

CREATE TABLE us_clients (
    client_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE eu_clients (
    client_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100)
);

INSERT INTO us_clients VALUES
(1, 'Acme Corp', 'contact@acme.com'),
(2, 'Globex Corp', 'info@globex.com'),
(3, 'Initech', 'support@initech.com');

INSERT INTO eu_clients VALUES
(101, 'Globex Corp', 'info@globex.com'),
(102, 'Soylent NV', 'sales@soylent.nl'),
(103, 'Umbrella SA', 'info@umbrella.eu');

-- Distinct union
SELECT name, email FROM us_clients
UNION
SELECT name, email FROM eu_clients
ORDER BY name;
