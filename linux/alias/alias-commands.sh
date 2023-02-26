######################################################################

watch -x bash -ic "my-alias"

######################################################################

alias killgrafana="pkill -9 --echo --count --exact grafana-server"
alias killhttpd="sudo pkill -9 --echo --count --exact httpd"
alias killjava="sudo pkill -9 --echo --count --exact java"
alias killlagexporter="pkill -9 --echo --count --exact kafka-lag-exporter"
alias killnodeexporter="pkill -9 --echo --count --exact node_exporter"
alias killprometheus="sudo pkill -9 --echo --count --exact prometheus"

alias killjboss="sudo pkill -9 --echo --count --full \"org\.jboss\.as\.standalone\""
alias killtomcat="sudo pkill -9 --echo --count --full \"org\.apache\.catalina\.startup\.Bootstrap\""
alias killweblogic="sudo pkill -9 --echo --count --full \"weblogic\.Server\""

alias killzookeeper="sudo pkill -9 --echo --count --full \"org\.apache\.zookeeper\.server\.quorum\.QuorumPeerMain\""
alias killkafka="sudo pkill -9 --echo --count --full \"kafka\.Kafka\""
alias killschemaregistry="sudo pkill -9 --echo --count --full \"io\.confluent\.kafka\.schemaregistry\.rest\.SchemaRegistryMain\""
alias killkafkaconnect="sudo pkill -9 --echo --count --full \"org\.apache\.kafka\.connect\.cli\.ConnectDistributed\""
alias killkafkarest="sudo pkill -9 --echo --count --full \"io\.confluent\.kafkarest\.KafkaRestMain\""
alias killksqldb="sudo pkill -9 --echo --count --full \"io\.confluent\.ksql\.rest\.server\.KsqlServerMain\""
alias killcontrolcenter="sudo pkill -9 --echo --count --full \"io\.confluent\.controlcenter\.ControlCenter\""
alias killconfluent="killzookeeper; killkafka; killschemaregistry; killkafkaconnect; killkafkarest; killksqldb; killcontrolcenter;"

alias psef="sudo ps -ef | grep "
alias psefhttpd="sudo ps -ef | grep httpd"
alias psefjava="sudo ps -ef | grep java"
alias psefjboss="sudo ps -ef | grep jboss"
alias psefnginx="sudo ps -ef | grep nginx"
alias pseftomcat="sudo ps -ef | grep tomcat"
alias psefweblogic="sudo ps -ef | grep weblogic"

alias pxhttpd="sudo pgrep --exact --list-full httpd | grep httpd"
alias pxdockerd="sudo pgrep --exact --list-full dockerd | grep dockerd"
alias pxdockerproxy="sudo pgrep --exact --list-full docker-proxy | grep docker-proxy"
alias pxelasticsearch="pgrep --exact --list-full java | grep elasticsearch"
alias pxfluentd="pgrep --exact --list-full ruby | grep fluentd"
alias pxgrafana="pgrep --exact --list-full grafana-server | grep grafana-server"
alias pxkibana="pgrep --exact --list-full node | grep kibana"
alias pxlagexporter="pgrep --exact --list-full java | grep kafka-lag-exporter"
alias pxnginx="sudo pgrep --exact --list-full nginx | grep nginx"
alias pxnodeexporter="pgrep --exact --list-full node_exporter | grep node_exporter"
alias pxjava="sudo pgrep --exact --list-full java | grep java"
alias pxjboss="sudo pgrep --exact --list-full java | grep jboss"
alias pxprometheus="pgrep --exact --list-full prometheus | grep prometheus"
alias pxtomcat="sudo pgrep --exact --list-full java | grep tomcat"
alias pxweblogic="sudo pgrep --exact --list-full java | grep weblogic"

alias goconfluent="cd /opt/confluent"
alias goprops="cd /opt/confluent/properties"
alias goscripts="cd /opt/confluent/scripts"
alias goconnectors="cd /opt/confluent/connect/connectors"

function goapp() { DIRECTORY="/svc/app"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY}; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
function goapm() { DIRECTORY="/svc/apm"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY}; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
function goconfluent() { DIRECTORY="/usr/local/confluent"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY}; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
function goelasticsearch() { DIRECTORY="/usr/local/elasticsearch"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY}; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
function gohadoop() { DIRECTORY="/usr/local/hadoop"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY}; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
function gohive() { DIRECTORY="/usr/local/hive"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY}; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
function gohttpd() { DIRECTORY="/etc/httpd"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY}; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
function gohttpdconf() { DIRECTORY="/etc/httpd/conf"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY}; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
function gohttpdconfd() { DIRECTORY="/etc/httpd/conf.d"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY}; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
function gohttpdconfmd() { DIRECTORY="/etc/httpd/conf.modules.d"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY}; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
function gohttpddocs() { DIRECTORY="/var/www/html"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY}; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
function gohttpdlog() { DIRECTORY="/var/log/httpd"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY}; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
function gohttpdmod() { DIRECTORY="/usr/lib64/httpd/modules"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY}; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
function gohttpdrun() { DIRECTORY="/run/httpd"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY}; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
function goinstall() { DIRECTORY="/svc/install"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY}; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
function goiplanet() { DIRECTORY="/usr/local/iplanet"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY}; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
function gojava() { DIRECTORY="/usr/lib/jvm"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY}; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
function gojboss() { DIRECTORY="/usr/local/jboss"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY}; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
function gokafka() { DIRECTORY="/usr/local/kafka"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY}; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
function gokibana() { DIRECTORY="/usr/local/kibana"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY}; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
function goldconf() { DIRECTORY="/etc/ld.so.conf.d"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY}; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
function golib() { DIRECTORY="/svc/lib"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY}; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
function golocal() { DIRECTORY="/usr/local"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY}; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
function gonginx() { DIRECTORY="/etc/nginx"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY}; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
function goohs() { DIRECTORY="/usr/local/ohs"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY}; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
function goorcljava() { DIRECTORY="/usr/java"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY}; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
function gosvc() { DIRECTORY="/svc"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY}; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
function gosvr() { DIRECTORY="/svc/server"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY}; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
function goservicesys() { DIRECTORY="/etc/systemd/system"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY}; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
function goservicepkg() { DIRECTORY="/usr/lib/systemd/system"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY}; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
function gotomcat() { DIRECTORY="/usr/local/tomcat"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY}; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
function goweblogic() { DIRECTORY="/usr/local/weblogic"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY}; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
function gowildfly() { DIRECTORY="/usr/local/wildfly"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY}; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
