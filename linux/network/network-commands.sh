######################################################################

function curl() { echo "+ curl ${@}">&2; command curl "${@}"; }

######################################################################

function ss() { echo "+ ss ${@}">&2; command ss "${@}"; }

alias ssantu="sudo ss --all --numeric --tcp --udp --processes"
# alias ssalntu="sudo ss --all --listening --numeric --tcp --udp"
alias ssalntup="sudo ss --all --listening --numeric --tcp --udp --processes"
# alias ssalntum="sudo ss --all --listening --numeric --tcp --udp --memory"

######################################################################

function netstat() { echo "+ netstat ${@}">&2; command netstat "${@}"; }

alias netstat-lntup="sudo netstat --listening --numeric --tcp --udp --programs"
