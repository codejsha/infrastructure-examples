#!/usr/bin/bash

### requirements
# tidy package: yum install -y tidy

### usage
# ./create-instance.sh ${INSTANCE_NAME} ${HTTP_PORT} ${HTTPS_PORT} ${SHUTDOWN_PORT}
#
# example:
# ./create-instance.sh inst1 8080 8443 8005
# ./create-instance.sh inst2 8081 8444 8006

######################################################################

### define variables
INSTANCE_NAME="${1:-inst1}"
# JAVA_HOME="/usr/lib/jvm/java-1.8.0"
JAVA_HOME="/usr/lib/jvm/java-11"
CATALINA_HOME="/usr/local/tomcat"
CATALINA_BASE="${CATALINA_HOME}/instances/${INSTANCE_NAME}"
JVM_ROUTE="${INSTANCE_NAME}"
APP_BASE="webapps"
DOC_BASE=""

TOMCAT_PORT_HTTP="${2:-8080}"
TOMCAT_PORT_HTTPS="${3:-8443}"
TOMCAT_PORT_SHUTDOWN="${4:-8005}"

LOG_HOME="\${CATALINA_BASE}/logs"
DUMP_LOG_DIR="\${LOG_HOME}/dump"
CATALINA_OUT="\${LOG_HOME}/catalina_\${INSTANCE_NAME}.out"
GC_LOG_OUT="\${LOG_HOME}/\${INSTANCE_NAME}_gc.log"

######################################################################

### tidy function
function tidyindent {
    XML_FILE="${1}"
    tidy -modify \
        --indent auto --indent-spaces 4 --indent-attributes true \
        --input-xml true --output-xml true \
        --hide-comments true --quote-nbsp false \
        --quiet true --wrap 80 \
        ${XML_FILE}
}

function tidynowrap {
    XML_FILE="${1}"
    tidy -modify \
        --indent auto --indent-spaces 4 --indent-attributes false \
        --input-xml true --output-xml true \
        --hide-comments true --quote-nbsp false \
        --quiet true --wrap 0 \
        ${XML_FILE}
}

### set variables
JAVA_VERSION="$(${JAVA_HOME}/bin/java -version 2>&1 /dev/null \
    | grep version | awk '{print $3}' | tr -d '"')"

######################################################################

### create catalina base
mkdir -p ${CATALINA_BASE}
/usr/bin/cp -rpf ${CATALINA_HOME}/conf ${CATALINA_BASE}
/usr/bin/cp -rpf ${CATALINA_HOME}/lib ${CATALINA_BASE}
/usr/bin/cp -rpf ${CATALINA_HOME}/temp ${CATALINA_BASE}
/usr/bin/cp -rpf ${CATALINA_HOME}/work ${CATALINA_BASE}
mkdir -p ${CATALINA_BASE}/webapps/ROOT
mkdir -p "$(eval echo ${LOG_HOME})"
mkdir -p "$(eval echo $(eval echo ${DUMP_LOG_DIR}))"
mv ${CATALINA_BASE}/conf/server.xml ${CATALINA_BASE}/conf/server.xml_default
mv ${CATALINA_BASE}/conf/context.xml ${CATALINA_BASE}/conf/context.xml_default

######################################################################

### create server.xml
cat > ${CATALINA_BASE}/conf/server.xml <<EOF
<?xml version="1.0" encoding="utf-8"?>
<Server port="${TOMCAT_PORT_SHUTDOWN}"
        shutdown="SHUTDOWN">
    <Listener className="org.apache.catalina.startup.VersionLoggerListener" />
    <Listener className="org.apache.catalina.core.AprLifecycleListener"
              SSLEngine="on" />
    <Listener className="org.apache.catalina.core.JreMemoryLeakPreventionListener" />
    <Listener className="org.apache.catalina.mbeans.GlobalResourcesLifecycleListener" />
    <Listener className="org.apache.catalina.core.ThreadLocalLeakPreventionListener" />
    <GlobalNamingResources>
        <Resource name="UserDatabase"
                  auth="Container"
                  type="org.apache.catalina.UserDatabase"
                  description="User database that can be updated and saved"
                  factory="org.apache.catalina.users.MemoryUserDatabaseFactory"
                  pathname="conf/tomcat-users.xml" />
    </GlobalNamingResources>
    <Service name="Catalina">
        <Connector port="${TOMCAT_PORT_HTTP}"
                   protocol="HTTP/1.1"
                   connectionTimeout="20000"
                   redirectPort="${TOMCAT_PORT_HTTPS}" />
        <Engine name="Catalina"
                defaultHost="localhost"
                jvmRoute="${JVM_ROUTE}">
            <Realm className="org.apache.catalina.realm.LockOutRealm">
                <Realm className="org.apache.catalina.realm.UserDatabaseRealm"
                       resourceName="UserDatabase" />
            </Realm>
            <Host name="localhost"
                  appBase="${APP_BASE}"
                  unpackWARs="true"
                  autoDeploy="true">
                <Valve className="org.apache.catalina.valves.AccessLogValve"
                       directory="logs"
                       prefix="localhost_access_log"
                       suffix=".txt"
                       pattern="%h %l %u %t &quot;%r&quot; %s %b" />
            </Host>
        </Engine>
    </Service>
</Server>
EOF

######################################################################

