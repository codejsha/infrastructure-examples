######################################################################

### mysql client

mysql -u root -p

######################################################################

### mysql shell

### connect
mysqlsh root:password@localhost:3306/mysql --sql
mysqlsh root:password@test.example.com:3306/mysql --sql
mysqlsh root@localhost:3306/mysql --password=password --sql
mysqlsh root@test.example.com:3306/mysql --password=password --sql
mysqlsh --user=root --password=password --host=test.example.com --port=3306 --database=mysql --sql

\status

mysqlsh root@localhost:3306 --password=${PASSWORD} --sql < sakila-db/sakila-schema.sql
mysqlsh root@localhost:3306 --password=${PASSWORD} --sql < sakila-db/sakila-data.sql

mysqlsh root@localhost:3306 --password=${PASSWORD} --sql --recreate-schema sakila < sakila-db/sakila-schema.sql
mysqlsh root@localhost:3306 --password=${PASSWORD} --sql --recreate-schema sakila < sakila-db/sakila-data.sql

mysqlsh root@localhost:3306 --password=${PASSWORD} --sql
\source sakila-db/sakila-schema.sql
\source sakila-db/sakila-data.sql

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
