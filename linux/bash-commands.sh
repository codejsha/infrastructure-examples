######################################################################

### trap error

#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace
set -o xtrace

######################################################################

### command

command -v ll
function sudo() { echo "+ sudo ${@}">&2; command sudo "${@}"; }
function make() { echo "+ make ${@}">&2; command make "${@}"; }

which -a vim

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

ls -l -h --color=auto
readlink --canonicalize .

function cdp() { DIRECTORY="${1}"; echo "+ cd -P ${*}">&2; command cd -P ${DIRECTORY}; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then printf "\e[38;2;216;160;223mLOCATION: $(pwd)\e[0m\n"; ls --almost-all -l; fi; }

######################################################################

### split string
local IFS=$'\n'
local arr=($(echo "${input}" | awk -F'[;|&]+' '{for (i=1; i<=NF; i++) print $i}'))
