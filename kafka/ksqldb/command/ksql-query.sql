-- ######################################################################

-- offset reset
SET 'auto.offset.reset' = 'earliest';
SET 'auto.offset.reset' = 'latest';

-- ######################################################################

-- show
SHOW PROPERTIES;
SHOW TOPICS;
SHOW STREAMS;
SHOW TABLES;
SHOW QUERIES;

-- describe
DESCRIBE STREAMS;
DESCRIBE TABLES;

DESCRIBE clickstream_events;
DESCRIBE clickstream_events EXTENDED;

--- explain
SHOW QUERIES;
EXPLAIN <query_id>;

-- ######################################################################

-- functions

-- FORMAT_TIMESTAMP
FORMAT_TIMESTAMP(FROM_UNIXTIME(WINDOWSTART), 'yyyy-MM-dd HH:mm:ss.SSS', 'UTC')
FORMAT_TIMESTAMP(FROM_UNIXTIME(WINDOWEND), 'yyyy-MM-dd HH:mm:ss.SSS', 'UTC')
FORMAT_TIMESTAMP(FROM_UNIXTIME(ROWTIME), 'yyyy-MM-dd HH:mm:ss.SSS', 'UTC')

-- PARSE_TIMESTAMP
PARSE_TIMESTAMP(col1, 'yyyy-MM-dd HH:mm:ss', 'Asia/Japan')

-- CAST
CAST(COL0 AS BIGINT)

-- ######################################################################

-- debezium
CREATE TYPE dbz_schema_field_struct AS STRUCT<`type` VARCHAR, `optional` BOOLEAN, `field` VARCHAR>;
CREATE TYPE dbz_schema_source_struct AS STRUCT<`type` VARCHAR, `fields` ARRAY<DBZ_SCHEMA_FIELD_STRUCT>, `optional` BOOLEAN, `name` VARCHAR, `field` VARCHAR>;
CREATE TYPE dbz_schema_value_struct AS STRUCT<`type` VARCHAR, `fields` ARRAY<DBZ_SCHEMA_FIELD_STRUCT>, `optional` BOOLEAN, `name` VARCHAR, `field` VARCHAR>;
CREATE TYPE dbz_source_struct AS STRUCT<`version` VARCHAR, `connector` VARCHAR, `name` VARCHAR, `ts_ms` BIGINT, `snapshot` VARCHAR, `db` VARCHAR, `sequence` VARCHAR, `ts_us` BIGINT, `ts_ns` BIGINT, `table` VARCHAR, `server_id` BIGINT, `gtid` VARCHAR, `file` VARCHAR, `pos` BIGINT, `row` INT, `thread` BIGINT, `query` VARCHAR>;
CREATE TYPE dbz_transaction_struct AS STRUCT<`id` VARCHAR, `total_order` BIGINT, `data_collection_order` BIGINT>;

CREATE STREAM ksql_customers_raw_stream (
    before CUSTOMERS_STRUCT,
    after CUSTOMERS_STRUCT,
    source DBZ_SOURCE_STRUCT,
    transaction DBZ_TRANSACTION_STRUCT,
    op VARCHAR,
    ts_ms BIGINT,
    ts_us BIGINT,
    ts_ns BIGINT
) WITH (
    KAFKA_TOPIC='dbserver1.inventory.customers',
    KEY_FORMAT='JSON',
    VALUE_FORMAT='JSON',
    TIMESTAMP='ts_ms'
);

CREATE STREAM ksql_customers_raw_stream (
    schema STRUCT<
        type VARCHAR,
        fields ARRAY<DBZ_SCHEMA_VALUE_STRUCT, DBZ_SCHEMA_VALUE_STRUCT, DBZ_SCHEMA_SOURCE_STRUCT, DBZ_SCHEMA_FIELD_STRUCT, DBZ_SCHEMA_FIELD_STRUCT, DBZ_SCHEMA_FIELD_STRUCT, DBZ_SCHEMA_FIELD_STRUCT>,
        optional BOOLEAN,
        name VARCHAR,
        version INT
    >,
    payload STRUCT<
        before CUSTOMERS_STRUCT,
        after CUSTOMERS_STRUCT,
        source DBZ_SOURCE_STRUCT,
        transaction DBZ_TRANSACTION_STRUCT,
        op VARCHAR,
        ts_ms BIGINT,
        ts_us BIGINT,
        ts_ns BIGINT
    >
) WITH (
    KAFKA_TOPIC='dbserver1.inventory.customers',
    KEY_FORMAT='JSON',
    VALUE_FORMAT='JSON',
    TIMESTAMP='ts_ms'
);

-- ######################################################################

SELECT * FROM ksql_customers_raw_stream WHERE after->created >= FROM_UNIXTIME(1729389337000);
