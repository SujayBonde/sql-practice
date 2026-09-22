-- SELF JOIN: Hierarchical self-referencing joins
-- Target: ANSI SQL

DROP TABLE IF EXISTS corporate_hierarchy;

CREATE TABLE corporate_hierarchy (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    job_title VARCHAR(50),
    manager_id INT
);

INSERT INTO corporate_hierarchy VALUES
(1, 'Satya',  'CEO',                NULL),
(2, 'Scott',  'EVP Cloud & AI',     1),
(3, 'Amy',    'CFO',                1),
(4, 'Kevin',  'VP Engineering',     2),
(5, 'Rachel', 'Senior Architect',   4),
(6, 'Mark',   'Software Engineer',  5);

-- Direct manager lookup
SELECT 
    e.emp_name AS employee_name,
    e.job_title AS employee_role,
    COALESCE(m.emp_name, 'None') AS manager_name,
    COALESCE(m.job_title, 'None') AS manager_role
FROM corporate_hierarchy AS e
LEFT JOIN corporate_hierarchy AS m ON e.manager_id = m.emp_id;
