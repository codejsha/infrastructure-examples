######################################################################

### timezone

timedatectl status
timedatectl list-timezones | grep Seoul
timedatectl set-timezone Asia/Seoul

export TZ="Asia/Seoul"

######################################################################

### date

### seconds since 1970-01-01 00:00:00 UTC
date +%s

######################################################################

### hwclock (hardware clock)

hwclock

######################################################################

### chrony
sudo dnf install -y chrony

######################################################################

### ntp

### install (dnf)
sudo dnf install -y ntp
sudo systemctl enable ntpd
sudo systemctl start ntpd

### install (apt)
sudo apt-get install -y ntp

ntpq -p
