#!/usr/bin/bash

source ./env-base.sh
source ./env-inst.sh

### management user
${WILDFLY_HOME}/bin/add-user.sh -u "admin" -p "changeit" -sc ${INSTANCE_HOME}/configuration
# ${WILDFLY_HOME}/bin/add-user.sh -u "admin" -p "changeit"

### application usser
# ${WILDFLY_HOME}/bin/add-user.sh -u "developer" -p "changeit"
# ${WILDFLY_HOME}/bin/add-user.sh -u "developer" -p "changeit" -sc ${INSTANCE_HOME}/configuration
