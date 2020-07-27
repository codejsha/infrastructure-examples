#!/usr/bin/bash

cat > /etc/systemd/system/docker.service.d/override.conf <<EOF
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd --host tcp://0.0.0.0:2375 --host unix:///var/run/docker.sock
EOF
