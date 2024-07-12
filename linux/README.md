# Linux

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

## Installing CentOS 7

### Welcome to CentOS 7

- Language: English / English(United States)

### Installation Summary

Location:

- Date & Time : Asia/Seoul timezone
- Keyboard: English (US)
- Language Support: English (United States)

Software:

- Installation Source: Local media
- Software Selection: Minimal Install

System:

- Installation Destination: Automatic partitioning selected
- Kdump: Kdump is enabled
- Network & Host Name: Wired (eth0) connected
- Security Policy : No profile selected

Ethernet:

- General > Automatically connect to this network when it is available: ENABLED
- IPv4 Settings:
  - Method: Manual
  - Addresses: 192.168.137.XXX / 24 / 192.168.137.1
  - DNS servers: 8.8.8.8,168.126.63.1

### Configuration

User Settings:

- Root Password: Root Password is set
- User Creation: User prouser will be created
