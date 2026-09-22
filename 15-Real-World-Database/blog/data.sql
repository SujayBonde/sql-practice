-- ================================================================
-- REAL-WORLD DATABASE 3: Content Publishing & Blog Platform
-- SEED DATA (data.sql)
-- ================================================================

-- Users
INSERT INTO users VALUES
(1, 'johndoe',     'john@codeblog.dev',  'Lead Architect & Cloud Nerd', 'AUTHOR', '2023-01-01 09:00:00'),
(2, 'sarah_tech',  'sarah@codeblog.dev', 'Full Stack dev & DB lover',   'AUTHOR', '2023-01-05 10:15:00'),
(3, 'alex_editor', 'alex@codeblog.dev',  'Managing Editor',             'EDITOR', '2023-01-10 11:30:00'),
(4, 'dev_mike',    'mike@reader.com',    'Learning databases',          'READER', '2023-02-01 14:00:00'),
(5, 'code_clara',  'clara@reader.com',   'Frontend specialist',         'READER', '2023-02-15 16:45:00');

-- Categories
INSERT INTO categories VALUES
(1, 'Database Engineering', 'database-engineering'),
(2, 'Cloud Architecture',   'cloud-architecture'),
(3, 'Web Development',      'web-development');

-- Tags
INSERT INTO tags VALUES
(1, 'SQL',          'sql'),
(2, 'PostgreSQL',   'postgresql'),
(3, 'Performance',  'performance'),
(4, 'Docker',       'docker'),
(5, 'Architecture', 'architecture');

-- Posts
INSERT INTO posts VALUES
(1, 1, 1, 'Deep Dive: Understanding B-Tree Indexes', 'deep-dive-btree-indexes', 
 'B-Tree indexes are the workhorse of relational databases...', 'PUBLISHED', 4500, '2023-03-01 12:00:00', '2023-02-28 08:00:00'),

(2, 2, 1, 'Mastering Window Functions in Modern SQL', 'mastering-window-functions-sql', 
 'Window functions allow analytical calculations without collapsing row context...', 'PUBLISHED', 3200, '2023-03-15 14:30:00', '2023-03-14 10:00:00'),

(3, 1, 2, 'Zero-Downtime Database Migrations', 'zero-downtime-db-migrations', 
 'How to alter columns and split tables without taking your system offline...', 'PUBLISHED', 6100, '2023-04-02 09:00:00', '2023-04-01 11:00:00'),

(4, 2, 3, 'Next.js 14 Server Actions with SQL', 'nextjs-14-server-actions-sql', 
 'Direct database querying with server actions...', 'DRAFT', 0, NULL, '2023-04-10 15:00:00');

-- Post Tags
INSERT INTO post_tags VALUES
(1, 1), (1, 2), (1, 3), -- Post 1: SQL, PostgreSQL, Performance
(2, 1), (2, 3),         -- Post 2: SQL, Performance
(3, 2), (3, 3), (3, 5); -- Post 3: PostgreSQL, Performance, Architecture

-- Comments (Including Nested Hierarchy)
INSERT INTO comments VALUES
(1, 1, 4, NULL, 'Fantastic explanation of index leaf nodes!', '2023-03-02 08:30:00'),
(2, 1, 1, 1,    'Thanks Mike! Stay tuned for part 2 on composite indexes.', '2023-03-02 09:15:00'), -- Reply to comment 1
(3, 1, 5, 2,    'Looking forward to part 2!', '2023-03-02 10:00:00'),                              -- Nested reply to comment 2
(4, 2, 4, NULL, 'LAG and LEAD examples were very clear.', '2023-03-16 11:20:00'),
(5, 3, 5, NULL, 'Have you tried this with pg_repack?', '2023-04-03 14:10:00');

-- Post Likes
INSERT INTO post_likes VALUES
(1, 4, '2023-03-02 08:31:00'),
(1, 5, '2023-03-02 10:01:00'),
(2, 4, '2023-03-16 11:21:00'),
(3, 4, '2023-04-03 14:12:00'),
(3, 5, '2023-04-03 15:00:00');
