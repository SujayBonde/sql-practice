-- Conditional branching via CASE
-- Target: ANSI SQL

DROP TABLE IF EXISTS student_scores;

CREATE TABLE student_scores (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    score INT
);

INSERT INTO student_scores VALUES
(1, 'Alice', 94),
(2, 'Bob',   82),
(3, 'Carla', 68),
(4, 'David', 54),
(5, 'Eva',   75);

-- Searched CASE
SELECT 
    name,
    score,
    CASE 
        WHEN score >= 90 THEN 'A'
        WHEN score >= 80 THEN 'B'
        WHEN score >= 70 THEN 'C'
        WHEN score >= 60 THEN 'D'
        ELSE 'F'
    END AS letter_grade,
    CASE 
        WHEN score >= 60 THEN 'PASS'
        ELSE 'FAIL'
    END AS status
FROM student_scores
ORDER BY score DESC;

-- Conditional aggregation
SELECT 
    COUNT(*) AS total_students,
    SUM(CASE WHEN score >= 60 THEN 1 ELSE 0 END) AS passing_count,
    SUM(CASE WHEN score < 60 THEN 1 ELSE 0 END) AS failing_count
FROM student_scores;
