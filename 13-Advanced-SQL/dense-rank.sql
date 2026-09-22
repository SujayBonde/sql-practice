-- DENSE_RANK window function: Rank without gaps
-- Target: ANSI SQL

DROP TABLE IF EXISTS sales_reps;

CREATE TABLE sales_reps (
    rep_id INT PRIMARY KEY,
    rep_name VARCHAR(50),
    deals_closed INT
);

INSERT INTO sales_reps VALUES
(1, 'Jordan', 15),
(2, 'Rachel', 12),
(3, 'Leo',    12),
(4, 'Chloe',  10);

-- DENSE_RANK assigns continuous rank numbers without skipping
SELECT 
    rep_name,
    deals_closed,
    RANK() OVER(ORDER BY deals_closed DESC) AS rank_with_gaps,
    DENSE_RANK() OVER(ORDER BY deals_closed DESC) AS dense_rank_contiguous
FROM sales_reps;
