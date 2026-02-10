######################################################################

sudo lshw -short

### cpu
lscpu

### memory
sudo lshw -short -C memory

######################################################################

### storage

### df (Report file system disk usage)
df -h
### du (Report on disk usage)
du -sh *

######################################################################

lsblk

lsblk -V
lsblk --version

lsblk -t
lsblk --topology

fdisk -l
