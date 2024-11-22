### ohmyzsh
export ZSH="${HOME}/.oh-my-zsh"
export ZSH_COMPDUMP="${HOME}/.cache/zcompdump/zcompdump-${ZSH_VERSION}"
DISABLE_AUTO_TITLE="true"
DISABLE_LS_COLORS="true"
ENABLE_CORRECTION="false"
SHOW_AWS_PROMPT="false"
plugins=(aliases brew copypath docker docker-compose dotnet forklift fzf gh git git-flow golang gpg-agent gradle helm kubectl kubectx npm perl pip poetry python virtualenv vscode yarn)
source ${ZSH}/oh-my-zsh.sh

### starship
export STARSHIP_CONFIG="${HOME}/.config/starship/starship.toml"
eval "$(starship init zsh)"

### terminal title
case ${TERM} in
  xterm*)
    precmd () {print -Pn "\e]0;%~\a"}
    ;;
esac

### variables
export LS_COLORS="di=36:ln=38;5;210:or=31:so=32:pi=33:ex=32:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
export PATH="/opt/homebrew/opt/llvm/bin:${PATH}"
export PATH="${HOME}/go/bin:${PATH}"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/microsoft-21.jdk/Contents/Home"
export GROOVY_HOME="/opt/homebrew/opt/groovysdk/libexec"

### aliases
alias ls="lsd"
alias ll="lsd -alh"
alias vi="nvim"
alias vim="nvim"
alias vimdiff="nvim -d"
alias vcpkg="${HOME}/tools/vcpkg/vcpkg"
alias mysql="/opt/homebrew/opt/mysql-client@8.4/bin/mysql"
alias mysqldump="/opt/homebrew/opt/mysql-client@8.4/bin/mysqldump"

preexec() {
  if [[ "$1" =~ ^(aws|brew|curl|docker|fd|git|go|helm|http|istioctl|jar|java|jcmd|jq|jstack|kubectl|kustomize|make|python3|rg|sudo|tekton|vault|xargs).* ]]; then
    echo "+ $1"
  fi
}

source /opt/homebrew/opt/git-extras/share/git-extras/git-extras-completion.zsh

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
