-- Correlated subqueries: Row-by-row outer reference
-- Target: ANSI SQL

DROP TABLE IF EXISTS team_members;

CREATE TABLE team_members (
    emp_id INT PRIMARY KEY,
    dept_id INT,
    name VARCHAR(50),
    salary DECIMAL(10, 2)
);

INSERT INTO team_members VALUES
(1, 10, 'Alice',   95000),
(2, 10, 'Bob',     110000),
(3, 10, 'Charlie', 80000),
(4, 20, 'Diana',   75000),
(5, 20, 'Evan',    90000),
(6, 30, 'Frank',   60000);

-- Filter by intra-department average
SELECT 
    outer_emp.emp_id,
    outer_emp.dept_id,
    outer_emp.name,
    outer_emp.salary
FROM team_members AS outer_emp
WHERE outer_emp.salary > (
    SELECT AVG(inner_emp.salary)
    FROM team_members AS inner_emp
    WHERE inner_emp.dept_id = outer_emp.dept_id
);

-- Department maximum earner
SELECT 
    outer_emp.dept_id,
    outer_emp.name,
    outer_emp.salary
FROM team_members AS outer_emp
WHERE outer_emp.salary = (
    SELECT MAX(inner_emp.salary)
    FROM team_members AS inner_emp
    WHERE inner_emp.dept_id = outer_emp.dept_id
);
