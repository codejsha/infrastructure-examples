#!/bin/bash

JEUS_HOME="/usr/local/jeus"
DATASOURCE_NAME="dataSource1"

${JEUS_HOME}/bin/jeusadmin -host localhost -port 9736 -u administrator -p jeusadmin \
    "test-data-source-config -id ${DATASOURCE_NAME}"
