-- PRIMARY KEY constraint definition
-- Target: ANSI SQL

DROP TABLE IF EXISTS user_roles;
DROP TABLE IF EXISTS users;

-- Single-column primary key
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL
);

INSERT INTO users VALUES (1, 'john_doe', 'john@example.com');
INSERT INTO users VALUES (2, 'jane_smith', 'jane@example.com');

-- Composite primary key
CREATE TABLE user_roles (
    user_id INT,
    role_id INT,
    assigned_date DATE DEFAULT CURRENT_DATE,
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO user_roles (user_id, role_id) VALUES (1, 101);
INSERT INTO user_roles (user_id, role_id) VALUES (1, 102);
INSERT INTO user_roles (user_id, role_id) VALUES (2, 101);

SELECT * FROM users;
SELECT * FROM user_roles;
