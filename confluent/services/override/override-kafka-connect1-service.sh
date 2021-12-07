#!/bin/bash

USER="confluent"
GROUP="confluent"

CONFLUENT_HOME="/usr/local/confluent"
SERVER_NAME="kafka-connect1"
PROPERTIES_FILE="${CONFLUENT_HOME}/properties/kafka-connect1.properties"

LOG_DIR="/mnt/kafka-connect/logs"

######################################################################

sudo mkdir -p /usr/lib/systemd/system/confluent-kafka-connect.service.d
sudo mkdir -p ${LOG_DIR}
sudo chown -R confluent:confluent ${LOG_DIR}

######################################################################

### default

cat <<EOF | sudo tee /usr/lib/systemd/system/confluent-kafka-connect.service
[Unit]
Description=Confluent Kafka Connect
Documentation=http://docs.confluent.io/
After=network.target confluent-server.target

[Service]
Type=simple
User=cp-kafka-connect
Group=confluent
ExecStart=/usr/bin/connect-distributed /etc/kafka/connect-distributed.properties
TimeoutStopSec=180
Restart=no

[Install]
WantedBy=multi-user.target
EOF

######################################################################

### override

cat <<EOF | sudo tee /usr/lib/systemd/system/confluent-kafka-connect.service.d/override.conf
[Service]
User=
Group=
User=confluent
Group=confluent

Restart=no
RestartSec=100ms
SuccessExitStatus=0 143

Environment=
EnvironmentFile=-${CONFLUENT_HOME}/services/kafka-connect-service.env

ExecStart=
ExecStart=/usr/bin/connect-distributed ${PROPERTIES_FILE}

# ExecStop=
EOF

######################################################################

sudo systemctl daemon-reload
