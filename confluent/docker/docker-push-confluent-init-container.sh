#!/bin/bash

### 2.2.0
docker pull confluentinc/confluent-init-container:2.2.0
docker image tag confluentinc/confluent-init-container:2.2.0 harbor.example.com/confluentinc/confluent-init-container:2.2.0
docker image push harbor.example.com/confluentinc/confluent-init-container:2.2.0
