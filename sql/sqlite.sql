CREATE TABLE IF NOT EXISTS sessions (
    id           CHAR(72) PRIMARY KEY,
    session_data TEXT
);
CREATE TABLE IF NOT EXISTS tags (
    id           INTEGER PRIMARY KEY,
    text         TEXT
);
INSERT  OR IGNORE INTO tags ('id', 'text') VALUES
    (1, 'perl'),
    (2, 'mysql'),
    (3, 'Amon2'),
    (4, 'Catalyst');

