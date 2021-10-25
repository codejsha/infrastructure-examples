#!/bin/bash

### 2.0.3
docker pull confluentinc/confluent-init-container:2.0.3
docker image tag confluentinc/confluent-init-container:2.0.3 harbor.example.com/confluentinc/confluent-init-container:2.0.3
docker image push harbor.example.com/confluentinc/confluent-init-container:2.0.3
