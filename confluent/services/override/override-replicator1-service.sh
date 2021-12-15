#!/bin/bash

USER="confluent"
GROUP="confluent"

CONFLUENT_HOME="/usr/local/confluent"
SERVER_NAME="replicator1"
PROPERTIES_FILE="${CONFLUENT_HOME}/properties/${SERVER_NAME}.properties"

LOG_DIR="/mnt/replicator/logs"

######################################################################

sudo mkdir -p /etc/systemd/system/confluent-replicator.service.d
sudo mkdir -p ${LOG_DIR}
sudo chown -R confluent:confluent ${LOG_DIR}

######################################################################

### service (custom)

cat <<EOF | sudo tee /usr/lib/systemd/system/confluent-replicator.service
[Unit]
Description=Confluent Replicator
Documentation=http://docs.confluent.io/
After=network.target confluent-server.target

[Service]
Type=simple
User=cp-kafka-connect
Group=confluent
ExecStart=/usr/bin/connect-distributed /etc/kafka-connect-replicator/replicator-connect-distributed.properties
TimeoutStopSec=180
Restart=no

[Install]
WantedBy=multi-user.target
EOF

######################################################################

### override

cat <<EOF | sudo tee /etc/systemd/system/confluent-replicator.service.d/override.conf
[Service]
User=
Group=
User=confluent
Group=confluent

Restart=no
SuccessExitStatus=0 143

Environment=
EnvironmentFile=-${CONFLUENT_HOME}/services/replicator-service.env

# ExecStartPre=/bin/mkdir -p \${LOG_DIR}
ExecStart=
ExecStart=/usr/bin/connect-distributed ${PROPERTIES_FILE}
# ExecStop=
EOF

######################################################################

sudo systemctl daemon-reload
