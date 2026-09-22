-- ================================================================
-- REAL-WORLD DATABASE 1: Employee & Payroll Management System
-- SEED DATA (data.sql)
-- ================================================================

-- Departments
INSERT INTO departments VALUES
(1, 'Engineering',      'Building A, Floor 3', 3500000.00),
(2, 'Product & Design', 'Building A, Floor 2', 1800000.00),
(3, 'Marketing',        'Building B, Floor 1', 1200000.00),
(4, 'Finance',          'Building C, Floor 4', 950000.00),
(5, 'Human Resources',  'Building C, Floor 2', 650000.00);

-- Roles
INSERT INTO roles VALUES
(1, 'Chief Technology Officer', 190000.00, 320000.00),
(2, 'Engineering Manager',      140000.00, 210000.00),
(3, 'Staff Software Engineer',  130000.00, 195000.00),
(4, 'Software Engineer II',      95000.00, 140000.00),
(5, 'VP of Marketing',          150000.00, 220000.00),
(6, 'Marketing Lead',            85000.00, 130000.00),
(7, 'Financial Controller',     110000.00, 165000.00),
(8, 'HR Director',              105000.00, 155000.00);

-- Employees (Hierarchical)
INSERT INTO employees VALUES
-- Top Executive
(1, 'Satya', 'Nadella', 'satya@enterprise.com', '555-0100', '2015-02-01', 285000.00, 1, 1, NULL, 'ACTIVE'),
-- Managers
(2, 'Marcus', 'Aurelius', 'marcus@enterprise.com', '555-0101', '2017-06-15', 175000.00, 1, 2, 1, 'ACTIVE'),
(3, 'Helena', 'Troy', 'helena@enterprise.com', '555-0102', '2018-09-01', 165000.00, 3, 5, 1, 'ACTIVE'),
(4, 'Alexander', 'Hamilton', 'alex@enterprise.com', '555-0103', '2019-01-10', 145000.00, 4, 7, 1, 'ACTIVE'),
(5, 'Eleanor', 'Roosevelt', 'eleanor@enterprise.com', '555-0104', '2019-04-20', 135000.00, 5, 8, 1, 'ACTIVE'),
-- Engineers & Contributors
(6, 'Ada', 'Lovelace', 'ada@enterprise.com', '555-0201', '2020-03-01', 160000.00, 1, 3, 2, 'ACTIVE'),
(7, 'Alan', 'Turing', 'alan@enterprise.com', '555-0202', '2020-08-15', 155000.00, 1, 3, 2, 'ACTIVE'),
(8, 'Grace', 'Hopper', 'grace@enterprise.com', '555-0203', '2021-02-10', 125000.00, 1, 4, 2, 'ACTIVE'),
(9, 'Claude', 'Shannon', 'claude@enterprise.com', '555-0204', '2021-07-01', 118000.00, 1, 4, 2, 'ACTIVE'),
(10, 'Margaret', 'Hamilton', 'margaret@enterprise.com', '555-0205', '2022-01-15', 115000.00, 1, 4, 2, 'ACTIVE'),
-- Marketing team
(11, 'Don', 'Draper', 'don@enterprise.com', '555-0301', '2021-04-01', 110000.00, 3, 6, 3, 'ACTIVE'),
(12, 'Peggy', 'Olson', 'peggy@enterprise.com', '555-0302', '2022-05-15', 92000.00, 3, 6, 3, 'ACTIVE');

-- Projects
INSERT INTO projects VALUES
(101, 'Cloud Native Platform Migration', 'Internal', 850000.00, '2023-01-01', '2023-12-31', 1),
(102, 'AI Copilot Integration', 'Internal', 600000.00, '2023-03-15', '2024-03-15', 1),
(103, 'Global Brand Refresh 2024', 'External Partner', 400000.00, '2023-06-01', '2023-11-30', 3),
(104, 'Automated Payroll & Tax Engine', 'Internal Finance', 250000.00, '2023-02-01', '2023-09-30', 4);

-- Employee Project Assignments
INSERT INTO employee_projects VALUES
(6, 101, 'Lead Architect', 30),
(7, 101, 'Core Infrastructure Specialist', 25),
(8, 101, 'Backend Developer', 20),
(6, 102, 'Advisory Architect', 10),
(7, 102, 'Algorithm Researcher', 25),
(9, 102, 'Machine Learning Engineer', 35),
(10, 102, 'Integration Engineer', 30),
(11, 103, 'Campaign Director', 30),
(12, 103, 'Content Strategist', 35),
(4, 104, 'Project Sponsor', 5);

-- Payroll History Records
INSERT INTO payroll_history VALUES
(1, 6, '2023-10-31', 13333.33, 3333.33, 10000.00, 'DIRECT_DEPOSIT'),
(2, 7, '2023-10-31', 12916.67, 3229.17, 9687.50,  'DIRECT_DEPOSIT'),
(3, 8, '2023-10-31', 10416.67, 2604.17, 7812.50,  'DIRECT_DEPOSIT'),
(4, 9, '2023-10-31', 9833.33,  2458.33, 7375.00,  'DIRECT_DEPOSIT'),
(5, 6, '2023-11-30', 13333.33, 3333.33, 10000.00, 'DIRECT_DEPOSIT'),
(6, 7, '2023-11-30', 12916.67, 3229.17, 9687.50,  'DIRECT_DEPOSIT');
