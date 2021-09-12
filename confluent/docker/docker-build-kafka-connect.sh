#!/bin/bash

### 6.1.0.0
docker image build --file Dockerfile.kafka-connect --tag harbor.example.com/confluentinc/cp-custom-kafka-connect-operator:6.1.0.0 .
docker image push harbor.example.com/confluentinc/cp-custom-kafka-connect-operator:6.1.0.0

### latest
# docker image build --file Dockerfile.kafka-connect --tag harbor.example.com/confluentinc/cp-custom-kafka-connect-operator:latest .
# docker image push harbor.example.com/confluentinc/cp-custom-kafka-connect-operator:latest
