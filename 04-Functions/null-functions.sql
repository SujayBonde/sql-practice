-- NULL evaluation and substitution functions
-- Target: ANSI SQL

DROP TABLE IF EXISTS staff_contacts;

CREATE TABLE staff_contacts (
    staff_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    work_phone VARCHAR(20),
    cell_phone VARCHAR(20),
    home_phone VARCHAR(20),
    commission_pct DECIMAL(4, 2),
    base_salary DECIMAL(10, 2)
);

INSERT INTO staff_contacts VALUES
(1, 'Diana Ross', '555-0100', '555-0101', '555-0102', 0.15, 60000.00),
(2, 'Bruce Wayne', NULL,       '555-0202', '555-0203', NULL, 95000.00),
(3, 'Clark Kent',  NULL,       NULL,       '555-0303', 0.05, 50000.00),
(4, 'Barry Allen', NULL,       NULL,       NULL,       0.00, 45000.00);

-- COALESCE: First non-null argument
SELECT 
    name,
    COALESCE(work_phone, cell_phone, home_phone, 'UNAVAILABLE') AS primary_phone
FROM staff_contacts;

-- Arithmetic with NULL substitution
SELECT 
    name,
    base_salary,
    COALESCE(commission_pct, 0.0) AS effective_commission_rate,
    base_salary + (base_salary * COALESCE(commission_pct, 0.0)) AS gross_compensation
FROM staff_contacts;

-- NULLIF: Division by zero prevention
SELECT 
    name,
    base_salary / NULLIF(COALESCE(commission_pct, 0), 0) AS salary_to_commission_ratio
FROM staff_contacts;

-- IS NULL / IS NOT NULL predicate
SELECT name FROM staff_contacts WHERE work_phone IS NULL;
SELECT name FROM staff_contacts WHERE cell_phone IS NOT NULL;
