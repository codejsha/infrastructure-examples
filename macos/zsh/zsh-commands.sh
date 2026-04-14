######################################################################

zsh --no-rcs

### clear history
history -p

######################################################################

function cddownloads() { local directory="${HOME}/Downloads"; echo "+ cd ${directory}" >&2; cd "${directory}" || return; lsd -alh; }
function cdrepos() { local directory="${HOME}/source/repos"; echo "+ cd ${directory}" >&2; cd "${directory}" || return; lsd -alh; }
function cdcoderepos() { local directory="${HOME}/source/coderepos"; echo "+ cd ${directory}" >&2; cd "${directory}" || return; lsd -alh; }
function cdsubrepos() { local directory="${HOME}/source/subrepos"; echo "+ cd ${directory}" >&2; cd "${directory}" || return; lsd -alh; }
function cddataworkspace() { local directory="${HOME}/source/dataworkspace"; echo "+ cd ${directory}" >&2; cd "${directory}" || return; lsd -alh; }
function cdworkrepos() { local directory="${HOME}/source/workrepos"; echo "+ cd ${directory}" >&2; cd "${directory}" || return; lsd -alh; }
function cdprops() { local directory="${HOME}/properties"; echo "+ cd ${directory}" >&2; cd "${directory}" || return; lsd -alh; }
function cdtools() { local directory="${HOME}/tools"; echo "+ cd ${directory}" >&2; cd "${directory}" || return; lsd -alh; }

function cddownloads() { DIRECTORY="${HOME}/Downloads"; echo "+ cd ${DIRECTORY}">&2; cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then lsd -alh; fi; }
function cdrepos() { DIRECTORY="${HOME}/source/repos"; echo "+ cd ${DIRECTORY}">&2; cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then lsd -alh; fi; }
function cdcoderepos() { DIRECTORY="${HOME}/source/coderepos"; echo "+ cd ${DIRECTORY}">&2; cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then lsd -alh; fi; }
function cdsubrepos() { DIRECTORY="${HOME}/source/subrepos"; echo "+ cd ${DIRECTORY}">&2; cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then lsd -alh; fi; }
function cddataworkspace() { DIRECTORY="${HOME}/source/dataworkspace"; echo "+ cd ${DIRECTORY}">&2; cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then lsd -alh; fi; }
function cdworkrepos() { DIRECTORY="${HOME}/source/workrepos"; echo "+ cd ${DIRECTORY}">&2; cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then lsd -alh; fi; }
function cdprops() { DIRECTORY="${HOME}/properties"; echo "+ cd ${DIRECTORY}">&2; cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then lsd -alh; fi; }
function cdtools() { DIRECTORY="${HOME}/tools"; echo "+ cd ${DIRECTORY}">&2; cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then lsd -alh; fi; }

######################################################################

### title update
autoload -Uz add-zsh-hook
_update_title() { print -Pn "\e]0;%1~\a" }
add-zsh-hook precmd _update_title
add-zsh-hook chpwd _update_title

######################################################################

### full path using tilde

case ${TERM} in
  xterm*)
    precmd () {print -Pn "\e]0;%~\a"}
    ;;
esac

######################################################################

### current directory name

case ${TERM} in
  xterm*)
    precmd () {print -Pn "\e]0;${PWD##*/}\a"}
    ;;
esac

case $TERM in
  xterm*)
    precmd () { print -Pn "\e]0;%1~\a" }
    ;;
esac

######################################################################

### current directory name using tilde

case ${TERM} in
  xterm*)
    precmd () {
        local DIR=${PWD/#$HOME/\~}
        print -Pn "\e]0;${DIR##*/}\a"
    }
    ;;
esac

######################################################################

### preexec/precmd

### preexec
preexec() {
  echo "preexec: ${1}"
}

### precmd
precmd() {
  echo "precmd: ${1}"
}

### starship_precmd_user_func
function blastoff(){
    echo "🚀"
}
starship_precmd_user_func="blastoff"
