-- Relational Normalization: 1NF, 2NF, 3NF
-- Target: ANSI SQL

-- First Normal Form (1NF): Atomic values, primary key, no repeating groups
DROP TABLE IF EXISTS student_courses_1nf;
CREATE TABLE student_courses_1nf (
    student_id INT,
    name VARCHAR(50),
    course_code VARCHAR(10),
    advisor_name VARCHAR(50),
    advisor_office VARCHAR(20),
    PRIMARY KEY (student_id, course_code)
);

-- Second Normal Form (2NF): 1NF + elimination of partial functional dependencies
DROP TABLE IF EXISTS students_2nf;
DROP TABLE IF EXISTS enrollments_2nf;

CREATE TABLE students_2nf (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    advisor_name VARCHAR(50),
    advisor_office VARCHAR(20)
);

CREATE TABLE enrollments_2nf (
    student_id INT,
    course_code VARCHAR(10),
    grade CHAR(2),
    PRIMARY KEY (student_id, course_code),
    FOREIGN KEY (student_id) REFERENCES students_2nf(student_id)
);

-- Third Normal Form (3NF): 2NF + elimination of transitive functional dependencies
DROP TABLE IF EXISTS advisors_3nf;
DROP TABLE IF EXISTS students_3nf;

CREATE TABLE advisors_3nf (
    advisor_id INT PRIMARY KEY,
    advisor_name VARCHAR(50) NOT NULL,
    office_room VARCHAR(20)
);

CREATE TABLE students_3nf (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    advisor_id INT,
    FOREIGN KEY (advisor_id) REFERENCES advisors_3nf(advisor_id)
);

INSERT INTO advisors_3nf VALUES (1, 'Dr. Alan Turing', 'B-101');
INSERT INTO students_3nf VALUES (101, 'Ada Lovelace', 1);

SELECT 
    s.student_id,
    s.student_name,
    a.advisor_name,
    a.office_room
FROM students_3nf s
JOIN advisors_3nf a ON s.advisor_id = a.advisor_id;
