-- DEFAULT constraint evaluation
-- Target: ANSI SQL

DROP TABLE IF EXISTS tickets;

CREATE TABLE tickets (
    ticket_id INT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    status VARCHAR(20) DEFAULT 'OPEN',
    priority VARCHAR(10) DEFAULT 'MEDIUM',
    view_count INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insertion with default population
INSERT INTO tickets (ticket_id, title) 
VALUES (1, 'Service timeout exception');

-- Insertion with explicit values overriding default
INSERT INTO tickets (ticket_id, title, status, priority)
VALUES (2, 'Database backup cron failure', 'IN_PROGRESS', 'HIGH');

SELECT * FROM tickets;
