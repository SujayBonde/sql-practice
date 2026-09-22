-- View removal without data loss
-- Target: ANSI SQL

DROP VIEW IF EXISTS v_quarterly_summary;
DROP TABLE IF EXISTS ledger;

CREATE TABLE ledger (
    entry_id INT PRIMARY KEY,
    amount DECIMAL(10, 2)
);

INSERT INTO ledger VALUES (1, 500.00), (2, 750.00);

CREATE VIEW v_quarterly_summary AS
SELECT SUM(amount) AS gross FROM ledger;

-- Remove view catalog entry
DROP VIEW IF EXISTS v_quarterly_summary;

-- Base table verification
SELECT * FROM ledger;
