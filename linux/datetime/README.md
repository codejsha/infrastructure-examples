# Datetime

## Tools

### chrony

```bash
sudo dnf install -y chrony
```

### ntp

#### DNF/YUM

```bash
sudo dnf install -y ntp
sudo systemctl enable ntpd
sudo systemctl start ntpd
```

#### APT

```bash
sudo apt-get install -y ntp
```
