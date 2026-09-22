-- Transaction commit: ACID durability
-- Target: ANSI SQL

DROP TABLE IF EXISTS bank_ledger;

CREATE TABLE bank_ledger (
    account_id INT PRIMARY KEY,
    holder_name VARCHAR(50),
    balance DECIMAL(10, 2)
);

INSERT INTO bank_ledger VALUES
(1, 'Alice', 1000.00),
(2, 'Bob',    500.00);

-- Begin unit of work
BEGIN TRANSACTION;

-- Debit
UPDATE bank_ledger 
SET balance = balance - 200.00 
WHERE account_id = 1;

-- Credit
UPDATE bank_ledger 
SET balance = balance + 200.00 
WHERE account_id = 2;

-- Persist changes
COMMIT;

SELECT * FROM bank_ledger;
