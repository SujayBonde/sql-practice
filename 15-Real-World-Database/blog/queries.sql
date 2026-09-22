-- Analytical queries: Content publishing platform
-- Target: ANSI SQL

-- 1. Content engagement summary
SELECT 
    p.post_id,
    p.title,
    u.username AS author,
    c.name AS category,
    p.view_count,
    COUNT(DISTINCT l.user_id) AS like_count,
    COUNT(DISTINCT com.comment_id) AS comment_count
FROM posts p
JOIN users u ON p.author_id = u.user_id
JOIN categories c ON p.category_id = c.category_id
LEFT JOIN post_likes l ON p.post_id = l.post_id
LEFT JOIN comments com ON p.post_id = com.post_id
WHERE p.status = 'PUBLISHED'
GROUP BY p.post_id, p.title, u.username, c.name, p.view_count
ORDER BY like_count DESC, p.view_count DESC;

-- 2. Tag aggregation per post
SELECT 
    p.title,
    GROUP_CONCAT(t.name, ', ') AS assigned_tags
FROM posts p
JOIN post_tags pt ON p.post_id = pt.post_id
JOIN tags t ON pt.tag_id = t.tag_id
GROUP BY p.post_id, p.title;

-- 3. Recursive comment thread traversal (Post ID = 1)
WITH RECURSIVE CommentHierarchy AS (
    SELECT 
        comment_id,
        post_id,
        user_id,
        parent_comment_id,
        content,
        created_at,
        1 AS depth_level,
        CAST(comment_id AS VARCHAR(255)) AS thread_path
    FROM comments
    WHERE parent_comment_id IS NULL AND post_id = 1

    UNION ALL

    SELECT 
        c.comment_id,
        c.post_id,
        c.user_id,
        c.parent_comment_id,
        c.content,
        c.created_at,
        h.depth_level + 1,
        CAST(h.thread_path || '.' || c.comment_id AS VARCHAR(255))
    FROM comments c
    INNER JOIN CommentHierarchy h ON c.parent_comment_id = h.comment_id
)
SELECT 
    h.depth_level,
    u.username,
    h.content,
    h.thread_path,
    h.created_at
FROM CommentHierarchy h
JOIN users u ON h.user_id = u.user_id
ORDER BY h.thread_path;

-- 4. Author volume and readership
SELECT 
    u.username,
    COUNT(p.post_id) AS published_count,
    SUM(p.view_count) AS total_views,
    ROUND(AVG(p.view_count), 0) AS mean_views_per_post
FROM users u
JOIN posts p ON u.user_id = p.author_id
WHERE p.status = 'PUBLISHED'
GROUP BY u.user_id, u.username
ORDER BY total_views DESC;
