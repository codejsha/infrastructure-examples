######################################################################

### security debug

### key and certificate
keytool -list -v -keystore keystore.jks
keytool -list -v -keystore truststore.jks

### root logger
log4j.rootLogger=INFO, stdout
log4j.rootLogger=DEBUG, stdout

### authorization logging
log4j.logger.kafka.authorizer.logger=DEBUG, authorizerAppender

### ssl debug
-Djavax.net.debug=all
export KAFKA_OPTS="${KAFKA_OPTS} -Djavax.net.debug=all"

### gssapi debug
-Dsun.security.krb5.debug=true
export KAFKA_OPTS="${KAFKA_OPTS} -Dsun.security.krb5.debug=true"