### create context.xml
cat > ${CATALINA_BASE}/conf/context.xml <<EOF
<?xml version="1.0" encoding="utf-8"?>
<Context>
    <WatchedResource>WEB-INF/web.xml</WatchedResource>
    <WatchedResource>WEB-INF/tomcat-web.xml</WatchedResource>
    <WatchedResource>\${catalina.base}/conf/web.xml</WatchedResource>
</Context>
EOF

######################################################################

### create start script
cat > ${CATALINA_BASE}/start-${INSTANCE_NAME}.sh <<EOF
#!/usr/bin/bash

INSTANCE_NAME="${INSTANCE_NAME}"
export JAVA_HOME="${JAVA_HOME}"
export CATALINA_HOME="${CATALINA_HOME}"
export CATALINA_BASE="${CATALINA_BASE}"

LOG_HOME="${LOG_HOME}"
CATALINA_OUT="${CATALINA_OUT}"
export CATALINA_OUT

EOF

if [[ ${JAVA_VERSION} =~ ^1.8 ]]; then
cat >> ${CATALINA_BASE}/start-${INSTANCE_NAME}.sh <<EOF
CATALINA_OPTS="\${CATALINA_OPTS} -Xms1024m -Xmx1024m"
CATALINA_OPTS="\${CATALINA_OPTS} -Xloggc:${GC_LOG_OUT}"
CATALINA_OPTS="\${CATALINA_OPTS} -XX:+PrintGCDetails"
CATALINA_OPTS="\${CATALINA_OPTS} -XX:+PrintTenuringDistribution"
CATALINA_OPTS="\${CATALINA_OPTS} -XX:+PrintGCDateStamps"
CATALINA_OPTS="\${CATALINA_OPTS} -XX:+PrintGCTimeStamps"
CATALINA_OPTS="\${CATALINA_OPTS} -XX:+HeapDumpOnOutOfMemoryError"
CATALINA_OPTS="\${CATALINA_OPTS} -XX:HeapDumpPath=${DUMP_LOG_DIR}"
# CATALINA_OPTS="\${CATALINA_OPTS} -XX:+PrintFlagsFinal"
# CATALINA_OPTS="\${CATALINA_OPTS} -verbose:class"
# CATALINA_OPTS="\${CATALINA_OPTS} -verbose:module"
# CATALINA_OPTS="\${CATALINA_OPTS} -verbose:jni"
export CATALINA_OPTS
EOF
elif [[ ${JAVA_VERSION} =~ ^11 ]]; then
cat >> ${CATALINA_BASE}/start-${INSTANCE_NAME}.sh <<EOF
CATALINA_OPTS="\${CATALINA_OPTS} -Xms1024m -Xmx1024m"
CATALINA_OPTS="\${CATALINA_OPTS} -Xlog:gc*=info:file=${GC_LOG_OUT}"
CATALINA_OPTS="\${CATALINA_OPTS} -XX:+HeapDumpOnOutOfMemoryError"
CATALINA_OPTS="\${CATALINA_OPTS} -XX:HeapDumpPath=${DUMP_LOG_DIR}"
# CATALINA_OPTS="\${CATALINA_OPTS} -XX:+PrintFlagsFinal"
# CATALINA_OPTS="\${CATALINA_OPTS} -Xlog:class+load=info,class+unload=info:stdout:time,level,tags"
# CATALINA_OPTS="\${CATALINA_OPTS} -Xlog:module*=info:stdout:time,level,tags"
# CATALINA_OPTS="\${CATALINA_OPTS} -verbose:jni"
export CATALINA_OPTS
EOF
fi

cat >> ${CATALINA_BASE}/start-${INSTANCE_NAME}.sh <<EOF

touch \${CATALINA_OUT}
\${CATALINA_HOME}/bin/catalina.sh start
if [ "\${1}" != "notail" ]; then
    tail -f ${CATALINA_OUT}
fi
EOF

######################################################################

### create stop script
cat > ${CATALINA_BASE}/stop-${INSTANCE_NAME}.sh <<EOF
#!/usr/bin/bash

INSTANCE_NAME="${INSTANCE_NAME}"
export JAVA_HOME="${JAVA_HOME}"
export CATALINA_HOME="${CATALINA_HOME}"
export CATALINA_BASE="${CATALINA_BASE}"

\${CATALINA_HOME}/bin/catalina.sh stop
EOF

######################################################################

### format xml
tidyindent ${CATALINA_BASE}/conf/server.xml
tidyindent ${CATALINA_BASE}/conf/context.xml
# tidynowrap ${CATALINA_BASE}/conf/server.xml
# tidynowrap ${CATALINA_BASE}/conf/context.xml

### change permission
chmod 600 ${CATALINA_BASE}/conf/server.xml
chmod 750 ${CATALINA_BASE}/start-${INSTANCE_NAME}.sh
chmod 750 ${CATALINA_BASE}/stop-${INSTANCE_NAME}.sh

### create symbolic link
ln -snf ${CATALINA_BASE}/start-${INSTANCE_NAME}.sh \
    ${CATALINA_HOME}/instances/start-${INSTANCE_NAME}.sh
ln -snf ${CATALINA_BASE}/stop-${INSTANCE_NAME}.sh \
    ${CATALINA_HOME}/instances/stop-${INSTANCE_NAME}.sh

echo "An instance (${INSTANCE_NAME}) is created."
