-- ######################################################################

-- connect ksqldb
ksql
ksql http://localhost:8088

-- show
show properties;
show topics;
show streams;
show queries;

-- auto
SET 'ksql.streams.auto.offset.reset' = 'earliest';
SET 'ksql.streams.auto.offset.reset' = 'latest';
