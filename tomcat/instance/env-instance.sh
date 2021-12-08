#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

export INSTANCE_NAME="inst1"
export CATALINA_BASE="${CATALINA_HOME}/instances/${INSTANCE_NAME}"
export JVM_ROUTE="${INSTANCE_NAME}"
export APP_BASE="webapps"
export DOC_BASE=""

# export TOMCAT_ADDRESS="127.0.0.1"
export TOMCAT_ADDRESS="test.example.com"
export TOMCAT_HTTP_PORT="8080"
export TOMCAT_HTTPS_PORT="8443"
export TOMCAT_SHUTDOWN_PORT="8005"
export TOMCAT_AJP_PORT="8009"
export TOMCAT_JMX_PORT="8050"

export LOG_DIR="${CATALINA_BASE}/logs"
export DUMP_LOG_DIR="${LOG_DIR}/dump"

######################################################################

### cluster static

export TOMCAT_CLUSTER_ADDRESS1="test1.examaple.com"
export TOMCAT_CLUSTER_PORT1="4000"
export TOMCAT_CLUSTER_ADDRESS2="test2.examaple.com"
export TOMCAT_CLUSTER_PORT2="4000"
export TOMCAT_RECEIVER_PORT="4000"

######################################################################

function set_arguments {
    while [[ ${#} -gt 0 ]]
    do
        ARGS="${1}"
        shift
        case "${ARGS}" in
            "--instance")               INSTANCE_NAME="${1}";                   shift;;
            "--instance="*)             INSTANCE_NAME="${ARGS#*=}";             ;;
            "--address")                TOMCAT_ADDRESS="${1}";                  shift;;
            "--address="*)              TOMCAT_ADDRESS="${ARGS#*=}";            ;;
            "--http-port")              TOMCAT_HTTP_PORT="${1}";                shift;;
            "--http-port="*)            TOMCAT_HTTP_PORT="${ARGS#*=}";          ;;
            "--https-port")             TOMCAT_HTTPS_PORT="${1}";               shift;;
            "--https-port="*)           TOMCAT_HTTPS_PORT="${ARGS#*=}";         ;;
            "--shutdown-port")          TOMCAT_SHUTDOWN_PORT="${1}";            shift;;
            "--shutdown-port="*)        TOMCAT_SHUTDOWN_PORT="${ARGS#*=}";      ;;
            "--ajp-port")               TOMCAT_AJP_PORT="${1}";                 shift;;
            "--ajp-port="*)             TOMCAT_AJP_PORT="${ARGS#*=}";           ;;
            "--jmx-port")               TOMCAT_JMX_PORT="${1}";                 shift;;
            "--jmx-port="*)             TOMCAT_JMX_PORT="${ARGS#*=}";           ;;
            "--cluster-address1")       TOMCAT_CLUSTER_ADDRESS1="${1}";         shift;;
            "--cluster-address1="*)     TOMCAT_CLUSTER_ADDRESS1="${ARGS#*=}";   ;;
            "--cluster-port1")          TOMCAT_CLUSTER_PORT1="${1}";            shift;;
            "--cluster-port1="*)        TOMCAT_CLUSTER_PORT1="${ARGS#*=}";      ;;
            "--cluster-address2")       TOMCAT_CLUSTER_ADDRESS2="${1}";         shift;;
            "--cluster-address2="*)     TOMCAT_CLUSTER_ADDRESS2="${ARGS#*=}";   ;;
            "--cluster-port2")          TOMCAT_CLUSTER_PORT2="${1}";            shift;;
            "--cluster-port2="*)        TOMCAT_CLUSTER_PORT2="${ARGS#*=}";      ;;
            "--receiver-port")          TOMCAT_RECEIVER_PORT="${1}";            shift;;
            "--receiver-port="*)        TOMCAT_RECEIVER_PORT="${ARGS#*=}";      ;;
        esac
    done
}

######################################################################

set_arguments ${@}
