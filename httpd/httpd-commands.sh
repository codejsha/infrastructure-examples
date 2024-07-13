######################################################################

function httpd() { echo "+ httpd ${*}">&2; command httpd "${*}"; }

alias pxhttpd="sudo pgrep -xa httpd | grep httpd"
alias psefhttpd="sudo ps -ef | grep httpd"

alias killhttpd="sudo pkill -9 -ecx httpd"

function cdhttpd() { DIRECTORY="/etc/httpd"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
function cdhttpdconf() { DIRECTORY="/etc/httpd/conf"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
function cdhttpdconfd() { DIRECTORY="/etc/httpd/conf.d"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
function cdhttpdconfmd() { DIRECTORY="/etc/httpd/conf.modules.d"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
function cdhttpddocs() { DIRECTORY="/var/www/html"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
function cdhttpdlog() { DIRECTORY="/var/log/httpd"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
function cdhttpdmod() { DIRECTORY="/usr/lib64/httpd/modules"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
function cdhttpdrun() { DIRECTORY="/run/httpd"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }

######################################################################
