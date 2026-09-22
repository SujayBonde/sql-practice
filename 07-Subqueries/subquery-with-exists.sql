-- Existence predicates: EXISTS and NOT EXISTS
-- Target: ANSI SQL

DROP TABLE IF EXISTS project_tasks;
DROP TABLE IF EXISTS projects;

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    title VARCHAR(100)
);

CREATE TABLE project_tasks (
    task_id INT PRIMARY KEY,
    project_id INT,
    status VARCHAR(20)
);

INSERT INTO projects VALUES
(1, 'Website Redesign'),
(2, 'Mobile App Launch'),
(3, 'Database Migration');

INSERT INTO project_tasks VALUES
(101, 1, 'COMPLETED'),
(102, 1, 'IN_PROGRESS'),
(103, 2, 'COMPLETED');

-- Correlated existence predicate
SELECT p.project_id, p.title
FROM projects p
WHERE EXISTS (
    SELECT 1 
    FROM project_tasks t 
    WHERE t.project_id = p.project_id 
      AND t.status = 'IN_PROGRESS'
);

-- Correlated non-existence predicate
SELECT p.project_id, p.title
FROM projects p
WHERE NOT EXISTS (
    SELECT 1 
    FROM project_tasks t 
    WHERE t.project_id = p.project_id
);
