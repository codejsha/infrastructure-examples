-- ######################################################################

-- show
show properties;
show topics;
show streams;
show queries;

-- offset reset
SET 'auto.offset.reset' = 'earliest';
SET 'auto.offset.reset' = 'latest';

-- ######################################################################

-- describe stream/table

DESCRIBE clickstream_events;
DESCRIBE clickstream_events EXTENDED;

DESCRIBE STREAMS;
DESCRIBE TABLES;

-- ######################################################################

--- explain

SHOW QUERIES;
EXPLAIN <query_id>;

-- ######################################################################

-- functions

-- FORMAT_TIMESTAMP
FORMAT_TIMESTAMP(FROM_UNIXTIME(WINDOWSTART), 'yyyy-MM-dd HH:mm:ss.SSS', 'UTC')
FORMAT_TIMESTAMP(FROM_UNIXTIME(WINDOWEND), 'yyyy-MM-dd HH:mm:ss.SSS', 'UTC')
FORMAT_TIMESTAMP(FROM_UNIXTIME(ROWTIME), 'yyyy-MM-dd HH:mm:ss.SSS', 'UTC')

-- CAST
CAST(COL0 AS BIGINT)
