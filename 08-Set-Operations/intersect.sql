-- Set intersection
-- Target: ANSI SQL

DROP TABLE IF EXISTS premium_subscribers;
DROP TABLE IF EXISTS webinar_attendees;

CREATE TABLE webinar_attendees (
    email VARCHAR(100) PRIMARY KEY
);

CREATE TABLE premium_subscribers (
    email VARCHAR(100) PRIMARY KEY
);

INSERT INTO webinar_attendees VALUES
('sarah@corp.com'),
('michael@corp.com'),
('emily@corp.com'),
('david@corp.com');

INSERT INTO premium_subscribers VALUES
('michael@corp.com'),
('emily@corp.com'),
('jessica@corp.com');

-- Common element extraction
SELECT email FROM webinar_attendees
INTERSECT
SELECT email FROM premium_subscribers;
