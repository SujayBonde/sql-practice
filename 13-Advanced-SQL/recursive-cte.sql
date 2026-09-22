-- Recursive CTE: Tree and sequence generation
-- Target: ANSI SQL

-- Sequence generator
WITH RECURSIVE NumberSeries AS (
    SELECT 1 AS num
    UNION ALL
    SELECT num + 1 
    FROM NumberSeries 
    WHERE num < 5
)
SELECT * FROM NumberSeries;

-- Hierarchical graph traversal
DROP TABLE IF EXISTS org_chart;

CREATE TABLE org_chart (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT
);

INSERT INTO org_chart VALUES
(1, 'CEO - Elizabeth', NULL),
(2, 'VP Tech - Marcus', 1),
(3, 'VP Product - Sarah', 1),
(4, 'Dev Lead - Alex', 2),
(5, 'Senior Dev - Elena', 4),
(6, 'Junior Dev - Carlos', 5);

WITH RECURSIVE HierarchyCTE AS (
    SELECT 
        emp_id, 
        name, 
        manager_id, 
        1 AS depth_level,
        CAST(name AS VARCHAR(255)) AS node_path
    FROM org_chart
    WHERE manager_id IS NULL

    UNION ALL

    SELECT 
        o.emp_id, 
        o.name, 
        o.manager_id, 
        h.depth_level + 1,
        CAST(h.node_path || ' -> ' || o.name AS VARCHAR(255))
    FROM org_chart o
    INNER JOIN HierarchyCTE h ON o.manager_id = h.emp_id
)
SELECT depth_level, name, node_path
FROM HierarchyCTE
ORDER BY depth_level, emp_id;
