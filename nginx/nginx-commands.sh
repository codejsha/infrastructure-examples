######################################################################

### process
alias pxnginx="sudo pgrep -xa nginx | grep nginx"
alias psefnginx="sudo ps -ef | grep nginx"

######################################################################

function cdnginx() { DIRECTORY="/etc/nginx"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }

######################################################################

### version
nginx -v

### version and configure options
nginx -V

### test configuration
nginx -t

### test configuration, dump it
nginx -T
