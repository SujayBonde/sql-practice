-- RANK window function: Rank with gaps on ties
-- Target: ANSI SQL

DROP TABLE IF EXISTS student_test_scores;

CREATE TABLE student_test_scores (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    subject VARCHAR(30),
    marks INT
);

INSERT INTO student_test_scores VALUES
(1, 'Alice',   'Math', 95),
(2, 'Bob',     'Math', 90),
(3, 'Charlie', 'Math', 90),
(4, 'David',   'Math', 85);

-- RANK assigns equal rank to ties, skipping subsequent ranks
SELECT 
    subject,
    RANK() OVER(PARTITION BY subject ORDER BY marks DESC) AS rank_pos,
    name,
    marks
FROM student_test_scores;
