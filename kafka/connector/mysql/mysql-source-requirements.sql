-- mysql source connector requirements

-- create user
CREATE USER 'debezium'@'localhost' IDENTIFIED BY 'dbz';
GRANT SELECT, RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'debezium'@'%';
-- GRANT ALL PRIVILEGES ON sakila.* TO 'debezium'@'%';
FLUSH PRIVILEGES;


-- enable binary log
-- (mysql 8 is enabled by default)


-- gtid mode
SET @@GLOBAL.ENFORCE_GTID_CONSISTENCY = ON;
SET @@GLOBAL.GTID_MODE = ON;
SHOW GLOBAL variables LIKE '%gtid%';


-- configure session timeouts
--
-- interactive_timeout
-- wait_timeout


-- enable query log events
--
-- binlog_rows_query_log_events
