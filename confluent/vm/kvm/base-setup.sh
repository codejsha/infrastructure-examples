#!/bin/bash

dnf update -y
dnf install -y epel-release
dnf install -y curl jq git unzip net-tools neovim chrony htop
dnf install -y glibc libgcc libstdc++ python3 ca-certificates tar

USER="confluent"

cat <<EOF | sudo tee /etc/sudoers.d/${USER}
${USER} ALL=(ALL) NOPASSWD:ALL
EOF
