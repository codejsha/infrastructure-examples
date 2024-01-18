alias ll="ls -alh"
alias vi="nvim"
alias vim="nvim"
alias vimdiff="nvim -d"
alias watch="watch "

export LANG=en_US.UTF-8
export CLICOLOR=1
export PS1="%F{green}%n@%m%f %F{yellow}%1~%f %F{green}%#%f "
export GPG_TTY="$(tty)"
export PATH="/opt/homebrew/opt/llvm/bin:${PATH}"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

function gotorepos() { DIRECTORY="${HOME}/source/repos"; echo "+ cd ${DIRECTORY}">&2; cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls -alh; fi; }
function gotocoderepos() { DIRECTORY="${HOME}/source/coderepos"; echo "+ cd ${DIRECTORY}">&2; cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls -alh; fi; }
function gotosubrepos() { DIRECTORY="${HOME}/source/subrepos"; echo "+ cd ${DIRECTORY}">&2; cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls -alh; fi; }
function gotodataworkspace() { DIRECTORY="${HOME}/source/dataworkspace"; echo "+ cd ${DIRECTORY}">&2; cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls -alh; fi; }
function gotoworkrepos() { DIRECTORY="${HOME}/source/workrepos"; echo "+ cd ${DIRECTORY}">&2; cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls -alh; fi; }
function gotoprops() { DIRECTORY="${HOME}/properties"; echo "+ cd ${DIRECTORY}">&2; cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls -alh; fi; }

function awsprofilework() { export AWS_PROFILE="shortterm-work"; sh ~/properties/aws/work/aws-sts-token.sh; }
function forklift() { DIRECTORY="${1}"; if [ -n "${1}" ]; then open -b com.binarynights.forklift-setapp ${1}; else open -b com.binarynights.forklift-setapp $(pwd); fi; }

case ${TERM} in
  xterm*)
    precmd () {
        local DIR=${PWD/#$HOME/\~}
        print -Pn "\e]0;${DIR##*/}\a"
    }
    ;;
esac
