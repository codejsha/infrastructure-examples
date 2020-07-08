#!/usr/bin/bash

MW_HOME="/usr/local/ohs"
ORACLE_HOME="${MW_HOME}/oracle_wt1"
INSTANCE_NAME="instance1"

${ORACLE_HOME}/opmn/bin/opmnctl createinstance \
    -oracleInstance ${MW_HOME}/oracle_wt1/instances/${INSTANCE_NAME} \
    -adminRegistration OFF
