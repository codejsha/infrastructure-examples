-- ######################################################################

-- ### create sources

-- stream of user clicks
CREATE STREAM clickstream_events (
    ip VARCHAR,
    userid INT,
    remote_user VARCHAR,
    time VARCHAR,
    _time BIGINT,
    request VARCHAR,
    status VARCHAR,
    bytes VARCHAR,
    referer VARCHAR,
    agent VARCHAR
) with (
    KAFKA_TOPIC = 'clickstream_events',
    KEY_FORMAT = 'JSON_SR',
    VALUE_FORMAT = 'AVRO'
);

-- error code lookup table
CREATE TABLE clickstream_codes (
    code INT PRIMARY KEY,
    definition VARCHAR
) WITH (
    KAFKA_TOPIC = 'clickstream_codes',
    KEY_FORMAT = 'JSON_SR',
    VALUE_FORMAT = 'AVRO'
);

-- users lookup table
CREATE TABLE clickstream_users (
    user_id INT PRIMARY KEY,
    username VARCHAR,
    registered_at BIGINT,
    first_name VARCHAR,
    last_name VARCHAR,
    city VARCHAR,
    level VARCHAR
) WITH (
    KAFKA_TOPIC = 'clickstream_users',
    KEY_FORMAT = 'JSON_SR',
    VALUE_FORMAT = 'AVRO'
);

-- ######################################################################

-- ### build materialized stream views

-- enrich click-stream with more user information
CREATE STREAM user_click_event WITH (
        KEY_FORMAT='KAFKA',
        VALUE_FORMAT='AVRO',
        KAFKA_TOPIC='user_click_event'
    ) AS
    SELECT
        userid,
        u.username,
        ip,
        u.city,
        request,
        status,
        bytes
    FROM clickstream_events e
        LEFT JOIN clickstream_users u ON e.userid = u.user_id;

-- enrich click-stream with more information about error codes:
CREATE STREAM enriched_error_codes WITH (
        KEY_FORMAT='KAFKA',
        VALUE_FORMAT='AVRO',
        KAFKA_TOPIC='enriched_error_codes'
    ) AS
    SELECT
        code,
        definition
    FROM clickstream_events
        LEFT JOIN clickstream_codes ON clickstream_events.status = clickstream_codes.code;

-- ######################################################################

--- ### build materialized table views (per-user id tables)

-- table of events per minute for each user
CREATE TABLE user_click_event_per_min WITH (
        KEY_FORMAT='KAFKA',
        VALUE_FORMAT='AVRO',
        KAFKA_TOPIC='user_click_event_per_min'
    ) AS
    SELECT
        userid AS k1,
        AS_VALUE(userid) AS userid,
        WINDOWSTART AS EVENT_TS,
        COUNT(*) AS events
    FROM clickstream_events WINDOW TUMBLING (SIZE 60 SECOND)
    GROUP BY userid;

-- table of html pages per minute for each user
CREATE TABLE page_click_event_per_min WITH (
        KEY_FORMAT='KAFKA',
        VALUE_FORMAT='AVRO',
        KAFKA_TOPIC='page_click_event_per_min'
    ) AS
    SELECT
        userid AS k1,
        AS_VALUE(userid) AS userid,
        WINDOWSTART AS EVENT_TS,
        COUNT(*) AS pages
    FROM clickstream_events WINDOW HOPPING (SIZE 60 SECOND, ADVANCE BY 5 SECOND)
    WHERE request LIKE '%html%'
    GROUP BY userid;

-- ######################################################################

--- ### build materialized table views (per-username tables)

-- user sessions table - 30 seconds of inactivity expires the session.
-- table counts number of events within the session.
CREATE TABLE user_click_event_per_session WITH (
        KEY_FORMAT='KAFKA',
        VALUE_FORMAT='AVRO',
        KAFKA_TOPIC='user_click_event_per_session'
    ) AS
    SELECT
        username AS K,
        AS_VALUE(username) AS username,
        WINDOWEND AS EVENT_TS,
        COUNT(*) AS events
    FROM user_click_event WINDOW SESSION (30 SECOND)
    GROUP BY username;

-- ######################################################################

--- ### build materialized table views (per-status tables)

-- number of errors per min, using 'HAVING' filter to show error codes > 400 where count > 5
CREATE TABLE errors_per_min_alert WITH (
        KEY_FORMAT='KAFKA',
        VALUE_FORMAT='AVRO',
        KAFKA_TOPIC='errors_per_min_alert'
    ) AS
    SELECT
        status AS k1,
        AS_VALUE(status) AS status,
        WINDOWSTART AS EVENT_TS,
        COUNT(*) AS errors
    FROM clickstream_events WINDOW HOPPING (SIZE 60 SECOND, ADVANCE BY 20 SECOND)
    WHERE CAST(status AS INT) > 400
    GROUP BY status
    HAVING COUNT(*) > 5 AND COUNT(*) IS NOT NULL;

-- number of errors per min
CREATE TABLE errors_per_min WITH (
        KEY_FORMAT='KAFKA',
        VALUE_FORMAT='AVRO',
        KAFKA_TOPIC='errors_per_min'
    ) AS
    SELECT
        status AS k1,
        AS_VALUE(status) AS status,
        WINDOWSTART AS EVENT_TS,
        COUNT(*) AS errors
    FROM clickstream_events WINDOW HOPPING (SIZE 60 SECOND, ADVANCE BY 5 SECOND)
    WHERE CAST(status AS INT) > 400
    GROUP BY status;

-- ######################################################################

--- ### build materialized table views (per-error code tables)

-- enriched error codes table.
-- aggregate (count & group by) using a table-window.
CREATE TABLE enriched_error_codes_count WITH (
        KEY_FORMAT='KAFKA',
        VALUE_FORMAT='AVRO',
        KAFKA_TOPIC='enriched_error_codes_count'
    ) AS
    SELECT
        code AS k1,
        definition AS K2,
        AS_VALUE(code) AS code,
        WINDOWSTART AS EVENT_TS,
        AS_VALUE(definition) AS definition,
        COUNT(*) AS count
    FROM enriched_error_codes WINDOW TUMBLING (size 30 second)
    GROUP BY code, definition
    HAVING COUNT(*) > 1;

-- enriched user details table.
-- aggregate (count & group by) using a table-window.
CREATE TABLE user_ip_activity WITH (
        KEY_FORMAT='KAFKA',
        VALUE_FORMAT='AVRO',
        KAFKA_TOPIC='user_ip_activity'
    ) AS
    SELECT
        username AS k1,
        ip AS k2,
        city AS k3,
        AS_VALUE(username) AS username,
        WINDOWSTART AS EVENT_TS,
        AS_VALUE(ip) AS ip,
        AS_VALUE(city) AS city,
        COUNT(*) AS count
    FROM user_click_event WINDOW TUMBLING (size 60 second)
    GROUP BY username, ip, city
    HAVING COUNT(*) > 1;

-- ######################################################################

CREATE STREAM pageviews (
    userid VARCHAR,
    pageid VARCHAR,
    viewtime BIGINT
) WITH (
    KAFKA_TOPIC = 'pageviews',
    KEY_FORMAT = 'JSON_SR',
    VALUE_FORMAT = 'AVRO'
);
