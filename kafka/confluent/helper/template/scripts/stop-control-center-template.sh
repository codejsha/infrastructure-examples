#!/bin/bash

# CONFLUENT_HOME=""

# ${CONFLUENT_HOME}/bin/control-center-stop

# PID="$(pgrep -xa java | grep ${CONFLUENT_HOME} | grep "io\.confluent\.controlcenter\.ControlCenter" | awk '{print $1}')"
# kill -9 ${PID}
# kill -15 ${PID}

pkill -9 -ecf "io\.confluent\.controlcenter\.ControlCenter"
# pkill -15 -ecf "io\.confluent\.controlcenter\.ControlCenter"
