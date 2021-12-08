#!/bin/bash

USER="confluent"
GROUP="confluent"

CONFLUENT_HOME="/usr/local/confluent"
SERVER_NAME="schema-registry2"
PROPERTIES_FILE="${CONFLUENT_HOME}/properties/${SERVER_NAME}.properties"

LOG_DIR="/mnt/schema-registry/logs"

######################################################################

sudo mkdir -p /usr/lib/systemd/system/confluent-schema-registry.service.d
sudo mkdir -p ${LOG_DIR}
sudo chown -R confluent:confluent ${LOG_DIR}

######################################################################

### default

cat <<EOF | sudo tee /usr/lib/systemd/system/confluent-schema-registry.service
[Unit]
Description=Confluent Schema Registry
Documentation=http://docs.confluent.io/
After=network.target confluent-kafka.target

[Service]
Type=simple
User=cp-schema-registry
Group=confluent
Environment="LOG_DIR=/var/log/confluent/schema-registry"
ExecStart=/usr/bin/schema-registry-start /etc/schema-registry/schema-registry.properties
TimeoutStopSec=180
Restart=no

[Install]
WantedBy=multi-user.target
EOF

######################################################################

### override

cat <<EOF | sudo tee /usr/lib/systemd/system/confluent-schema-registry.service.d/override.conf
[Service]
User=
Group=
User=confluent
Group=confluent

Restart=no
SuccessExitStatus=0 143

Environment=
EnvironmentFile=-${CONFLUENT_HOME}/services/schema-registry-service.env

ExecStart=
ExecStart=/usr/bin/schema-registry-start ${PROPERTIES_FILE}

# ExecStop=
EOF

######################################################################

sudo systemctl daemon-reload
