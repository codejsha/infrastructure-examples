######################################################################

function cdjava() { DIRECTORY="/usr/lib/jvm"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
function cdorcljava() { DIRECTORY="/usr/java"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }

function change-java8() { JAVA_HOME="/Library/Java/JavaVirtualMachines/temurin-8.jdk/Contents/Home"; export JAVA_HOME; ${JAVA_HOME}/bin/java -version; }
function change-java11() { JAVA_HOME="/Library/Java/JavaVirtualMachines/temurin-11.jdk/Contents/Home"; export JAVA_HOME; ${JAVA_HOME}/bin/java -version; }
function change-java17() { JAVA_HOME="/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home"; export JAVA_HOME; ${JAVA_HOME}/bin/java -version; }
function change-java21() { JAVA_HOME="/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home"; export JAVA_HOME; ${JAVA_HOME}/bin/java -version; }

######################################################################

### install prettier and prettier-java plugin

npm install -g prettier prettier-plugin-java

######################################################################

# export JAVA_HOME="/usr/java/current"
# export JAVA_HOME="/usr/lib/jvm/java-11"
# export JAVA_HOME="/usr/lib/jvm/java-1.8.0"
# export PATH="${PATH}:${JAVA_HOME}/bin"

### java process
alias pxjava="pgrep -xa java | grep java"
alias psefjava="sudo ps -ef | grep java"
alias killjava="pkill -9 -ecx java"

### openjdk
alias openjdk-version="java -version"
alias change-java-openjdk11="sudo alternatives --set java java-11-openjdk.x86_64"
alias change-javac-openjdk11="sudo alternatives --set javac java-11-openjdk.x86_64"
alias change-java-openjdk8="sudo alternatives --set java java-1.8.0-openjdk.x86_64"
alias change-javac-openjdk8="sudo alternatives --set javac java-1.8.0-openjdk.x86_64"
alias change-java-zulu11="sudo alternatives --set java /usr/lib/jvm/zulu11/bin/java"
alias change-javac-zulu11="sudo alternatives --set javac /usr/lib/jvm/zulu11/bin/javac"
alias change-java-zulu8="sudo alternatives --set java /usr/lib/jvm/zulu8/jre/bin/java"
alias change-javac-zulu8="sudo alternatives --set javac /usr/lib/jvm/zulu8/bin/javac"

### oracle jdk
alias orcljdk-version="/usr/java/current/bin/java -version"
alias orcljava="/usr/java/current/bin/java"
alias orcljar="/usr/java/current/bin/jar"
alias orcljcmd="/usr/java/current/bin/jcmd"
alias orcljps="/usr/java/current/bin/jps"
alias orcljstack="/usr/java/current/bin/jstack"
alias change-orcljdk11="ln -snf /usr/java/java-11 /usr/java/current"
alias change-orcljdk8="ln -snf /usr/java/java-1.8.0 /usr/java/current"
alias change-orcljdk7="ln -snf /usr/java/java-1.7.0 /usr/java/current"
alias change-orcljdk6="ln -snf /usr/java/java-1.6.0 /usr/java/current"
