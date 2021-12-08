#!/bin/bash

USER="confluent"
GROUP="confluent"

CONFLUENT_HOME="/usr/local/confluent"
SERVER_NAME="ksqldb1"
PROPERTIES_FILE="${CONFLUENT_HOME}/properties/${SERVER_NAME}.properties"

DATA_DIR="/mnt/ksqldb/data"
LOG_DIR="/mnt/ksqldb/logs"

######################################################################

sudo mkdir -p /usr/lib/systemd/system/confluent-ksqldb.service.d
sudo mkdir -p {${DATA_DIR},${LOG_DIR}}
sudo chown -R confluent:confluent ${DATA_DIR} ${LOG_DIR}

######################################################################

### default

cat <<EOF | sudo tee /usr/lib/systemd/system/confluent-ksqldb.service
[Unit]
Description=Confluent ksqlDB
Documentation=http://docs.confluent.io/
After=network.target confluent-kafka.target confluent-schema-registry.target

[Service]
Type=simple
User=cp-ksql
Group=confluent
Environment="LOG_DIR=/var/log/confluent/ksql"
ExecStart=/usr/bin/ksql-server-start /etc/ksqldb/ksql-server.properties
TimeoutStopSec=180
Restart=no

[Install]
WantedBy=multi-user.target
EOF

######################################################################

### override

cat <<EOF | sudo tee /usr/lib/systemd/system/confluent-ksqldb.service.d/override.conf
[Service]
User=
Group=
User=confluent
Group=confluent

Restart=no
SuccessExitStatus=0 143

Environment=
EnvironmentFile=-${CONFLUENT_HOME}/services/ksqldb-service.env

ExecStart=
ExecStart=/usr/bin/ksql-server-start ${PROPERTIES_FILE}

# ExecStop=
EOF

######################################################################

sudo systemctl daemon-reload
