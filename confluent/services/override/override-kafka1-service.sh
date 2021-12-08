#!/bin/bash

USER="confluent"
GROUP="confluent"

CONFLUENT_HOME="/usr/local/confluent"
SERVER_NAME="kafka1"
PROPERTIES_FILE="${CONFLUENT_HOME}/properties/kafka1.properties"

DATA_DIR="/mnt/kafka/data"
LOG_DIR="/mnt/kafka/logs"

######################################################################

sudo mkdir -p /usr/lib/systemd/system/confluent-server.service.d
sudo mkdir -p {${DATA_DIR},${LOG_DIR}}
sudo chown -R confluent:confluent ${DATA_DIR} ${LOG_DIR}

######################################################################

### default

cat <<EOF | sudo tee /usr/lib/systemd/system/confluent-server.service
[Unit]
Description=Confluent Kafka
Documentation=http://docs.confluent.io/
After=network.target confluent-zookeeper.target

[Service]
Type=simple
User=cp-kafka
Group=confluent
ExecStart=/usr/bin/kafka-server-start /etc/kafka/server.properties
LimitNOFILE=1000000
TimeoutStopSec=180
Restart=no

[Install]
WantedBy=multi-user.target
EOF

######################################################################

### override

cat <<EOF | sudo tee /usr/lib/systemd/system/confluent-server.service.d/override.conf
[Service]
User=
Group=
User=confluent
Group=confluent

Restart=no
SuccessExitStatus=0 143

Environment=
EnvironmentFile=-${CONFLUENT_HOME}/services/kafka-service.env

ExecStart=
ExecStart=/usr/bin/kafka-server-start ${PROPERTIES_FILE}

# ExecStop=
EOF

######################################################################

sudo systemctl daemon-reload
