export ZSH="${HOME}/.oh-my-zsh"
export ZSH_COMPDUMP="${HOME}/.cache/zcompdump/zcompdump-${ZSH_VERSION}"
ZSH_THEME="agnoster"
DISABLE_AUTO_TITLE="true"
SHOW_AWS_PROMPT="false"
plugins=(
    aliases
    argocd
    aws
    brew
    docker
    docker-compose
    forklift
    fzf
    gh
    git
    git-flow-avh
    golang
    gpg-agent
    gradle
    helm
    istioctl
    jira
    kubectl
    minikube
    npm
    nvm
    pip
    poetry
    python
    virtualenv
    vscode
    yarn
)
source ${ZSH}/oh-my-zsh.sh
prompt_context() {}

case ${TERM} in
  xterm*)
    precmd () {print -Pn "\e]0;%~\a"}
    ;;
esac

LS_COLORS="di=36:ln=38;5;210:or=31:so=32:pi=33:ex=32:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

export PATH="/opt/homebrew/opt/llvm/bin:${PATH}"
export PATH="${HOME}/go/bin:${PATH}"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/microsoft-21.jdk/Contents/Home"
export GROOVY_HOME="/opt/homebrew/opt/groovysdk/libexec"

alias ls="lsd"
alias ll="lsd -alh"
alias vi="nvim"
alias vim="nvim"
alias vimdiff="nvim -d"
alias docker-compose="docker compose"

alias vcpkg="${HOME}/tools/vcpkg/vcpkg"
alias mysql="/opt/homebrew/opt/mysql-client@8.4/bin/mysql"
alias mysqldump="/opt/homebrew/opt/mysql-client@8.4/bin/mysqldump"

function sudo() { echo "+ sudo ${@}">&2; command sudo "${@}"; }
function xargs() { echo "+ xargs ${@}">&2; command xargs "${@}"; }
function make() { echo "+ make ${@}">&2; command make "${@}"; }
function brew() { echo "+ brew ${@}">&2; command brew "${@}"; }
function curl() { echo "+ curl ${@}">&2; command curl "${@}"; }
function http() { echo "+ http ${@}">&2; command http "${@}"; }
function jq() { echo "+ jq ${@}">&2; command jq "${@}"; }
function fd() { echo "+ fd ${@}">&2; command fd "${@}"; }
function rg() { echo "+ rg ${@}">&2; command rg "${@}"; }
function go() { echo "+ go ${@}">&2; command go "${@}"; }
function python() { echo "+ python ${@}">&2; command python "${@}"; }
function jar() { echo "+ jar ${@}">&2; command jar "${@}"; }
function java() { echo "+ java ${@}">&2; command java "${@}"; }
function jcmd() { echo "+ jcmd ${@}">&2; command jcmd "${@}"; }
function jstack() { echo "+ jstack ${@}">&2; command jstack "${@}"; }
function docker() { echo "+ docker ${@}">&2; command docker "${@}"; }
function kubectl() { echo "+ kubectl ${@}">&2; command kubectl "${@}"; }
function kustomize() { echo "+ kustomize ${@}">&2; command kustomize "${@}"; }
function helm() { echo "+ helm ${@}">&2; command helm "${@}"; }
function istioctl() { echo "+ istioctl ${@}">&2; command istioctl "${@}"; }
function vault() { echo "+ vault ${@}">&2; command vault "${@}"; }
function tekton() { echo "+ tekton ${@}">&2; command tekton "${@}"; }
function aws() { echo "+ aws ${@}">&2; command aws "${@}"; }

function cddownloads() { DIRECTORY="${HOME}/Downloads"; echo "+ cd ${DIRECTORY}">&2; cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then lsd -alh; fi; }
function cdrepos() { DIRECTORY="${HOME}/source/repos"; echo "+ cd ${DIRECTORY}">&2; cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then lsd -alh; fi; }
function cdcoderepos() { DIRECTORY="${HOME}/source/coderepos"; echo "+ cd ${DIRECTORY}">&2; cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then lsd -alh; fi; }
function cdsubrepos() { DIRECTORY="${HOME}/source/subrepos"; echo "+ cd ${DIRECTORY}">&2; cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then lsd -alh; fi; }
function cddataworkspace() { DIRECTORY="${HOME}/source/dataworkspace"; echo "+ cd ${DIRECTORY}">&2; cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then lsd -alh; fi; }
function cdworkrepos() { DIRECTORY="${HOME}/source/workrepos"; echo "+ cd ${DIRECTORY}">&2; cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then lsd -alh; fi; }
function cdprops() { DIRECTORY="${HOME}/properties"; echo "+ cd ${DIRECTORY}">&2; cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then lsd -alh; fi; }

function change-java-temurin-8() { JAVA_HOME="/Library/Java/JavaVirtualMachines/temurin-8.jdk/Contents/Home"; export JAVA_HOME; ${JAVA_HOME}/bin/java -version; }
function change-java-temurin-11() { JAVA_HOME="/Library/Java/JavaVirtualMachines/temurin-11.jdk/Contents/Home"; export JAVA_HOME; ${JAVA_HOME}/bin/java -version; }
function change-java-temurin-17() { JAVA_HOME="/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home"; export JAVA_HOME; ${JAVA_HOME}/bin/java -version; }
function change-java-temurin-21() { JAVA_HOME="/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home"; export JAVA_HOME; ${JAVA_HOME}/bin/java -version; }

function gclo() { REPO_URL="${1}"; DIR_NAME="${2}"; if [ -z "${DIR_NAME}" ]; then REPO_NAME="${DIR_NAME}"; else REPO_NAME=$(basename "${REPO_URL}" .git | tr '[:upper:]' '[:lower:]'); fi; echo "+ git clone ${REPO_URL} ${REPO_NAME}">&2; command git clone ${REPO_URL} ${REPO_NAME}; }
