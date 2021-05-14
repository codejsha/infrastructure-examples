#!/bin/bash

CONFLUENT_HOME=""
SERVER_NAME=""

# PROPERTIES_FILE="${CONFLUENT_HOME}/etc/kafka-rest/kafka-rest.properties"
PROPERTIES_FILE=""

LOG_DIR=""
export LOG_DIR

# JAVA_HOME="/usr/lib/jvm/java-11"
# JAVA_HOME="/usr/lib/jvm/java-1.8.0"
JAVA_HOME=""
export JAVA_HOME

######################################################################

### memory options
KAFKAREST_HEAP_OPTS="${KAFKAREST_HEAP_OPTS} -Xms512M -Xmx512M"
export KAFKAREST_HEAP_OPTS

### performance
KAFKAREST_JVM_PERFORMANCE_OPTS="${KAFKAREST_JVM_PERFORMANCE_OPTS} -server"
KAFKAREST_JVM_PERFORMANCE_OPTS="${KAFKAREST_JVM_PERFORMANCE_OPTS} -XX:+UseG1GC"
KAFKAREST_JVM_PERFORMANCE_OPTS="${KAFKAREST_JVM_PERFORMANCE_OPTS} -XX:MaxGCPauseMillis=20"
KAFKAREST_JVM_PERFORMANCE_OPTS="${KAFKAREST_JVM_PERFORMANCE_OPTS} -XX:InitiatingHeapOccupancyPercent=35"
KAFKAREST_JVM_PERFORMANCE_OPTS="${KAFKAREST_JVM_PERFORMANCE_OPTS} -XX:+ExplicitGCInvokesConcurrent"
KAFKAREST_JVM_PERFORMANCE_OPTS="${KAFKAREST_JVM_PERFORMANCE_OPTS} -XX:MaxInlineLevel=15"
KAFKAREST_JVM_PERFORMANCE_OPTS="${KAFKAREST_JVM_PERFORMANCE_OPTS} -Djava.awt.headless=true"
export KAFKAREST_JVM_PERFORMANCE_OPTS

### generic jvm settings
KAFKAREST_OPTS="${KAFKAREST_OPTS} -D${SERVER_NAME}"
# PROMETHEUS_JAVA_AGENT_FILE="${CONFLUENT_HOME}/prometheus/jmx_prometheus_javaagent-0.15.0.jar"
# PROMETHEUS_EXPORTER_FILE="${CONFLUENT_HOME}/prometheus/confluent_rest.yml"
# PROMETHEUS_PORT="1234"
# KAFKAREST_OPTS="${KAFKAREST_OPTS} -javaagent:${PROMETHEUS_JAVA_AGENT_FILE}=${PROMETHEUS_PORT}:${PROMETHEUS_EXPORTER_FILE}"
export KAFKAREST_OPTS

### gc option
export GC_LOG_ENABLED="true"

### jmx
# export JMX_PORT=""
KAFKAREST_JMX_OPTS="${KAFKAREST_JMX_OPTS} -Dcom.sun.management.jmxremote"
KAFKAREST_JMX_OPTS="${KAFKAREST_JMX_OPTS} -Dcom.sun.management.jmxremote.authenticate=false"
KAFKAREST_JMX_OPTS="${KAFKAREST_JMX_OPTS} -Dcom.sun.management.jmxremote.ssl=false "
export KAFKAREST_JMX_OPTS

### log4j
# KAFKAREST_LOG4J_OPTS="${KAFKAREST_LOG4J_OPTS}"
# export KAFKAREST_LOG4J_OPTS

######################################################################

######################################################################

### check current user
CURRENT_USER="$(id -un)"
if [ "${CURRENT_USER}" == "root" ]; then
    echo "[ERROR] The current user is root!"
    exit
fi

### check running process
PID="$(pgrep -xa java | grep ${PROPERTIES_FILE} | grep ${SERVER_NAME} | awk '{print $1}')"
if [ -n "${PID}" ]; then
    echo "[ERROR] The ${SERVER_NAME} (pid ${PID}) is already running!"
    exit
fi

### create log dir
if [ ! -d "${LOG_DIR}/backup" ]; then
    mkdir -p ${LOG_DIR}/backup
fi

### backup stdout log
DATETIME="$(date +'%Y%m%d_%H%M%S')"
if [ -f "${LOG_DIR}/nohup.${SERVER_NAME}.out" ]; then
    mv ${LOG_DIR}/nohup.${SERVER_NAME}.out ${LOG_DIR}/backup/nohup.${SERVER_NAME}.${DATETIME}.out
fi

touch ${LOG_DIR}/nohup.${SERVER_NAME}.out
nohup ${CONFLUENT_HOME}/bin/kafka-rest-start ${PROPERTIES_FILE} > ${LOG_DIR}/nohup.${SERVER_NAME}.out 2>&1 &
tail -f ${LOG_DIR}/nohup.${SERVER_NAME}.out
