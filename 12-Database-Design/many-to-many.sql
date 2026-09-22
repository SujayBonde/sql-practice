-- Many-to-Many (M:N) relationship with junction table
-- Target: ANSI SQL

DROP TABLE IF EXISTS student_courses;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS students;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    credits INT DEFAULT 3
);

-- Junction bridge table
CREATE TABLE student_courses (
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrolled_date DATE DEFAULT CURRENT_DATE,
    grade CHAR(2),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);

INSERT INTO students VALUES (1, 'Linus'), (2, 'Grace');
INSERT INTO courses VALUES (101, 'Operating Systems', 4), (102, 'Compiler Design', 4), (103, 'Databases', 3);

INSERT INTO student_courses (student_id, course_id) VALUES
(1, 101), (1, 102), (1, 103),
(2, 102), (2, 103);

SELECT 
    s.name AS student_name,
    c.title AS course_title,
    c.credits
FROM students s
JOIN student_courses sc ON s.student_id = sc.student_id
JOIN courses c ON sc.course_id = c.course_id
WHERE s.name = 'Linus';
