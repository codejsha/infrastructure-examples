#!/bin/bash
# Maintained by Ansible

CONFLUENT_HOME="/opt/confluent/confluent-7.0.1"
PROPERTIES_FILE="/opt/confluent/etc/ksqldb/ksql-server.properties"

DATA_DIR="/data/ksqldb"
LOG_DIR="/logs/ksqldb"
export LOG_DIR

######################################################################

### memory options
KSQL_HEAP_OPTS="-Xms1g -Xmx1g"
export KSQL_HEAP_OPTS
### generic jvm settings
KSQL_OPTS="-Djdk.tls.ephemeralDHKeySize=2048 -javaagent:/opt/confluent/prometheus/jmx_prometheus_javaagent.jar=1238:/opt/confluent/prometheus/ksql.yml"
export KSQL_OPTS
### log4j settings
KSQL_LOG4J_OPTS="-Dlog4j.configuration=file:/opt/confluent/log4j/ksqldb-log4j.properties"
export KSQL_LOG4J_OPTS
### performance options
KSQL_JVM_PERFORMANCE_OPTS="-server -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -XX:+CMSScavengeBeforeRemark -XX:+DisableExplicitGC -XX:MaxInlineLevel=15 -Djava.awt.headless=true"
export KSQL_JVM_PERFORMANCE_OPTS
### gc options
KSQL_GC_LOG_OPTS="-Xlog:gc*:file=/logs/ksqldb/ksql-server-gc.log:time,tags:filecount=10,filesize=100M"
export KSQL_GC_LOG_OPTS
### jmx settings
KSQL_JMX_OPTS="-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false"
export KSQL_JMX_OPTS

ROCKSDB_SHAREDLIB_DIR="/tmp/ksqldb"
export ROCKSDB_SHAREDLIB_DIR

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

### check data and log directories
if [ ! -d "${DATA_DIR}" ]; then
    echo "[ERROR] The data dir (${DATA_DIR}) does not exist!"
    exit
fi
if [ ! -d "${LOG_DIR}" ]; then
    echo "[ERROR] The log dir (${LOG_DIR}) does not exist!"
    exit
fi

### start
touch ${LOG_DIR}/ksql.log
nohup ${CONFLUENT_HOME}/bin/ksql-server-start ${PROPERTIES_FILE} > /dev/null 2>&1 &

### tail stdout log
if [ "${1}" == "tail" ]; then
    tail -f ${LOG_DIR}/ksql.log
fi
