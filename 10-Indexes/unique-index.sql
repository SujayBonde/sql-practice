-- Unique index creation
-- Target: ANSI SQL

DROP TABLE IF EXISTS user_credentials;

CREATE TABLE user_credentials (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    ssn_tax_id VARCHAR(20) NOT NULL
);

-- Unique index constraining candidate key
CREATE UNIQUE INDEX udx_user_ssn 
ON user_credentials(ssn_tax_id);

INSERT INTO user_credentials VALUES (1, 'neo', 'TAX-999-001');

SELECT * FROM user_credentials;
