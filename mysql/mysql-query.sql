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
UPDATE user SET password=password('new_password') WHERE user='root';

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

SELECT schema_name, default_character_set_name, DEFAULT_COLLATION_NAME FROM information_schema.SCHEMATA;
