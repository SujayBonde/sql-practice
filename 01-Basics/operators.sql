-- Comparison, logical, set-membership, and pattern matching operators
-- Target: ANSI SQL

DROP TABLE IF EXISTS books;

CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(50),
    price DECIMAL(6, 2),
    rating DECIMAL(3, 1),
    published_year INT
);

INSERT INTO books VALUES
(1, 'Clean Code', 'Robert Martin', 35.00, 4.7, 2008),
(2, 'The Pragmatic Programmer', 'David Thomas', 42.50, 4.8, 1999),
(3, 'Design Patterns', 'Erich Gamma', 54.00, 4.6, 1994),
(4, 'Refactoring', 'Martin Fowler', 48.00, 4.7, 1999),
(5, 'Database Internals', 'Alex Petrov', 59.99, 4.5, 2019),
(6, 'SQL Antipatterns', 'Bill Karwin', 32.00, 4.4, 2010);

-- BETWEEN operator (closed interval: [1995, 2010])
SELECT title, published_year 
FROM books 
WHERE published_year BETWEEN 1995 AND 2010;

-- IN operator
SELECT title, author, price 
FROM books 
WHERE author IN ('Martin Fowler', 'Robert Martin', 'Bill Karwin');

-- NOT IN operator
SELECT title, published_year 
FROM books 
WHERE published_year NOT IN (1994, 1999);

-- LIKE pattern matching (% = wildcard, _ = single char)
SELECT title FROM books WHERE title LIKE 'Clean%';
SELECT title FROM books WHERE title LIKE '%Programmer%';

-- Arithmetic evaluation
SELECT 
    title,
    price,
    ROUND(price * 0.85, 2) AS discounted_price
FROM books;
