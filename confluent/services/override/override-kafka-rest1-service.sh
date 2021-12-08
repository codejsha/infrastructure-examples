#!/bin/bash

USER="confluent"
GROUP="confluent"

CONFLUENT_HOME="/usr/local/confluent"
SERVER_NAME="kafka-rest1"
PROPERTIES_FILE="${CONFLUENT_HOME}/properties/${SERVER_NAME}.properties"

LOG_DIR="/mnt/kafka-rest/logs"

######################################################################

sudo mkdir -p /usr/lib/systemd/system/confluent-kafka-rest.service.d
sudo mkdir -p ${LOG_DIR}
sudo chown -R confluent:confluent ${LOG_DIR}

######################################################################

### default

cat <<EOF | sudo tee /usr/lib/systemd/system/confluent-kafka-rest.service
[Unit]
Description=Confluent Kafka Rest
Documentation=http://docs.confluent.io/
After=network.target confluent-kafka.target

[Service]
Type=simple
User=cp-kafka-rest
Group=confluent
Environment="LOG_DIR=/var/log/confluent/kafka-rest"
ExecStart=/usr/bin/kafka-rest-start /etc/kafka-rest/kafka-rest.properties
LimitNOFILE=100000
TimeoutStopSec=180
Restart=no

[Install]
WantedBy=multi-user.target
EOF

######################################################################

### override

cat <<EOF | sudo tee /usr/lib/systemd/system/confluent-kafka-rest.service.d/override.conf
[Service]
User=
Group=
User=confluent
Group=confluent

Restart=no
SuccessExitStatus=0 143

Environment=
EnvironmentFile=-${CONFLUENT_HOME}/services/kafka-rest-service.env

ExecStart=
ExecStart=/usr/bin/kafka-server-start ${PROPERTIES_FILE}

# ExecStop=
EOF

######################################################################

sudo systemctl daemon-reload
