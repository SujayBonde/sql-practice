-- ================================================================
-- REAL-WORLD DATABASE 1: Employee & Payroll Management System
-- SCHEMA DEFINITION (schema.sql)
-- ================================================================

DROP TABLE IF EXISTS employee_projects;
DROP TABLE IF EXISTS payroll_history;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS departments;

-- 1. Departments Table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE,
    building_location VARCHAR(100) NOT NULL,
    annual_budget DECIMAL(14, 2) NOT NULL CHECK (annual_budget >= 0)
);

-- 2. Job Roles Table
CREATE TABLE roles (
    role_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL UNIQUE,
    min_salary DECIMAL(10, 2) NOT NULL,
    max_salary DECIMAL(10, 2) NOT NULL,
    CONSTRAINT chk_salary_range CHECK (max_salary >= min_salary)
);

-- 3. Employees Table (Self-referencing Foreign Key for Manager)
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(25),
    hire_date DATE NOT NULL,
    salary DECIMAL(10, 2) NOT NULL CHECK (salary > 0),
    department_id INT NOT NULL,
    role_id INT NOT NULL,
    manager_id INT,
    status VARCHAR(20) DEFAULT 'ACTIVE' CHECK (status IN ('ACTIVE', 'ON_LEAVE', 'TERMINATED')),
    FOREIGN KEY (department_id) REFERENCES departments(department_id) ON DELETE RESTRICT,
    FOREIGN KEY (role_id) REFERENCES roles(role_id) ON DELETE RESTRICT,
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id) ON DELETE SET NULL
);

-- 4. Projects Table
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(150) NOT NULL,
    client_name VARCHAR(100),
    budget DECIMAL(12, 2) NOT NULL CHECK (budget >= 0),
    start_date DATE NOT NULL,
    target_end_date DATE,
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id) ON DELETE CASCADE
);

-- 5. Employee-Projects Junction Table (Many-to-Many)
CREATE TABLE employee_projects (
    employee_id INT NOT NULL,
    project_id INT NOT NULL,
    assigned_role VARCHAR(50) DEFAULT 'Contributor',
    allocated_hours_per_week INT DEFAULT 20 CHECK (allocated_hours_per_week BETWEEN 1 AND 60),
    PRIMARY KEY (employee_id, project_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id) ON DELETE CASCADE,
    FOREIGN KEY (project_id) REFERENCES projects(project_id) ON DELETE CASCADE
);

-- 6. Payroll History Table (Time-Series Tracking)
CREATE TABLE payroll_history (
    payroll_id INT PRIMARY KEY,
    employee_id INT NOT NULL,
    payment_date DATE NOT NULL,
    gross_pay DECIMAL(10, 2) NOT NULL CHECK (gross_pay > 0),
    tax_deduction DECIMAL(10, 2) NOT NULL DEFAULT 0,
    net_pay DECIMAL(10, 2) NOT NULL CHECK (net_pay > 0),
    payment_method VARCHAR(30) DEFAULT 'DIRECT_DEPOSIT',
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id) ON DELETE CASCADE
);

-- Performance Indexes
CREATE INDEX idx_emp_dept ON employees(department_id);
CREATE INDEX idx_emp_mgr ON employees(manager_id);
CREATE INDEX idx_payroll_emp_date ON payroll_history(employee_id, payment_date);
