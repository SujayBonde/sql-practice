-- Domain integrity via CHECK constraints
-- Target: ANSI SQL

DROP TABLE IF EXISTS bank_accounts;

CREATE TABLE bank_accounts (
    account_number INT PRIMARY KEY,
    holder_name VARCHAR(100) NOT NULL,
    balance DECIMAL(12, 2) NOT NULL,
    interest_rate DECIMAL(4, 2),
    account_type VARCHAR(20),
    CONSTRAINT chk_positive_balance CHECK (balance >= 0),
    CONSTRAINT chk_rate_range CHECK (interest_rate >= 0.0 AND interest_rate <= 15.0),
    CONSTRAINT chk_account_type CHECK (account_type IN ('SAVINGS', 'CHECKING', 'BUSINESS'))
);

INSERT INTO bank_accounts VALUES (1001, 'Walter White', 15000.00, 3.50, 'SAVINGS');
INSERT INTO bank_accounts VALUES (1002, 'Jesse Pinkman', 250.00, 1.25, 'CHECKING');

SELECT * FROM bank_accounts;
