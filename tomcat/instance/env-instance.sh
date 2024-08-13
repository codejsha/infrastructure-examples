#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

INSTALL_SCRIPT_DIR="${HOME}/repos/infrastructure-examples/tomcat/instance"

INSTANCE_NAME="inst1"

APP_BASE="webapps"
# DOC_BASE=""

# TOMCAT_ADDRESS="127.0.0.1"
TOMCAT_ADDRESS="test.example.com"
TOMCAT_HTTP_PORT="8080"
TOMCAT_HTTPS_PORT="8443"
TOMCAT_SHUTDOWN_PORT="8005"
TOMCAT_AJP_PORT="8009"
TOMCAT_JMX_PORT="8050"

### cluster static
TOMCAT_CLUSTER_ADDRESS1="test1.examaple.com"
TOMCAT_CLUSTER_PORT1="4000"
TOMCAT_CLUSTER_ADDRESS2="test2.examaple.com"
TOMCAT_CLUSTER_PORT2="4000"
TOMCAT_RECEIVER_PORT="4000"

######################################################################

source ${INSTALL_SCRIPT_DIR}/env-function.sh

CATALINA_BASE="${CATALINA_HOME}/instances/${INSTANCE_NAME}"
JVM_ROUTE="${INSTANCE_NAME}"
LOG_DIR="${CATALINA_BASE}/logs"
DUMP_LOG_DIR="${LOG_DIR}/dump"

######################################################################

export INSTANCE_NAME CATALINA_BASE JVM_ROUTE APP_BASE DOC_BASE
export TOMCAT_ADDRESS TOMCAT_HTTP_PORT TOMCAT_HTTPS_PORT TOMCAT_SHUTDOWN_PORT
export TOMCAT_AJP_PORT TOMCAT_JMX_PORT
export LOG_DIR DUMP_LOG_DIR
export TOMCAT_CLUSTER_ADDRESS1 TOMCAT_CLUSTER_PORT1
export TOMCAT_CLUSTER_ADDRESS2 TOMCAT_CLUSTER_PORT2
export TOMCAT_RECEIVER_PORT
