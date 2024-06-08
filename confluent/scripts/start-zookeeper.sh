#!/bin/bash
# Maintained by Ansible (custom)

CONFLUENT_HOME="/opt/confluent/confluent-7.0.1"
PROPERTIES_FILE="/opt/confluent/etc/kafka/zookeeper.properties"

DATA_DIR="/data/zookeeper"
LOG_DIR="/logs/zookeeper"
export LOG_DIR

######################################################################

### memory options
KAFKA_HEAP_OPTS="-Xms512m -Xmx512m"
export KAFKA_HEAP_OPTS
### generic jvm settings
KAFKA_OPTS="-Djdk.tls.ephemeralDHKeySize=2048 -Djava.security.auth.login.config=/opt/confluent/etc/kafka/zookeeper_jaas.conf -javaagent:/opt/confluent/prometheus/jmx_prometheus_javaagent.jar=1234:/opt/confluent/prometheus/zookeeper.yml"
export KAFKA_OPTS
### log4j settings
KAFKA_LOG4J_OPTS="-Dlog4j.configuration=file:/opt/confluent/log4j/zookeeper-log4j.properties"
export KAFKA_LOG4J_OPTS
### performance options
KAFKA_JVM_PERFORMANCE_OPTS="-server -XX:+UseG1GC -XX:MaxGCPauseMillis=20 -XX:InitiatingHeapOccupancyPercent=35 -XX:+ExplicitGCInvokesConcurrent -XX:MaxInlineLevel=15 -Djava.awt.headless=true"
export KAFKA_JVM_PERFORMANCE_OPTS
### gc options
KAFKA_GC_LOG_OPTS="-Xlog:gc*:file=/logs/zookeeper/zookeeper-gc.log:time,tags:filecount=10,filesize=100M"
export KAFKA_GC_LOG_OPTS
### jmx settings
KAFKA_JMX_OPTS="-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false"
export KAFKA_JMX_OPTS


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

### check data and log directories
if [ ! -d "${DATA_DIR}" ]; then
    echo "[ERROR] The data dir (${DATA_DIR}) does not exist!"
    exit
fi
if [ ! -d "${LOG_DIR}" ]; then
    echo "[ERROR] The log dir (${LOG_DIR}) does not exist!"
    exit
fi

### check myid file
if [ ! -f "${DATA_DIR}/myid" ]; then
    echo "[ERROR] The myid file (${DATA_DIR}/myid) does not exist!"
    exit
fi

### start
touch ${LOG_DIR}/zookeeper-server.log
nohup ${CONFLUENT_HOME}/bin/zookeeper-server-start ${PROPERTIES_FILE} > /dev/null 2>&1 &

### tail log
if [ "${1}" == "tail" ]; then
    tail -f ${LOG_DIR}/zookeeper-server.log
fi
