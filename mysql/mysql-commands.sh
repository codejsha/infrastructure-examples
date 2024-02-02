######################################################################

### mysql dump

mysqldump --host=localhost --port=3306 --user=root --password sakila > database_dump.sql
mysqldump --host=localhost --port=3306 --user=root --password --no-data sakila > database_dump.sql
mysqldump --host=localhost --port=3306 --user=root --password --routines --triggers --no-data sakila > database_dump.sql

docker exec mysqldb mysqldump --host=localhost --port=3306 --user=root --password sakila > database_dump.sql
docker exec mysqldb mysqldump --host=localhost --port=3306 --user=root --password --no-data sakila > database_dump.sql
docker exec mysqldb mysqldump --host=localhost --port=3306 --user=root --password --routines --triggers --no-data sakila > database_dump.sql

######################################################################

### mysql dump with config file

cat << EOF | tee ~/.my.cnf
[mysqldump]
user=root
password=test
EOF

mysqldump --host=localhost --port=3306 sakila > database_dump.sql
mysqldump --host=localhost --port=3306 --no-data sakila > database_dump.sql
mysqldump --host=localhost --port=3306 --routines --triggers --no-data sakila > database_dump.sql

docker exec mysqldb mysqldump --host=localhost --port=3306 sakila > database_dump.sql
docker exec mysqldb mysqldump --host=localhost --port=3306 --no-data sakila > database_dump.sql
docker exec mysqldb mysqldump --host=localhost --port=3306 --routines --triggers --no-data sakila > database_dump.sql

######################################################################

### security
/usr/bin/mysql_secure_installation

### Enter current password for root (enter for none): [ENTER]
### New password: [PASSWORD]
### Re-enter new password: [PASSWORD]
### Set root password? [Y/n] Y
### Remove anonymous users? [Y/n] Y
### Disallow root login remotely? [Y/n] Y
### Remove test database and access to it? [Y/n] Y
### Reload privilege tables now? [Y/n] Y
