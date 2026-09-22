-- NOT NULL constraint enforcement
-- Target: ANSI SQL

DROP TABLE IF EXISTS profiles;

CREATE TABLE profiles (
    profile_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    bio TEXT,
    signup_date DATE NOT NULL
);

INSERT INTO profiles VALUES (1, 'Sarah', 'Connor', 'Security consultant', '2023-01-01');
INSERT INTO profiles VALUES (2, 'Kyle', 'Reese', NULL, '2023-01-02');

SELECT * FROM profiles;
