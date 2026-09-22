-- One-to-Many (1:N) relationship implementation
-- Target: ANSI SQL

DROP TABLE IF EXISTS blog_comments;
DROP TABLE IF EXISTS blog_posts;

-- Parent table
CREATE TABLE blog_posts (
    post_id INT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    content TEXT,
    published_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Dependent child table
CREATE TABLE blog_comments (
    comment_id INT PRIMARY KEY,
    post_id INT NOT NULL,
    commenter_name VARCHAR(50),
    comment_body TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES blog_posts(post_id) ON DELETE CASCADE
);

INSERT INTO blog_posts VALUES (1, 'Relational Schema Optimization', 'Analysis of indexing patterns...');
INSERT INTO blog_comments VALUES (101, 1, 'DevSam', 'Reviewed index recommendations.');

SELECT 
    p.post_id,
    p.title,
    COUNT(c.comment_id) AS comment_count
FROM blog_posts p
LEFT JOIN blog_comments c ON p.post_id = c.post_id
GROUP BY p.post_id, p.title;
