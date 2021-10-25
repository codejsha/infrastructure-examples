#!/bin/bash

### 6.2.1
docker image build --file Dockerfile.kafka-connect --tag harbor.example.com/confluentinc/confluentinc/cp-custom-server-connect:6.2.1 .
docker image push harbor.example.com/confluentinc/confluentinc/cp-custom-server-connect:6.2.1

### latest
# docker image build --file Dockerfile.kafka-connect --tag harbor.example.com/confluentinc/cp-custom-server-connect:latest .
# docker image push harbor.example.com/confluentinc/cp-custom-server-connect:latest
