######################################################################

function sudo() { echo "+ sudo ${*}">&2; command sudo "${*}"; }
function xargs() { echo "+ xargs ${*}">&2; command xargs "${*}"; }

function ssh() { echo "+ ssh ${*}">&2; command ssh "${*}"; }

### process
function pgrep() { echo "+ pgrep ${*}">&2; command pgrep "${*}"; }
function kill() { echo "+ kill ${*}">&2; command kill "${*}"; }
function pkill() { echo "+ pkill ${*}">&2; command pkill "${*}"; }

######################################################################

### watch
watch -x bash -ic "my-alias"
alias watch="watch "

######################################################################

### location

export LS_COLORS="di=36:ln=38;5;210:or=31:so=32:pi=33:ex=32:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
# di: directory
# ex: executable file
# ln: symbolic link
# or: orphan symbolic link
# so: socket

alias ll="ls -l -h --color=auto"

function cdp() { DIRECTORY="${1}"; echo "+ cd -P ${*}">&2; command cd -P ${DIRECTORY}; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then printf "\e[38;2;216;160;223mLOCATION: $(pwd)\e[0m\n"; ls --almost-all -l; fi; }
function readlinkpwd() { echo "+ readlink --canonicalize .">&2; command readlink --canonicalize .; }

function cdldconf() { DIRECTORY="/etc/ld.so.conf.d"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
function cdlocal() { DIRECTORY="/usr/local"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }

######################################################################

function cdservicesys() { DIRECTORY="/etc/systemd/system"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
function cdservicepkg() { DIRECTORY="/usr/lib/systemd/system"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }

######################################################################

alias pxelasticsearch="pgrep -xa java | grep elasticsearch"
function cdelasticsearch() { DIRECTORY="/usr/local/elasticsearch"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }

alias pxkibana="pgrep -xa node | grep kibana"
function cdkibana() { DIRECTORY="/usr/local/kibana"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }

alias pxfluentd="pgrep -xa ruby | grep fluentd"
