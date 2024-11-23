######################################################################

### process
sudo pgrep -xa java | grep tomcat
sudo ps -ef | grep tomcat
sudo pkill -9 -ecf "org\.apache\.catalina\.startup\.Bootstrap"

######################################################################

function cdtomcat() { DIRECTORY="/usr/local/tomcat"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }

######################################################################
