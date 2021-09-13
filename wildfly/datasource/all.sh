#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

######################################################################
### JDBC MODULE
######################################################################

bash ./add-jdbc-module.sh --port-offset=0
# bash ./add-jdbc-module.sh --port-offset=1




######################################################################
### JDBC DRIVER
######################################################################

### JDBC DRIVER

bash ./add-jdbc-driver.sh --port-offset=0
bash ./add-jdbc-driver.sh --port-offset=1




######################################################################
### DATASOURCE
######################################################################

bash ./add-datasource.sh --port-offset=0
bash ./add-datasource.sh --port-offset=1

######################################################################

# bash ./set-datasource.sh --port-offset=0
# bash ./set-datasource.sh --port-offset=1

######################################################################

bash ./set-cached-connection-manager.sh --port-offset=0
bash ./set-cached-connection-manager.sh --port-offset=1

######################################################################

bash ./enable-datasource-statistics.sh --port-offset=0 --name=baseds1
bash ./enable-datasource-statistics.sh --port-offset=1 --name=baseds1




######################################################################
### TEST DATASOURCE
######################################################################

# bash ./test-datasource-connection.sh --port-offset=0 --name=baseds1
# bash ./test-datasource-connection.sh --port-offset=1 --name=baseds1




######################################################################
### GET ALL
######################################################################

# bash ./get-datasource.sh --port-offset=0
# bash ./get-datasource.sh --port-offset=1

# bash ./get-datasource-driver.sh --port-offset=0 --driver-name=oracle
# bash ./get-datasource-driver.sh --port-offset=1 --driver-name=oracle

# bash ./get-datasource-statistics.sh --port-offset=0 --name=baseds1
# bash ./get-datasource-statistics.sh --port-offset=1 --name=baseds1




######################################################################
### DELETE ALL
######################################################################

### DELETE DATASOURCE

# bash ./delete-datasource.sh --port-offset=0 --name=baseds1
# bash ./delete-datasource.sh --port-offset=1 --name=baseds1

######################################################################

### DELETE JDBC DRIVER (WITH MODULE)

# bash ./delete-jdbc-driver.sh --port-offset=0 --driver-name=oracle
# bash ./delete-jdbc-driver.sh --port-offset=1 --driver-name=oracle

# bash ./delete-module.sh --port-offset=0 --module-name=com.oracle
# bash ./delete-module.sh --port-offset=1 --module-name=com.oracle

######################################################################

### DELETE JDBC DRIVER (WITH DEPLOYMENT)

# bash ./delete-jdbc-driver.sh --port-offset=0 --driver-name=oracle
# bash ./delete-jdbc-driver.sh --port-offset=1 --driver-name=oracle

# bash ./undeploy-jdbc-driver.sh --port-offset=0 --driver-name=oracle
# bash ./undeploy-jdbc-driver.sh --port-offset=1 --driver-name=oracle
