-- ######################################################################

-- version
SELECT version();

-- ######################################################################

-- create user
CREATE USER debezium WITH ENCRYPTED PASSWORD 'dbz';
ALTER ROLE debezium WITH REPLICATION LOGIN;

-- ######################################################################

-- grant table permission
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO debezium;

-- ######################################################################

-- check connection

SHOW max_connections;
SELECT COUNT(*) FROM pg_stat_activity;
SELECT pid, query, state FROM pg_stat_activity;
SELECT pid, query, state FROM pg_stat_activity WHERE state LIKE 'idle';

-- ######################################################################

-- sequence
CREATE sequence seq_example_id;
CREATE sequence seq_example_id START 1 INCREMENT 1;

SELECT nextval('seq_example_id');
SELECT currval('seq_example_id');
SELECT setval('seq_example_id', 100, true);

SELECT sequence_schema, sequence_name
FROM information_schema.sequences;

SELECT schemaname, sequencename, last_value
FROM pg_sequences
WHERE sequencename
ORDER BY schemaname, sequencename;

-- ######################################################################

-- uuid
SELECT gen_random_uuid();

-- ######################################################################

-- example table
CREATE TABLE IF NOT EXISTS example (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON TABLE example IS 'This is an example table';
COMMENT ON COLUMN example.id IS 'ID of the example';

CREATE INDEX idx_example_name ON example(name);
CREATE UNIQUE INDEX uidx_example_name ON example(name);

-- ######################################################################

-- find orphaned child records
SELECT c.*
FROM child c
WHERE c.parent_id IS NOT NULL
  AND NOT EXISTS (
        SELECT 1
        FROM parent p
        WHERE p.id = c.parent_id
  );

-- ######################################################################

-- common table expressions (CTE)

-- transport tables
-- bus(id, from_city, to_city, minutes, price)
-- train(id, from_city, to_city, minutes, price)

-- all transport routes
WITH transport AS (
    SELECT 'bus' AS type, id, from_city, to_city, minutes, price
    FROM bus
    UNION ALL
    SELECT 'train' AS type, id, from_city, to_city, minutes, price
    FROM train
)
SELECT *
FROM transport
ORDER BY from_city, to_city, minutes;

-- fast transport routes (<= 90 minutes)
WITH transport AS (
    SELECT 'bus' AS type, id, from_city, to_city, minutes, price
    FROM bus
    UNION ALL
    SELECT 'train' AS type, id, from_city, to_city, minutes, price
    FROM train
),
fast_routes AS (
    SELECT *
    FROM transport
    WHERE minutes <= 90
)
SELECT *
FROM fast_routes
ORDER BY from_city, to_city, minutes;

-- cheapest transport routes
WITH transport AS (
    SELECT 'bus' AS type, id, from_city, to_city, minutes, price
    FROM bus
    UNION ALL
    SELECT 'train' AS type, id, from_city, to_city, minutes, price
    FROM train
),
ranked AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY from_city, to_city
            ORDER BY price ASC, minutes ASC
        ) AS rn
    FROM transport
)
SELECT type, id, from_city, to_city, minutes, price
FROM ranked
WHERE rn = 1
ORDER BY from_city, to_city;

-- recursive CTE
-- find all possible routes starting from 'Seoul'
WITH RECURSIVE routes AS (
  SELECT
    from_city,
    to_city,
    1 AS step,
    ARRAY[from_city, to_city] AS path
  FROM transport
  WHERE from_city = 'Seoul'

  UNION ALL

  SELECT
    r.from_city,
    t.to_city,
    r.step + 1 AS step,
    r.path || t.to_city AS path
  FROM routes r
  JOIN transport t
    ON r.to_city = t.from_city
  WHERE NOT (t.to_city = ANY(r.path))
)
SELECT from_city, to_city, step, path
FROM routes
ORDER BY step, to_city;
