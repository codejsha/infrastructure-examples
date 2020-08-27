#!/usr/bin/bash

# TOMCAT_MAJOR_VERSION="8"
# TOMCAT_VERSION="8.5.57"
TOMCAT_MAJOR_VERSION="9"
TOMCAT_VERSION="9.0.37"
# TOMCAT_MAJOR_VERSION="10"
# TOMCAT_VERSION="10.0.0-M7"

APPSVR_DIR="/svc/appsvr"

curl -o ${APPSVR_DIR}/apache-tomcat-${TOMCAT_VERSION}.tar.gz -JLO http://mirror.apache-kr.org/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz
tar -C ${APPSVR_DIR} -xzf ${APPSVR_DIR}/apache-tomcat-${TOMCAT_VERSION}.tar.gz
mv ${APPSVR_DIR}/apache-tomcat-${TOMCAT_VERSION} ${APPSVR_DIR}/tomcat${TOMCAT_MAJOR_VERSION}
rm -f ${APPSVR_DIR}/apache-tomcat-${TOMCAT_VERSION}.tar.gz
