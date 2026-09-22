-- Comprehensive aggregation pipeline
-- Target: ANSI SQL

DROP TABLE IF EXISTS course_enrollments;

CREATE TABLE course_enrollments (
    enrollment_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    student_grade CHAR(1),
    fee_paid DECIMAL(8, 2),
    completion_rate DECIMAL(5, 2)
);

INSERT INTO course_enrollments VALUES
(1, 'Full-Stack Web Dev', 'A', 800.00, 100.00),
(2, 'Full-Stack Web Dev', 'B', 800.00, 95.00),
(3, 'Full-Stack Web Dev', 'A', 750.00, 98.00),
(4, 'Full-Stack Web Dev', 'C', 800.00, 80.00),
(5, 'Data Science 101',   'A', 1200.00, 100.00),
(6, 'Data Science 101',   'B', 1100.00, 90.00),
(7, 'Cyber Security',     'B', 600.00, 92.00),
(8, 'Cyber Security',     'A', 600.00, 96.00);

-- Multi-metric group summary
SELECT 
    course_name,
    COUNT(*) AS total_students,
    SUM(fee_paid) AS gross_revenue,
    ROUND(AVG(fee_paid), 2) AS mean_fee,
    ROUND(AVG(completion_rate), 2) AS mean_completion,
    MIN(completion_rate) AS min_completion,
    MAX(completion_rate) AS max_completion
FROM course_enrollments
GROUP BY course_name
HAVING AVG(completion_rate) >= 90.00
ORDER BY gross_revenue DESC;
