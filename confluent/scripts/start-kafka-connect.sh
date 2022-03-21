#!/bin/bash
# Maintained by Ansible

CONFLUENT_HOME="/opt/confluent/confluent-7.0.1"
PROPERTIES_FILE="/opt/confluent/etc/kafka/connect-distributed.properties"

LOG_DIR="/logs/kafka-connect"
export LOG_DIR

######################################################################

### memory options
KAFKA_HEAP_OPTS="-Xms1g -Xmx1g"
export KAFKA_HEAP_OPTS
### generic jvm settings
KAFKA_OPTS="-Djdk.tls.ephemeralDHKeySize=2048 -javaagent:/opt/confluent/prometheus/jmx_prometheus_javaagent.jar=1237:/opt/confluent/prometheus/kafka_connect.yml"
export KAFKA_OPTS
### performance options
KAFKA_JVM_PERFORMANCE_OPTS="-server -XX:+UseG1GC -XX:MaxGCPauseMillis=20 -XX:InitiatingHeapOccupancyPercent=35 -XX:+ExplicitGCInvokesConcurrent -XX:MaxInlineLevel=15 -Djava.awt.headless=true"
export KAFKA_JVM_PERFORMANCE_OPTS
### gc options
KAFKA_GC_LOG_OPTS="-Xlog:gc*:file=/logs/kafka-connect/connect-gc.log:time,tags:filecount=10,filesize=100M"
export KAFKA_GC_LOG_OPTS
### jmx settings
KAFKA_JMX_OPTS="-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false"
export KAFKA_JMX_OPTS
### log4j settings
KAFKA_LOG4J_OPTS="-Dlog4j.configuration=file:/opt/confluent/log4j/kafka-connect-log4j.properties"
export KAFKA_LOG4J_OPTS

CLASSPATH="/opt/confluent/confluent-7.0.1/share/java/kafka-connect-replicator/*"
export CLASSPATH

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
touch ${LOG_DIR}/connect.log
nohup ${CONFLUENT_HOME}/bin/connect-distributed ${PROPERTIES_FILE} > /dev/null 2>&1 &

### tail stdout log
if [ "${1}" == "tail" ]; then
    tail -f ${LOG_DIR}/connect.log
fi
