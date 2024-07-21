# Linux

## Bash shell scripting

### Trap command and bash options

```bash
#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace
```

```bash
#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace
set -o xtrace
```

### Logging and executing the command

```bash
function sudo() { echo "+ sudo ${@}">&2; command sudo "${@}"; }
```

### Change directory with logging and listing

```bash
function cddownloads() { DIRECTORY="${HOME}/Downloads"; echo "+ cd ${DIRECTORY}">&2; cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls -alh; fi; }
```

## Tools

### PSSH

```bash
sudo dnf install -y epel-release
sudo dnf install -y pssh
```

### htop

```bash
sudo dnf install -y epel-release
sudo dnf install -y htop
```

### sysstat

```bash
sudo dnf install -y sysstat
```

### vnstat

```bash
sudo yum install -y install epel-release
sudo yum install -y vnstat

vnstat --testkernel

sudo vnstat --create -i eth0
sudo systemctl restart vnstat
```

### cockpit

```bash
sudo yum install -y cockpit
sudo yum install -y cockpit-networkmanager
sudo yum install -y cockpit-packagekit
sudo yum install -y cockpit-storaged
sudo yum install -y cockpit-pcp

sudo yum install -y cockpit-dashboard

sudo yum install -y cockpit-machines
sudo yum install -y cockpit-podman

sudo systemctl enable cockpit.socket
sudo systemctl start cockpit.socket
sudo systemctl start cockpit.service

sudo systemctl enable pmcd
sudo systemctl start pmcd
sudo systemctl enable pmlogger
sudo systemctl start pmlogger

sudo firewall-cmd --permanent --zone=public --add-service=cockpit
sudo firewall-cmd --reload

# curl --insecure --include https://test.example.com:9090
# curl -ki https://test.example.com:9090
```
