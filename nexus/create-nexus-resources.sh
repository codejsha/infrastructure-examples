#!/usr/bin/bash

nx-create-user.sh "developer" "developer"

bash nx-create-blobstore.sh "nexus-maven-central"
bash nx-create-blobstore.sh "nexus-docker-hub"
bash nx-create-blobstore.sh "nexus-docker-registry"
bash nx-create-blobstore.sh "nexus-helm-chartmuseum"

bash nx-delete-repository.sh "maven-central"
bash nx-create-maven-proxy-repo.sh "maven-central" "nexus-maven-central" "https://repo1.maven.org/maven2/"
basj nx-update-maven-group-repo.sh "docker-group" "default" "\"maven-central\",\"maven-releases\",\"maven-snapshots\""

bash nx-create-docker-proxy-repo.sh "docker-hub" "nexus-docker-hub" "https://registry-1.docker.io"
bash nx-create-docker-proxy-repo.sh "docker-registry" "nexus-docker-registry" "http://my-docker-registry.registry-system:5000"
bash nx-create-docker-group-repo.sh "docker-group" "default" "\"docker-hub\",\"docker-registry\""

bash nx-create-helm-proxy-repo.sh "helm-chartmuseum" "nexus-helm-chartmuseum" "http://chartmuseum-service.chart-system:8080"

### delete
# bash nx-delete-repository.sh "maven-central"
# bash nx-delete-repository.sh "docker-hub"
# bash nx-delete-repository.sh "docker-registry"
# bash nx-delete-repository.sh "docker-group"
# bash nx-delete-repository.sh "helm-chartmuseum"
# bash nx-delete-blobstore.sh "nexus-maven-central"
# bash nx-delete-blobstore.sh "nexus-docker-hub"
# bash nx-delete-blobstore.sh "nexus-docker-registry"
# bash nx-delete-blobstore.sh "nexus-helm-chartmuseum"
