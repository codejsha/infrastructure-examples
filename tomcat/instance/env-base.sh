#!/usr/bin/bash

### define variables
export INSTANCE_NAME="${1:-inst1}"
export JAVA_HOME="/usr/lib/jvm/java-11"
export CATALINA_HOME="/usr/local/tomcat"
export CATALINA_BASE="${CATALINA_HOME}/instances/${INSTANCE_NAME}"
export JVM_ROUTE="${INSTANCE_NAME}"
export APP_BASE="webapps"
export DOC_BASE=""

export TOMCAT_PORT_HTTP="${2:-8080}"
export TOMCAT_PORT_HTTPS="${3:-8443}"
export TOMCAT_PORT_SHUTDOWN="${4:-8005}"
export TOMCAT_PORT_AJP="${5:-8009}"

export LOG_DIR="\${CATALINA_BASE}/logs"
export DUMP_LOG_DIR="\${LOG_DIR}/dump"
export CATALINA_OUT="\${LOG_DIR}/catalina.out"
export GC_LOG_OUT="\${LOG_DIR}/gc_\${INSTANCE_NAME}.log"

######################################################################

### tidy function
function tidy_indent {
    XML_FILE="${1}"
    tidy -modify \
        --indent auto --indent-spaces 4 --indent-attributes true \
        --input-xml true --output-xml true \
        --hide-comments true --quote-nbsp false \
        --quiet true --wrap 80 \
        ${XML_FILE}
}

function tidy_nowrap {
    XML_FILE="${1}"
    tidy -modify \
        --indent auto --indent-spaces 4 --indent-attributes false \
        --input-xml true --output-xml true \
        --hide-comments true --quote-nbsp false \
        --quiet true --wrap 0 \
        ${XML_FILE}
}

### set variables
export JAVA_VERSION="$(${JAVA_HOME}/bin/java -version 2>&1 /dev/null \
    | grep version | awk '{print $3}' | tr -d '"')"
