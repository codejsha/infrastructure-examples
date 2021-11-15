#!/bin/bash

### 7.0.0
docker image build --file Dockerfile --tag harbor.example.com/confluentinc/cp-server-connect-custom:7.0.0 .
docker image push harbor.example.com/confluentinc/cp-server-connect-custom:7.0.0

### latest
# docker image build --file Dockerfile --tag harbor.example.com/confluentinc/cp-server-connect-custom:latest .
# docker image push harbor.example.com/confluentinc/cp-server-connect-custom:latest
