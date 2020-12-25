#!/bin/bash

source ./env-base.sh

CONNECTION_FILTER="${CONNECTION_FILTER}, 192.168.137.0/24 test.example.com 7001 allow"
CONNECTION_FILTER="${CONNECTION_FILTER}, 0.0.0.0/0 * * deny"
export CONNECTION_FILTER

######################################################################

export CONFIG_JVM_ARGS="${CONFIG_JVM_ARGS} -Djava.security.egd=file:///dev/urandom"
if [[ ${WEBLOGIC_VERSION} =~ ^10.3 ]]; then
    ${MW_HOME}/wlserver_10.3/common/bin/wlst.sh set_domain_connection_filter.py
elif [[ ${WEBLOGIC_VERSION} =~ ^12.|^14.1 ]]; then
    ${ORACLE_HOME}/oracle_common/common/bin/wlst.sh set_domain_connection_filter.py
fi
