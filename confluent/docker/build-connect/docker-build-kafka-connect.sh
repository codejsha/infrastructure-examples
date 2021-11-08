#!/bin/bash

### 7.0.0
docker image build --file Dockerfile.kafka-connect --tag harbor.example.com/confluentinc/confluentinc/cp-custom-server-connect:7.0.0 .
docker image push harbor.example.com/confluentinc/confluentinc/cp-custom-server-connect:7.0.0

### latest
# docker image build --file Dockerfile.kafka-connect --tag harbor.example.com/confluentinc/cp-custom-server-connect:latest .
# docker image push harbor.example.com/confluentinc/cp-custom-server-connect:latest
