######################################################################

### Samba Client
### cf. CIFS(Common Internet File System)
### smbclient-4.6.2, Windows 10 Pro, CentOS 7
### Use Samba clients on CentOS to access shared Windows folders, allowing file read and write operations.

### install required packages:
### - samba-client: Includes smbclient (connect to Samba/Windows shares), nmblookup (resolve host addresses), and findsmb (discover SMB hosts).
### - cifs-utils: Provides tools for mounting and managing CIFS shares.
yum install -y cifs-utils
yum install -y samba-client

### Check connection using smbclient
smbclient //${HOST_IP}/${SHARE_FOLDER} -U ${USERNAME} -W ${WORKGROUP}
### -c (--command=STRING): Execute semicolon separated commands
### -V (--version): Print version
### -W (--workgroup=WORKGROUP) (Connection options): Set the workgroup name, (computer name is also possible, from the output of `net config workstation`)
### -U (--user=USERNAME) (Authentication options): Set the network username

### Check version
smbclient -V
# Version 4.6.2

### Connect to a shared folder
smbclient //192.168.137.1/share -U shareuser -W THISPC
# Enter THISPC\share's password:
# Domain=[THISPC] OS=[Windows 10 Pro 16299] Server=[Windows 10 Pro 6.3]
# smb: \>
# smb: \> ls

### Execute a command in the shared folder
smbclient //192.168.137.1/share -U shareuser -W THISPC -c "del new.txt"
# Enter THISPC\share's password:
# Domain=[THISPC] OS=[Windows 10 Pro 16299] Server=[Windows 10 Pro 6.3]

### Mount a shared folder
mount -t cifs -o username=${USERNAME},password=${PASSWORD} //${HOST_IP}/${SHARE_FOLDER} ${MOUNT_PATH}

mkdir /mnt/share
mount -t cifs -o user=shareuser,password=PASSWORD //192.168.137.1/share /mnt/share

### Automatically mount shared folders at boot
vi /etc/fstab

//${HOST_IP}/${SHARE_FOLDER} ${MOUNT_PATH} cifs username=USERNAME,password=PASSWORD 0 0
//192.168.137.1/share   /mnt/share              cifs    username=shareuser,password=PASSWORD 0 0
//192.168.137.1/storage /mnt/storage            cifs    username=shareuser,password=PASSWORD,uid=prouser,gid=progroup 0 0

echo "//192.168.137.1/share   /mnt/share              cifs    username=shareuser,password=PASSWORD 0 0" >> /etc/fstab
echo "//192.168.137.1/storage /mnt/storage            cifs    username=shareuser,password=PASSWORD,uid=prouser,gid=progroup 0 0" >> /etc/fstab
