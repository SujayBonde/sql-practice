-- Record deletion and truncation semantics
-- Target: ANSI SQL

DROP TABLE IF EXISTS audit_logs;

CREATE TABLE audit_logs (
    log_id INT PRIMARY KEY,
    action_name VARCHAR(100),
    log_severity VARCHAR(20),
    logged_at DATE
);

INSERT INTO audit_logs VALUES
(1, 'User Login', 'INFO', '2022-01-01'),
(2, 'Failed Login', 'WARN', '2022-01-02'),
(3, 'Password Reset', 'INFO', '2023-05-10'),
(4, 'Server Reboot', 'CRITICAL', '2023-06-01'),
(5, 'User Logout', 'INFO', '2023-06-02');

-- Filtered deletion
DELETE FROM audit_logs
WHERE logged_at < '2023-01-01';

-- Multi-predicate deletion
DELETE FROM audit_logs
WHERE log_severity = 'INFO' AND logged_at < '2023-06-01';

-- Unfiltered deletion alternatives:
-- DELETE FROM audit_logs;      -- Transaction-logged row deletion
-- TRUNCATE TABLE audit_logs;  -- Direct deallocation of storage pages

SELECT * FROM audit_logs;
