#!/usr/bin/bash

curl -JLO https://dl.min.io/client/mc/release/linux-amd64/mc
chmod +x mc
sudo mv mc /usr/local/bin
mc --help
