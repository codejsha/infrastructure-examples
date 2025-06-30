######################################################################

function cdtomcat() { DIRECTORY="/usr/local/tomcat"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }

######################################################################

### install tomcat

choco install -y tomcat

######################################################################

### process
pgrep -xa java | grep tomcat
ps -ef | grep tomcat
pkill -9 -ecf "org\.apache\.catalina\.startup\.Bootstrap"
