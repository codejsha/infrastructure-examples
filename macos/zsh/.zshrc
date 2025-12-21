### shell integration
export ZSH_COMPDUMP="${HOME}/.cache/zcompdump/zcompdump-${ZSH_VERSION}"
export STARSHIP_CONFIG="${HOME}/.config/starship/starship.toml"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(atuin init zsh --disable-up-arrow)"
source ${HOMEBREW_PREFIX}/opt/git-extras/share/git-extras/git-extras-completion.zsh
source ${HOMEBREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source ${HOMEBREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ${HOME}/tools/zsh-plugins/load-zsh-plugins.sh
FPATH=${HOMEBREW_PREFIX}/share/zsh-completions:${FPATH}
autoload -Uz compinit
compinit -C

### variables
export LS_COLORS="di=36:ln=38;5;210:or=31:so=32:pi=33:ex=32:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
export PATH="/opt/homebrew/opt/curl/bin:${PATH}"
export PATH="/opt/homebrew/opt/llvm/bin:${PATH}"
export PATH="${HOME}/go/bin:${PATH}"
export PATH="${HOME}/.krew/bin:${PATH}"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/microsoft-21.jdk/Contents/Home"
export GROOVY_HOME="/opt/homebrew/opt/groovysdk/libexec"
export VCPKG_ROOT="${HOME}/tools/vcpkg"

### aliases
alias ls="lsd"
alias ll="lsd -alh"
alias vi="nvim"
alias vim="nvim"
alias vimdiff="nvim -d"
alias cat="bat --style=plain --paging=never"
alias fl="open -b com.binarynights.forklift-setapp"
alias mysql="/opt/homebrew/opt/mysql-client@8.4/bin/mysql"
alias mysqldump="/opt/homebrew/opt/mysql-client@8.4/bin/mysqldump"

function cddownloads() { DIRECTORY="${HOME}/Downloads"; echo "+ cd ${DIRECTORY}">&2; cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then lsd -alh; fi; }
function cdrepos() { DIRECTORY="${HOME}/source/repos"; echo "+ cd ${DIRECTORY}">&2; cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then lsd -alh; fi; }
function cdcoderepos() { DIRECTORY="${HOME}/source/coderepos"; echo "+ cd ${DIRECTORY}">&2; cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then lsd -alh; fi; }
function cdsubrepos() { DIRECTORY="${HOME}/source/subrepos"; echo "+ cd ${DIRECTORY}">&2; cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then lsd -alh; fi; }
function cddataworkspace() { DIRECTORY="${HOME}/source/dataworkspace"; echo "+ cd ${DIRECTORY}">&2; cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then lsd -alh; fi; }
function cdworkrepos() { DIRECTORY="${HOME}/source/workrepos"; echo "+ cd ${DIRECTORY}">&2; cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then lsd -alh; fi; }
function cdprops() { DIRECTORY="${HOME}/properties"; echo "+ cd ${DIRECTORY}">&2; cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then lsd -alh; fi; }
function cdtools() { DIRECTORY="${HOME}/tools"; echo "+ cd ${DIRECTORY}">&2; cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then lsd -alh; fi; }

function change-java8() { JAVA_HOME="/Library/Java/JavaVirtualMachines/temurin-8.jdk/Contents/Home"; export JAVA_HOME; ${JAVA_HOME}/bin/java -version; }
function change-java11() { JAVA_HOME="/Library/Java/JavaVirtualMachines/temurin-11.jdk/Contents/Home"; export JAVA_HOME; ${JAVA_HOME}/bin/java -version; }
function change-java17() { JAVA_HOME="/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home"; export JAVA_HOME; ${JAVA_HOME}/bin/java -version; }
function change-java21() { JAVA_HOME="/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home"; export JAVA_HOME; ${JAVA_HOME}/bin/java -version; }

function git-clone-lower() { REPO_URL="${1}"; DIR_NAME="${2}"; if [ -n "${DIR_NAME}" ]; then REPO_NAME="${DIR_NAME}"; else REPO_NAME=$(basename "${REPO_URL}" .git | tr '[:upper:]' '[:lower:]'); fi; echo "+ git clone ${REPO_URL} ${REPO_NAME}">&2; command git clone ${REPO_URL} ${REPO_NAME}; }
