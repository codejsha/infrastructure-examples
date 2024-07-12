######################################################################

export TZ="Asia/Seoul"

######################################################################

### timezone

timedatectl status

timedatectl list-timezones | grep Seoul

timedatectl set-timezone Asia/Seoul
