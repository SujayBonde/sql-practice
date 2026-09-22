-- UNIQUE constraint enforcement
-- Target: ANSI SQL

DROP TABLE IF EXISTS member_accounts;

CREATE TABLE member_accounts (
    account_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL,
    passport_number VARCHAR(20),
    phone_number VARCHAR(20),
    CONSTRAINT uq_email UNIQUE (email),
    CONSTRAINT uq_passport_phone UNIQUE (passport_number, phone_number)
);

INSERT INTO member_accounts VALUES
(1, 'dev_sam', 'sam@domain.com', 'A12345678', '+15550100');

-- Nullability with UNIQUE constraints
INSERT INTO member_accounts VALUES
(2, 'guest_one', 'guest1@domain.com', NULL, NULL),
(3, 'guest_two', 'guest2@domain.com', NULL, NULL);

SELECT * FROM member_accounts;
