-- Result set truncation and pagination
-- Target: ANSI SQL / MySQL / PostgreSQL / SQLite

DROP TABLE IF EXISTS scores;

CREATE TABLE scores (
    player_id INT PRIMARY KEY,
    username VARCHAR(50),
    score INT
);

INSERT INTO scores VALUES
(1, 'ShadowNinja', 9850),
(2, 'PixelMage',   9420),
(3, 'DragonSlayer', 8900),
(4, 'CyberKnight', 8750),
(5, 'QuantumRecon', 8200),
(6, 'VortexGamer', 7900),
(7, 'BlazeRunner', 7600),
(8, 'EchoPhantom', 7300),
(9, 'ApexPredator', 7100),
(10, 'FrostBite',  6800);

-- Top-N filter
SELECT username, score 
FROM scores 
ORDER BY score DESC 
LIMIT 3;

-- Page 1: records 1 to 3
SELECT username, score 
FROM scores 
ORDER BY score DESC 
LIMIT 3 OFFSET 0;

-- Page 2: records 4 to 6
SELECT username, score 
FROM scores 
ORDER BY score DESC 
LIMIT 3 OFFSET 3;

-- ANSI standard equivalent:
-- SELECT username, score FROM scores ORDER BY score DESC OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY;
