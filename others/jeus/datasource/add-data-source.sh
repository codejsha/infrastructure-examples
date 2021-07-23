#!/bin/bash

JEUS_HOME="/usr/local/jeus"

### postgresql
${JEUS_HOME}/bin/jeusadmin -host localhost -port 9736 -u administrator -p jeusadmin \
    "add-data-source -id dataSource1 -en ds1 -vendor others -dscn org.postgresql.xa.PGXADataSource -dst XADataSource -sn testmachine -pn 5432 -dn postgres -user postgres -pw postgres"

### oracle database
# ${JEUS_HOME}/bin/jeusadmin -host localhost -port 9736 -u administrator -p jeusadmin \
#     "add-data-source -id dataSource1 -en ds1 -vendor oracle -dscn oracle.jdbc.pool.OracleConnectionPoolDataSource -dst ConnectionPoolDataSource -sn testmachine -pn 1521 -dn orclcdb -user orcl -pw password -prop driverType;java.lang.String;thin"
