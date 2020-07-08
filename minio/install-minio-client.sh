#!/usr/bin/bash

curl -JLO https://dl.min.io/client/mc/release/linux-amd64/mc
chmod +x mc
mv mc /usr/local/bin
mc --help
