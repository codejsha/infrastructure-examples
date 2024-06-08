######################################################################

./hive --service metastore --hiveconf hive.root.logger=INFO,console
./hive --service hiveserver2 --hiveconf hive.root.logger=INFO,console

### beeline
./beeline  -u jdbc:hive2://192.168.200.11:10000/default -n root -p Welcome12#
