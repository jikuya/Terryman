CREATE TABLE IF NOT EXISTS sessions (
    id           CHAR(72) PRIMARY KEY,
    session_data TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS respecteds (
    id           INTEGER PRIMARY KEY,
    from_id      INTEGER,
    to_id        INTEGER,
    to_name      TEXT,
    tags         TEXT,
    UNIQUE KEY (from_id,to_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS tags (
    id           INTEGER PRIMARY KEY,
    text         TEXT NOT NULL,
    UNIQUE KEY (text)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT OR IGNORE INTO tags ('id', 'text') VALUES
    (1, 'perl'),
    (2, 'mysql'),
    (3, 'Amon2'),
    (4, 'Catalyst');
