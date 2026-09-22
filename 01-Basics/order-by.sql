-- Result sorting specifications
-- Target: ANSI SQL

DROP TABLE IF EXISTS students;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    grade_level INT,
    gpa DECIMAL(3, 2)
);

INSERT INTO students VALUES
(1, 'Emma', 10, 3.85),
(2, 'Liam', 11, 3.45),
(3, 'Olivia', 10, 3.95),
(4, 'Noah', 12, 3.45),
(5, 'Sophia', 11, 3.90),
(6, 'Jackson', 12, 3.70);

-- Ascending sort (default)
SELECT * FROM students 
ORDER BY gpa ASC;

-- Descending sort
SELECT * FROM students 
ORDER BY gpa DESC;

-- Multi-column sort
SELECT name, grade_level, gpa 
FROM students 
ORDER BY grade_level ASC, gpa DESC;

-- Positional index sort
SELECT name, gpa, grade_level 
FROM students 
ORDER BY 2 DESC, 3 ASC;
