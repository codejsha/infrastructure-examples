-- ######################################################################
-- mysql-source-inventory
-- ######################################################################

CREATE STREAM customers_raw_stream (
    schema STRUCT<
        type VARCHAR,
        fields ARRAY<STRUCT<type VARCHAR, fields ARRAY<STRUCT<type VARCHAR, optional BOOLEAN, field VARCHAR>>, optional BOOLEAN, name VARCHAR, field VARCHAR>>,
        optional BOOLEAN,
        name VARCHAR,
        version INT
    >,
    payload STRUCT<
        before STRUCT<id INT, first_name VARCHAR, last_name VARCHAR, email VARCHAR>,
        after STRUCT<id INT, first_name VARCHAR, last_name VARCHAR, email VARCHAR>,
        source STRUCT<`version` VARCHAR, `connector` VARCHAR, `name` VARCHAR, `ts_ms` BIGINT, `snapshot` VARCHAR, `db` VARCHAR, `sequence` VARCHAR, `ts_us` BIGINT, `ts_ns` BIGINT, `table` VARCHAR, `server_id` BIGINT, `gtid` VARCHAR, `file` VARCHAR, `pos` BIGINT, `row` INT, `thread` BIGINT, `query` VARCHAR>,
        transaction STRUCT<`id` VARCHAR, `total_order` BIGINT, `data_collection_order` BIGINT>,
        op VARCHAR,
        ts_ms BIGINT,
        ts_us BIGINT,
        ts_ns BIGINT
    >
) WITH (
    KAFKA_TOPIC='dbserver1.inventory.customers',
    KEY_FORMAT='JSON',
    VALUE_FORMAT='JSON'
);

CREATE STREAM customers_stream_extracted WITH (KAFKA_TOPIC='customers_stream_extracted') AS
    SELECT
        payload->after->id AS id,
        payload->after->first_name AS first_name,
        payload->after->last_name AS last_name,
        payload->after->email AS email,
        payload->op AS op,
        payload->ts_ms AS ts_ms
    FROM customers_raw_stream;

-- ######################################################################

-- ### select

SELECT * FROM customers_stream_extracted EMIT CHANGES;
SELECT * FROM customers_stream_extracted EMIT CHANGES LIMIT 4;

SELECT *, FORMAT_TIMESTAMP(FROM_UNIXTIME(ROWTIME), 'yyyy-MM-dd HH:mm:ss.SSS', 'UTC') AS TS_FORMATTED FROM customers_stream_extracted EMIT CHANGES;
SELECT *, FORMAT_TIMESTAMP(FROM_UNIXTIME(ROWTIME), 'yyyy-MM-dd HH:mm:ss.SSS', 'UTC') AS TS_FORMATTED FROM customers_stream_extracted WHERE ROWTIME >= 1729180000000 AND ROWTIME <= 1729189066000 EMIT CHANGES;

SELECT * FROM customers_stream_extracted WHERE email = 'gbailey@foobar.com' EMIT CHANGES;
SELECT * FROM customers_stream_extracted WHERE email LIKE '%@acme.com' EMIT CHANGES;
