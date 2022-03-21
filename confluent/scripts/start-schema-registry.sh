#!/bin/bash
# Maintained by Ansible

CONFLUENT_HOME="/opt/confluent/confluent-7.0.1"
PROPERTIES_FILE="/opt/confluent/etc/schema-registry/schema-registry.properties"

LOG_DIR="/logs/schema-registry"
export LOG_DIR

######################################################################

### memory options
SCHEMA_REGISTRY_HEAP_OPTS="-Xms512m -Xmx512m"
export SCHEMA_REGISTRY_HEAP_OPTS
### generic jvm settings
SCHEMA_REGISTRY_OPTS="-Djdk.tls.ephemeralDHKeySize=2048 -javaagent:/opt/confluent/prometheus/jmx_prometheus_javaagent.jar=1236:/opt/confluent/prometheus/schema_registry.yml"
export SCHEMA_REGISTRY_OPTS
### performance options
SCHEMA_REGISTRY_JVM_PERFORMANCE_OPTS="-server -XX:+UseG1GC -XX:MaxGCPauseMillis=20 -XX:InitiatingHeapOccupancyPercent=35 -XX:+ExplicitGCInvokesConcurrent -XX:MaxInlineLevel=15 -Djava.awt.headless=true"
export SCHEMA_REGISTRY_JVM_PERFORMANCE_OPTS
### gc options
SCHEMA_REGISTRY_GC_LOG_OPTS="-Xlog:gc*:file=/logs/schema-registry/schema-registry-gc.log:time,tags:filecount=10,filesize=100M"
export SCHEMA_REGISTRY_GC_LOG_OPTS
### jmx settings
SCHEMA_REGISTRY_JMX_OPTS="-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false"
export SCHEMA_REGISTRY_JMX_OPTS
### log4j settings
SCHEMA_REGISTRY_LOG4J_OPTS="-Dlog4j.configuration=file:/opt/confluent/log4j/schema-registry-log4j.properties"
export SCHEMA_REGISTRY_LOG4J_OPTS


######################################################################

######################################################################

### check current user
CURRENT_USER="$(id -un)"
if [ "${CURRENT_USER}" == "root" ]; then
    echo "[ERROR] The current user is root!"
    exit
fi

### check running process
PID="$(pgrep -xa java | grep ${PROPERTIES_FILE} | awk '{print $1}')"
if [ -n "${PID}" ]; then
    echo "[ERROR] The process (pid ${PID}) is already running!"
    exit
fi

### check log directory
if [ ! -d "${LOG_DIR}" ]; then
    echo "[ERROR] The log dir (${LOG_DIR}) does not exist!"
    exit
fi

### start
touch ${LOG_DIR}/schema-registry.log
nohup ${CONFLUENT_HOME}/bin/schema-registry-start ${PROPERTIES_FILE} > /dev/null 2>&1 &

### tail stdout log
if [ "${1}" == "tail" ]; then
    tail -f ${LOG_DIR}/schema-registry.log
fi
