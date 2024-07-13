######################################################################

alias pxlagexporter="pgrep -xa java | grep kafka-lag-exporter"

alias killlagexporter="pkill -9 -ecx kafka-lag-exporter"

######################################################################

LAG_EXPORTER_HOME="/usr/local/kafka-lag-exporter"
LAG_EXPORTER_CONFIG_FILE="${LAG_EXPORTER_HOME}/application.conf"
LAG_EXPORTER_LOGBACK_CONFIG_FILE="${LAG_EXPORTER_HOME}/logback.xml"
LOG_DIR="${LAG_EXPORTER_HOME}"

### start
${LAG_EXPORTER_HOME}/bin/kafka-lag-exporter \
    -Dconfig.file=${LAG_EXPORTER_CONFIG_FILE} \
    -Dlogback.configurationFile=${LAG_EXPORTER_LOGBACK_CONFIG_FILE}

nohup ${LAG_EXPORTER_HOME}/bin/kafka-lag-exporter \
    -Dconfig.file=${LAG_EXPORTER_CONFIG_FILE} \
    -Dlogback.configurationFile=${LAG_EXPORTER_LOGBACK_CONFIG_FILE} \
    > ${LOG_DIR}/nohup.kafka-lag-exporter.out 2>&1 &
