#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

### USER
cd security

### create-user.sh ${USER_ID} ${USER_PASSWORD}
bash ./create-user.sh "developer" "developer"

cd ..

######################################################################

### BLOBSTORE
cd blobstore

export AWS_ACCESS_KEY="minio"
export AWS_SECRET_KEY="minio123"

### create-blobstore.sh ${BLOBSTORE_NAME}
bash ./create-blobstore.sh "nexus-maven-central"
bash ./create-blobstore.sh "nexus-maven-confluent"
bash ./create-blobstore.sh "nexus-docker-hub"
# bash ./create-blobstore.sh "nexus-docker-registry"
# bash ./create-blobstore.sh "nexus-docker-kube-registry"
bash ./create-blobstore.sh "nexus-docker-harbor"
# bash ./create-blobstore.sh "nexus-helm-chartmuseum"
bash ./create-blobstore.sh "nexus-helm-harbor"

cd ..

######################################################################

### MAVEN
cd repository

### delete-repository.sh ${REPOSITORY_NAME}
bash ./delete-repository.sh "maven-central"

cd ../
cd repository/maven

### create-maven-proxy-repo.sh ${REPOSITORY_NAME} ${BLOBSTORE_NAME} ${REMOTE_URL}
bash ./create-maven-proxy-repo.sh "maven-central" "nexus-maven-central" "https://repo1.maven.org/maven2/"
bash ./create-maven-proxy-repo.sh "maven-confluent" "nexus-maven-confluent" "https://packages.confluent.io/maven/"

### update-maven-group-repo.sh ${REPOSITORY_NAME} ${BLOBSTORE_NAME} ${REPOSITORY_MEMBER_NAMES}
bash ./update-maven-group-repo.sh "maven-public" "default" "maven-central\", \"maven-confluent\", \"maven-releases\", \"maven-snapshots"

cd ../../

######################################################################

### DOCKER
cd repository/docker

### create-docker-proxy-repo.sh ${REPOSITORY_NAME} ${BLOBSTORE_NAME} ${REMOTE_URL} ${DOCKER_INDEX_TYPE}
bash ./create-docker-proxy-repo.sh "docker-hub" "nexus-docker-hub" "https://registry-1.docker.io" "HUB"
# bash ./create-docker-proxy-repo.sh "docker-registry" "nexus-docker-registry" "http://my-docker-registry.registry-system.svc.cluster.local:5000" "REGISTRY"
# bash ./create-docker-proxy-repo.sh "docker-registry" "nexus-docker-registry" "http://registry.example.com" "REGISTRY"
# bash ./create-docker-proxy-repo.sh "docker-kube-registry" "nexus-docker-kube-registry" "http://registry.kube-system.svc.cluster.local:5000" "REGISTRY"
bash ./create-docker-proxy-repo.sh "docker-harbor" "nexus-docker-harbor" "http://harbor.example.com" "REGISTRY"
# bash ./create-docker-proxy-repo.sh "docker-harbor" "nexus-docker-harbor" "https://harbor.example.com" "REGISTRY"
# bash ./create-docker-proxy-repo.sh "docker-harbor" "nexus-docker-harbor" "http://my-harbor-harbor-registry.harbor-system.svc.cluster.local:5000" "REGISTRY"
# bash ./create-docker-proxy-repo.sh "docker-harbor" "nexus-docker-harbor" "https://my-harbor-harbor-registry.harbor-system.svc.cluster.local:5000" "REGISTRY"

### create-docker-group-repo.sh ${REPOSITORY_NAME} ${BLOBSTORE_NAME} ${REPOSITORY_MEMBER_NAMES}
# bash ./create-docker-group-repo.sh "docker-group" "default" "docker-hub\", \"docker-registry"
# bash ./create-docker-group-repo.sh "docker-group" "default" "docker-hub\", \"docker-kube-registry"
bash ./create-docker-group-repo.sh "docker-group" "default" "docker-hub\", \"docker-harbor"

### update-docker-group-repo.sh ${REPOSITORY_NAME} ${BLOBSTORE_NAME} ${REPOSITORY_MEMBER_NAMES}
# bash ./update-docker-group-repo.sh "docker-group" "default" "docker-hub\", \"docker-registry\", \"docker-kube-registry"
# bash ./update-docker-group-repo.sh "docker-group" "default" "docker-hub\", \"docker-harbor"

cd ../../
cd security

### set-active-realms-list.sh ${REALM_IDS}
bash ./set-active-realms-list.sh "\"NexusAuthenticatingRealm\", \"NexusAuthorizingRealm\", \"DockerToken\""

cd ..

######################################################################

### HELM
cd repository/helm

### create-helm-proxy-repo.sh ${REPOSITORY_NAME} ${BLOBSTORE_NAME} ${REMOTE_URL}
# bash ./create-helm-proxy-repo.sh "helm-chartmuseum" "nexus-helm-chartmuseum" "http://chartmuseum-service.chart-system.svc.cluster.local:8080"
bash ./create-helm-proxy-repo.sh "helm-harbor" "nexus-helm-harbor" "http://harbor.example.com"
# bash ./create-helm-proxy-repo.sh "helm-harbor" "nexus-helm-harbor" "https://harbor.example.com"

cd ..

######################################################################

### DELETE

# cd repository
# bash ./delete-repository.sh "maven-central"
# bash ./delete-repository.sh "maven-confluent"
# bash ./delete-repository.sh "docker-hub"
# bash ./delete-repository.sh "docker-registry"
# bash ./delete-repository.sh "docker-harbor"
# bash ./delete-repository.sh "docker-group"
# bash ./delete-repository.sh "helm-chartmuseum"
# bash ./delete-repository.sh "helm-harbor"
# cd ..

# cd blobstore
# bash ./delete-blobstore.sh "nexus-maven-central"
# bash ./delete-blobstore.sh "nexus-maven-confluent"
# bash ./delete-blobstore.sh "nexus-docker-hub"
# bash ./delete-blobstore.sh "nexus-docker-registry"
# bash ./delete-blobstore.sh "nexus-docker-kube-registry"
# bash ./delete-blobstore.sh "nexus-docker-harbor"
# bash ./delete-blobstore.sh "nexus-helm-chartmuseum"
# bash ./delete-blobstore.sh "nexus-helm-harbor"
# cd ..
