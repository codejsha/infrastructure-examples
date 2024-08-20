-- ######################################################################

-- database

-- create
CREATE DATABASE database_name;
CREATE DATABASE database_name DEFAULT CHARACTER SET utf8;

-- set active schema
USE mysql;

-- ######################################################################

-- show query
SHOW DATABASES;
SHOW STATUS;
SHOW TABLES;

\show query show databases;
\show query show tables;

-- ######################################################################

-- user

SELECT user, host FROM user;
-- +------------------+-----------+
-- | user             | host      |
-- +------------------+-----------+
-- | root             | %         |
-- | mysql.infoschema | localhost |
-- | mysql.session    | localhost |
-- | mysql.sys        | localhost |
-- | root             | localhost |
-- +------------------+-----------+

-- local access
CREATE USER 'prouser'@'localhost' IDENTIFIED BY 'password';
CREATE USER 'debezium'@'localhost' IDENTIFIED BY 'dbz';

-- remote access
CREATE USER 'prouser'@'%' IDENTIFIED BY 'password';
CREATE USER 'debezium'@'%' IDENTIFIED BY 'dbz';
CREATE USER 'sakila'@'%' IDENTIFIED BY 'sakila';

-- ######################################################################

-- privilege
GRANT ALL PRIVILEGES ON *.* TO 'prouser'@'%';
GRANT ALL PRIVILEGES ON db_name.* TO 'prouser'@'%';
GRANT ALL PRIVILEGES ON sakila.* TO 'debezium'@'%';
GRANT ALL PRIVILEGES ON sakila.* TO 'sakila'@'%';
FLUSH PRIVILEGES;

-- ######################################################################

-- password
ALTER USER 'debezium'@'%' IDENTIFIED WITH mysql_native_password BY 'dbz';
ALTER USER 'root'@'localhost' IDENTIFIED BY 'new_password';
ALTER USER 'root'@'%' IDENTIFIED BY 'new_password';

-- ######################################################################

-- execute file
SOURCE sakila-db/sakila-schema.sql
SOURCE sakila-db/sakila-data.sql

-- ######################################################################

-- enable query logging
SET GLOBAL general_log = 'ON';
SET GLOBAL log_output = 'FILE';
SET GLOBAL general_log_file = '/var/log/mysql/mysql.log';
tail -f /var/log/mysql/mysql.log

SET GLOBAL general_log = 'ON';
SET GLOBAL log_output = 'TABLE';
SELECT * FROM mysql.general_log;

-- ######################################################################

-- examples
DESC sakila.address;
SELECT ST_AsText(address.location) FROM sakila.address WHERE address_id = 1;
SELECT ST_AsGeoJson(address.location) FROM sakila.address WHERE address_id = 1;
SELECT ST_AsWKT(address.location) FROM sakila.address WHERE address_id = 1;
SELECT ST_AsWKB(address.location) FROM sakila.address WHERE address_id = 1;
SELECT ST_AsBinary(address.location) FROM sakila.address WHERE address_id = 1;
SELECT ST_GeomFromWKB(address.location) FROM sakila.address WHERE address_id = 1;
SELECT ST_GeomFromWKB(ST_AsWKB(address.location)) FROM sakila.address WHERE address_id = 1;
SELECT ST_SRID(address.location, 4326) FROM sakila.address WHERE address_id = 1;

-- time zone
SELECT @@global.time_zone, @@session.time_zone;
SELECT TIMEDIFF(NOW(), CONVERT_TZ(NOW(), @@session.time_zone, '+00:00'));
SELECT NOW()

-- collation
SELECT SCHEMA_NAME, DEFAULT_CHARACTER_SET_NAME, DEFAULT_COLLATION_NAME FROM information_schema.SCHEMATA;
SHOW TABLE STATUS FROM sakila;
ALTER TABLE company CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- ######################################################################

-- enable function
SET GLOBAL log_bin_trust_function_creators = 1;

-- ######################################################################

SHOW VARIABLES LIKE 'character%';
SHOW VARIABLES LIKE 'collation%';
