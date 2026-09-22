-- Transaction rollback: State reversion
-- Target: ANSI SQL

DROP TABLE IF EXISTS ticket_inventory;

CREATE TABLE ticket_inventory (
    event_id INT PRIMARY KEY,
    event_name VARCHAR(50),
    available_seats INT
);

INSERT INTO ticket_inventory VALUES (1, 'Rock Concert', 10);

BEGIN TRANSACTION;

UPDATE ticket_inventory
SET available_seats = available_seats - 5
WHERE event_id = 1;

-- Abort transaction and restore initial state
ROLLBACK;

SELECT * FROM ticket_inventory;
