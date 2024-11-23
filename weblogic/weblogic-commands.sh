######################################################################

### process
sudo pgrep -xa java | grep weblogic
sudo ps -ef | grep weblogic
sudo pkill -9 -ecf "weblogic\.Server"

######################################################################

function cdweblogic() { DIRECTORY="/usr/local/weblogic"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }

######################################################################
