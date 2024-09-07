######################################################################

export TZ="Asia/Seoul"

######################################################################

### timezone

timedatectl status
timedatectl list-timezones | grep Seoul
timedatectl set-timezone Asia/Seoul

######################################################################

### date

### seconds since 1970-01-01 00:00:00 UTC
date +%s

######################################################################

### hwclock (hardware clock)

hwclock

######################################################################

### ntp

ntpq -p
