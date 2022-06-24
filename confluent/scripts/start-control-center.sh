#!/bin/bash
# Maintained by Ansible (custom)

CONFLUENT_HOME="/opt/confluent/confluent-7.0.1"
PROPERTIES_FILE="/opt/confluent/etc/confluent-control-center/control-center-production.properties"

DATA_DIR="/data/control-center"
LOG_DIR="/logs/control-center"
export LOG_DIR

######################################################################

### memory options
CONTROL_CENTER_HEAP_OPTS="-Xms4g -Xmx4g"
export CONTROL_CENTER_HEAP_OPTS
### generic jvm settings and gc options
CONTROL_CENTER_OPTS="-Djdk.tls.ephemeralDHKeySize=2048 -Xlog:gc*:file=/logs/control-center/control-center-gc.log:time,tags:filecount=10,filesize=100M"
export CONTROL_CENTER_OPTS
### log4j settings
CONTROL_CENTER_LOG4J_OPTS="-Dlog4j.configuration=file:/opt/confluent/log4j/control-center-log4j.properties"
export CONTROL_CENTER_LOG4J_OPTS
### performance options
CONTROL_CENTER_JVM_PERFORMANCE_OPTS="-server -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -XX:+CMSScavengeBeforeRemark -XX:+DisableExplicitGC -XX:MaxInlineLevel=15 -Djava.awt.headless=true"
export CONTROL_CENTER_JVM_PERFORMANCE_OPTS
### jmx settings
CONTROL_CENTER_JMX_OPTS="-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false"
export CONTROL_CENTER_JMX_OPTS


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
touch ${LOG_DIR}/control-center.log
nohup ${CONFLUENT_HOME}/bin/control-center-start ${PROPERTIES_FILE} > /dev/null 2>&1 &

### tail log
if [ "${1}" == "tail" ]; then
    tail -f ${LOG_DIR}/control-center.log
fi
