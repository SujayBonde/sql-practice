-- FULL OUTER JOIN: Full outer union
-- Target: ANSI SQL / SQLite / MySQL emulation

DROP TABLE IF EXISTS project_contractors;
DROP TABLE IF EXISTS staff_engineers;

CREATE TABLE staff_engineers (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    tech_stack VARCHAR(50)
);

CREATE TABLE project_contractors (
    contractor_id INT PRIMARY KEY,
    name VARCHAR(50),
    agency VARCHAR(50),
    assigned_lead_id INT
);

INSERT INTO staff_engineers VALUES
(1, 'David Heinemeier', 'Ruby'),
(2, 'Brendan Eich',     'JavaScript'),
(3, 'Guido van Rossum', 'Python');

INSERT INTO project_contractors VALUES
(501, 'Linus Torvalds', 'Kernel Ltd', 1),
(502, 'Ken Thompson',   'Bell Labs',  2),
(503, 'James Gosling',  'JavaWorks',  99);

-- Dialect standard syntax:
-- SELECT s.name, c.name FROM staff_engineers s FULL OUTER JOIN project_contractors c ON s.emp_id = c.assigned_lead_id;

-- Universal emulation via UNION
SELECT 
    s.name AS staff_lead,
    c.name AS contractor
FROM staff_engineers AS s
LEFT JOIN project_contractors AS c ON s.emp_id = c.assigned_lead_id
UNION
SELECT 
    s.name AS staff_lead,
    c.name AS contractor
FROM project_contractors AS c
LEFT JOIN staff_engineers AS s ON s.emp_id = c.assigned_lead_id;
