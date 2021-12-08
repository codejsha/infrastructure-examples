#!/bin/bash

USER="confluent"
GROUP="confluent"

CONFLUENT_HOME="/usr/local/confluent"
SERVER_NAME="control-center1"
PROPERTIES_FILE="${CONFLUENT_HOME}/properties/control-center1.properties"

DATA_DIR="/mnt/control-center/data"
LOG_DIR="/mnt/control-center/logs"

######################################################################

sudo mkdir -p /usr/lib/systemd/system/confluent-control-center.service.d
sudo mkdir -p {${DATA_DIR},${LOG_DIR}}
sudo chown -R confluent:confluent ${DATA_DIR} ${LOG_DIR}

######################################################################

### default

cat <<EOF | sudo tee /usr/lib/systemd/system/confluent-control-center.service
[Unit]
Description=Confluent Control Center
Documentation=http://docs.confluent.io/
After=network.target confluent-kafka.target

[Service]
Type=simple
User=cp-control-center
Group=confluent
Environment="LOG_DIR=/var/log/confluent/control-center" "CONTROL_CENTER_LOG4J_OPTS=-Dlog4j.configuration=file:/etc/confluent-control-center/log4j-rolling.properties"
ExecStart=/usr/bin/control-center-start /etc/confluent-control-center/control-center-production.properties
TimeoutStopSec=180
Restart=always
LimitNOFILE=100000

[Install]
WantedBy=multi-user.target
EOF

######################################################################

### override

cat <<EOF | sudo tee /usr/lib/systemd/system/confluent-control-center.service.d/override.conf
[Service]
User=
Group=
User=confluent
Group=confluent

Restart=no
SuccessExitStatus=0 143

Environment=
EnvironmentFile=-${CONFLUENT_HOME}/services/control-center-service.env

ExecStart=
ExecStart=/usr/bin/control-center-start ${PROPERTIES_FILE}

# ExecStop=
EOF

######################################################################

sudo systemctl daemon-reload
