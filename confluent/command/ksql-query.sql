-- ######################################################################

-- connect ksqldb
ksql http://localhost:8088

-- auto
SET 'auto.offet.reset' = 'earliest';
SET 'auto.offet.reset' = 'latest';

-- show
show properties;
show topics;
show streams;
show queries;
