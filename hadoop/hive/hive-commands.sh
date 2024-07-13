######################################################################

function cdhive() { DIRECTORY="/usr/local/hive"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }

######################################################################

./hive --service metastore --hiveconf hive.root.logger=INFO,console
./hive --service hiveserver2 --hiveconf hive.root.logger=INFO,console

### beeline
./beeline  -u jdbc:hive2://192.168.200.11:10000/default -n root -p Welcome12#
