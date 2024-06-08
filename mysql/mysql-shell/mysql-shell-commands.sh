######################################################################

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
