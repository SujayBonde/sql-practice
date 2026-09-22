-- One-to-One (1:1) relationship implementation
-- Target: ANSI SQL

DROP TABLE IF EXISTS user_settings;
DROP TABLE IF EXISTS app_users;

CREATE TABLE app_users (
    user_id INT PRIMARY KEY,
    email VARCHAR(100) NOT NULL UNIQUE,
    full_name VARCHAR(100) NOT NULL
);

-- 1:1 enforced by matching primary key and foreign key constraint
CREATE TABLE user_settings (
    user_id INT PRIMARY KEY,
    dark_mode BOOLEAN DEFAULT TRUE,
    email_notifications BOOLEAN DEFAULT FALSE,
    language VARCHAR(10) DEFAULT 'en-US',
    FOREIGN KEY (user_id) REFERENCES app_users(user_id) ON DELETE CASCADE
);

INSERT INTO app_users VALUES (1, 'alice@crypto.org', 'Alice Nakamoto');
INSERT INTO user_settings VALUES (1, TRUE, TRUE, 'en-US');

SELECT 
    u.email,
    u.full_name,
    s.dark_mode,
    s.language
FROM app_users u
JOIN user_settings s ON u.user_id = s.user_id;
