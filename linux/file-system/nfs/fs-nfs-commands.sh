######################################################################

### NFS Client

### Install package
yum install -y nfs-utils

### Mount directory
mount -t nfs ${HOST_IP}/${SHARE_FOLDER} ${MOUNT_PATH}

mkdir /mnt/nfsshare01
mount -t nfs 192.168.137.130/nfsshare01 /mnt/nfsshare01

######################################################################

### NFS Server

### Install package
yum install -y nfs-utils

### NFS Conf
cat /etc/nfs.conf

## exports
vi /etc/exports

/mnt/nfsshare *(rw)
/mnt/nfsshare/pv01 *(rw,no_root_squash)
/mnt/nfsshare/pv02 *(rw,no_root_squash)
/mnt/nfsshare/pv03 *(rw,no_root_squash)
/mnt/nfsshare/pv04 *(rw,no_root_squash)
/mnt/nfsshare/pv05 *(rw,no_root_squash)
/mnt/nfsshare/pv06 *(rw,no_root_squash)
/mnt/nfsshare/pv07 *(rw,no_root_squash)
/mnt/nfsshare/pv08 *(rw,no_root_squash)
/mnt/nfsshare/pv09 *(rw,no_root_squash)
/mnt/nfsshare/pv10 *(rw,no_root_squash)
/mnt/nfsshare/pv11 *(rw,no_root_squash)
/mnt/nfsshare/pv12 *(rw,no_root_squash)
/mnt/nfsshare/pv13 *(rw,no_root_squash)
/mnt/nfsshare/pv14 *(rw,no_root_squash)
/mnt/nfsshare/pv15 *(rw,no_root_squash)
/mnt/nfsshare/pv16 *(rw,no_root_squash)
/mnt/nfsshare/pv17 *(rw,no_root_squash)
/mnt/nfsshare/pv18 *(rw,no_root_squash)
/mnt/nfsshare/pv19 *(rw,no_root_squash)
/mnt/nfsshare/pv20 *(rw,no_root_squash)

exportfs -r

exportfs -v
# /mnt/nfsshare   <world>(sync,wdelay,hide,no_subtree_check,sec=sys,rw,secure,root_squash,no_all_squash)
# /mnt/nfsshare/nfsshare01
#                 <world>(sync,wdelay,hide,no_subtree_check,sec=sys,rw,secure,no_root_squash,no_all_squash)
# /mnt/nfsshare/nfsshare02
#                 <world>(sync,wdelay,hide,no_subtree_check,sec=sys,rw,secure,no_root_squash,no_all_squash)
# /mnt/nfsshare/nfsshare03
#                 <world>(sync,wdelay,hide,no_subtree_check,sec=sys,rw,secure,no_root_squash,no_all_squash)
# /mnt/nfsshare/nfsshare04
#                 <world>(sync,wdelay,hide,no_subtree_check,sec=sys,rw,secure,no_root_squash,no_all_squash)
# /mnt/nfsshare/nfsshare05
#                 <world>(sync,wdelay,hide,no_subtree_check,sec=sys,rw,secure,no_root_squash,no_all_squash)
# /mnt/nfsshare/nfsshare06
#                 <world>(sync,wdelay,hide,no_subtree_check,sec=sys,rw,secure,no_root_squash,no_all_squash)
# /mnt/nfsshare/nfsshare07
#                 <world>(sync,wdelay,hide,no_subtree_check,sec=sys,rw,secure,no_root_squash,no_all_squash)
# /mnt/nfsshare/nfsshare08
#                 <world>(sync,wdelay,hide,no_subtree_check,sec=sys,rw,secure,no_root_squash,no_all_squash)
# /mnt/nfsshare/nfsshare09
#                 <world>(sync,wdelay,hide,no_subtree_check,sec=sys,rw,secure,no_root_squash,no_all_squash)
# /mnt/nfsshare/nfsshare10
#                 <world>(sync,wdelay,hide,no_subtree_check,sec=sys,rw,secure,no_root_squash,no_all_squash)
# /mnt/nfsshare/nfsshare11
#                 <world>(sync,wdelay,hide,no_subtree_check,sec=sys,rw,secure,no_root_squash,no_all_squash)
# /mnt/nfsshare/nfsshare12
#                 <world>(sync,wdelay,hide,no_subtree_check,sec=sys,rw,secure,no_root_squash,no_all_squash)
# /mnt/nfsshare/nfsshare13
#                 <world>(sync,wdelay,hide,no_subtree_check,sec=sys,rw,secure,no_root_squash,no_all_squash)
# /mnt/nfsshare/nfsshare14
#                 <world>(sync,wdelay,hide,no_subtree_check,sec=sys,rw,secure,no_root_squash,no_all_squash)
# /mnt/nfsshare/nfsshare15
#                 <world>(sync,wdelay,hide,no_subtree_check,sec=sys,rw,secure,no_root_squash,no_all_squash)
# /mnt/nfsshare/nfsshare16
#                 <world>(sync,wdelay,hide,no_subtree_check,sec=sys,rw,secure,no_root_squash,no_all_squash)
# /mnt/nfsshare/nfsshare17
#                 <world>(sync,wdelay,hide,no_subtree_check,sec=sys,rw,secure,no_root_squash,no_all_squash)
# /mnt/nfsshare/nfsshare18
#                 <world>(sync,wdelay,hide,no_subtree_check,sec=sys,rw,secure,no_root_squash,no_all_squash)
# /mnt/nfsshare/nfsshare19
#                 <world>(sync,wdelay,hide,no_subtree_check,sec=sys,rw,secure,no_root_squash,no_all_squash)
# /mnt/nfsshare/nfsshare20
#                 <world>(sync,wdelay,hide,no_subtree_check,sec=sys,rw,secure,no_root_squash,no_all_squash)

## start
systemctl enable nfs
systemctl start nfs
systemctl status nfs

systemctl enable nfs-server
systemctl start nfs-server
systemctl status nfs-server

## firewall
firewall-cmd --permanent --zone=public --add-service=nfs
firewall-cmd --permanent --zone=public --add-service=mountd
firewall-cmd --permanent --zone=public --add-service=rpc-bind
firewall-cmd --reload
firewall-cmd --list-all
