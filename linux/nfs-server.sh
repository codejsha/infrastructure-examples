#!/usr/bin/bash

yum install -y nfs-utils

cat /etc/nfs.conf

cat > /etc/exports <<EOF
/mnt/nfsshare *(rw,no_root_squash)
EOF

exportfs -r
exportfs -v

systemctl enable nfs-server
systemctl start nfs-server
systemctl status nfs-server

firewall-cmd --permanent --zone=public --add-service=nfs-server
firewall-cmd --permanent --zone=public --add-service=mountd
firewall-cmd --permanent --zone=public --add-service=rpc-bind
firewall-cmd --reload
firewall-cmd --list-all
