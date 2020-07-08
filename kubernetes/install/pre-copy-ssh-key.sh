#!/usr/bin/bash

if [ ! -f hosts.txt ]; then
    echo "ERROR: The host file does not exist!"
    exit
fi

yum install -y epel-release sshpass
cat hosts.txt >> /etc/hosts
