#!/usr/bin/bash

# Download the binary
curl -sLO https://github.com/argoproj/argo/releases/download/v2.10.1/argo-linux-amd64.gz

# Unzip
gunzip argo-linux-amd64.gz

# Make binary executable
chmod +x argo-linux-amd64

# Move binary to path
sudo mv ./argo-linux-amd64 /usr/local/bin/argo

# Test installation
argo version
