-- Analytical queries: Employee and payroll system
-- Target: ANSI SQL

-- 1. Department payroll and budget headroom
SELECT 
    d.department_name,
    COUNT(e.employee_id) AS total_employees,
    d.annual_budget,
    SUM(e.salary) AS total_annual_payroll,
    ROUND(AVG(e.salary), 2) AS avg_employee_salary,
    ROUND(d.annual_budget - SUM(e.salary), 2) AS remaining_budget_headroom
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name, d.annual_budget
ORDER BY total_annual_payroll DESC;

-- 2. Management hierarchy
SELECT 
    e.first_name || ' ' || e.last_name AS employee_name,
    r.title AS job_title,
    d.department_name,
    COALESCE(m.first_name || ' ' || m.last_name, 'Board of Directors') AS reports_to
FROM employees e
JOIN roles r ON e.role_id = r.role_id
JOIN departments d ON e.department_id = d.department_id
LEFT JOIN employees m ON e.manager_id = m.employee_id
ORDER BY d.department_name, e.manager_id;

-- 3. Project allocation capacity check
SELECT 
    e.employee_id,
    e.first_name || ' ' || e.last_name AS employee_name,
    COUNT(ep.project_id) AS active_projects,
    SUM(ep.allocated_hours_per_week) AS total_weekly_hours,
    CASE 
        WHEN SUM(ep.allocated_hours_per_week) > 40 THEN 'OVERALLOCATED'
        WHEN SUM(ep.allocated_hours_per_week) = 40 THEN 'FULL_CAPACITY'
        ELSE 'AVAILABLE_BANDWIDTH'
    END AS workload_status
FROM employees e
JOIN employee_projects ep ON e.employee_id = ep.employee_id
GROUP BY e.employee_id, e.first_name, e.last_name
ORDER BY total_weekly_hours DESC;

-- 4. Intra-department salary ranking
SELECT 
    d.department_name,
    e.first_name || ' ' || e.last_name AS employee_name,
    e.salary,
    DENSE_RANK() OVER(PARTITION BY d.department_name ORDER BY e.salary DESC) AS salary_rank_in_dept
FROM employees e
JOIN departments d ON e.department_id = d.department_id
ORDER BY d.department_name, salary_rank_in_dept;

-- 5. Project resourcing breakdown
SELECT 
    p.project_name,
    d.department_name,
    p.budget,
    COUNT(ep.employee_id) AS team_size,
    COALESCE(SUM(ep.allocated_hours_per_week), 0) AS total_weekly_hours_dedicated
FROM projects p
JOIN departments d ON p.department_id = d.department_id
LEFT JOIN employee_projects ep ON p.project_id = ep.project_id
GROUP BY p.project_id, p.project_name, d.department_name, p.budget
ORDER BY p.budget DESC;
