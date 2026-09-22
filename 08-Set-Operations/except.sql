-- Set difference (EXCEPT / MINUS)
-- Target: ANSI SQL

DROP TABLE IF EXISTS course_all_students;
DROP TABLE IF EXISTS exam_completed;

CREATE TABLE course_all_students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE exam_completed (
    student_id INT PRIMARY KEY
);

INSERT INTO course_all_students VALUES
(1, 'Alan Turing'),
(2, 'Ada Lovelace'),
(3, 'Grace Hopper'),
(4, 'Claude Shannon');

INSERT INTO exam_completed VALUES (1), (3);

-- Difference: Table A minus Table B
SELECT student_id FROM course_all_students
EXCEPT
SELECT student_id FROM exam_completed;
