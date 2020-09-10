### connect
PGPASSWORD="${POSTGRES_PASSWORD}" psql -U postgres

######################################################################

### database list

PGPASSWORD="${POSTGRES_PASSWORD}" psql -U postgres --list
\l
### postgres=# \l
###                                        List of databases
###         Name         |  Owner   | Encoding |   Collate   |    Ctype    |   Access privileges
### ---------------------+----------+----------+-------------+-------------+-----------------------
###  gitlabhq_production | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
###  postgres            | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
###  template0           | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres          +
###                      |          |          |             |             | postgres=CTc/postgres
###  template1           | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres          +
###                      |          |          |             |             | postgres=CTc/postgres
### (4 rows)

######################################################################

### switch database

\c DATABASE_NAME
### postgres=# \c postgres
### You are now connected to database "postgres" as user "postgres".

######################################################################

### table list

PGPASSWORD="${POSTGRES_PASSWORD}" psql -U postgres -d "postgres" -c "\dt"
\dt

######################################################################

### role

\du
### postgres=# \du
###                                    List of roles
###  Role name |                         Attributes                         | Member of
### -----------+------------------------------------------------------------+-----------
###  postgres  | Superuser, Create role, Create DB, Replication, Bypass RLS | {}
