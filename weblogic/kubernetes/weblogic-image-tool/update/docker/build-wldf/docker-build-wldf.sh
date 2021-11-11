#!/bin/bash

### docker build
docker build -f Dockerfile -t weblogic:14.1.1-update .

### podman build
# podman build -f Dockerfile -t weblogic:14.1.1-update .
