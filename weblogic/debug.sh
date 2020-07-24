### verbose
JAVA_OPTIONS="${JAVA_OPTIONS} -verbose:class"
JAVA_OPTIONS="${JAVA_OPTIONS} -verbose:gc"
JAVA_OPTIONS="${JAVA_OPTIONS} -verbose:jni"

######################################################################

### debug
JAVA_OPTIONS="${JAVA_OPTIONS} -Dweblogic.log.StdoutSeverity=Debug"

### debug all
JAVA_OPTIONS="${JAVA_OPTIONS} -Dweblogic.log.StdoutSeverity=Debug"
JAVA_OPTIONS="${JAVA_OPTIONS} -Dweblogic.log.LogSeverity=Debug"
JAVA_OPTIONS="${JAVA_OPTIONS} -Dweblogic.log.LoggerSeverity=Debug"
JAVA_OPTIONS="${JAVA_OPTIONS} -Dweblogic.StdoutDebugEnabled=true"

######################################################################

### ssl debug
JAVA_OPTIONS="${JAVA_OPTIONS} -Djavax.net.debug=all"
JAVA_OPTIONS="${JAVA_OPTIONS} -Dssl.debug=true"
JAVA_OPTIONS="${JAVA_OPTIONS} -Dweblogic.StdoutDebugEnabled=true"

######################################################################

### jta debug
JAVA_OPTIONS="${JAVA_OPTIONS} -Dweblogic.debug.DebugJTA2PC=true"
JAVA_OPTIONS="${JAVA_OPTIONS} -Dweblogic.debug.DebugJTAXA=true"
JAVA_OPTIONS="${JAVA_OPTIONS} -Dweblogic.debug.DebugJTAJDBC=true"
### JDBCXADebugLevel=20  # connection pool properties

JAVA_OPTIONS="${JAVA_OPTIONS} -Dweblogic.debug.DebugJTANonXA=true"
JAVA_OPTIONS="${JAVA_OPTIONS} -Dweblogic.debug.DebugJTAJDBC=true"
### JDBCXADebugLevel=20  # connection pool properties

######################################################################

### jdbc debug
EXT_PRE_CLASSPATH="${EXT_PRE_CLASSPATH}:jdbc_g.jar"
JAVA_OPTIONS="${JAVA_OPTIONS} -Doracle.jdbc.Trace=true"
JAVA_OPTIONS="${JAVA_OPTIONS} -Djava.util.logging.config.file=${DOMAIN_HOME}/OracleLog.properties"
# JAVA_OPTIONS="${JAVA_OPTIONS} -Doracle.jdbc.LogFile=${LOG_HOME}/jdbc.log"

cat > ${DOMAIN_HOME}/OracleLog.properties <<EOF
# handlers=java.util.logging.ConsoleHandler
# java.util.logging.ConsoleHandler.level=ALL
# java.util.logging.ConsoleHandler.formatter=java.util.logging.SimpleFormatter

handlers=java.util.logging.FileHandler
java.util.logging.FileHandler.level=ALL
java.util.logging.FileHandler.pattern=jdbc%g.log
java.util.logging.FileHandler.count=10000
java.util.logging.FileHandler.formatter=java.util.logging.SimpleFormatter

oracle.jdbc.connector.level=FINEST
oracle.jdbc.driver.level=FINEST
oracle.jdbc.internal.level=FINEST
oracle.jdbc.oci.level=FINEST
oracle.jdbc.oracore.level=FINEST
oracle.jdbc.pool.level=FINEST
oracle.jdbc.rowset.level=FINEST
oracle.jdbc.util.level=FINEST
oracle.jdbc.xa.level=FINEST
oracle.jdbc.xa.client.level=FINEST
oracle.jpub.level=FINEST
oracle.net.level=FINEST
oracle.sql.level=FINEST
oracle.sql.converter.level=FINEST
EOF
