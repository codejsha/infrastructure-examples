#!/usr/bin/bash

GITLAB_HOME="/mnt/volume/gitlab"
mkdir -p ${GITLAB_HOME}

docker run \
    --detach \
    --name my-gitlab \
    --restart unless-stopped \
    --hostname gitlab.example.com \
    --publish 9443:443 \
    --publish 9480:80 \
    --publish 9422:22 \
    --env GITLAB_OMNIBUS_CONFIG="external_url 'http://gitlab.example.com/'; gitlab_rails['lfs_enabled'] = true; gitlab_rails['gitlab_shell_ssh_port'] = 9422;" \
    --mount type=volume,src=${GITLAB_HOME}/config,dst=/etc/gitlab \
    --mount type=volume,src=${GITLAB_HOME}/logs,dst=/var/log/gitlab \
    --mount type=volume,src=${GITLAB_HOME}/data,dst=/var/opt/gitlab \
    gitlab/gitlab-ce:latest
