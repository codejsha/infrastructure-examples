#!/usr/bin/bash

source ./env-base.sh
source ./env-inst.sh

mkdir -p ${INSTANCE_HOME}
/usr/bin/cp -rpf ${WILDFLY_HOME}/standalone/configuration ${INSTANCE_HOME}
/usr/bin/cp -rpf ${WILDFLY_HOME}/standalone/deployments ${INSTANCE_HOME}
/usr/bin/cp -rpf ${WILDFLY_HOME}/standalone/lib ${INSTANCE_HOME}
/usr/bin/cp -rpf ${WILDFLY_HOME}/standalone/tmp ${INSTANCE_HOME}
