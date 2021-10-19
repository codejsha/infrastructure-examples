######################################################################

file ${JAVA_HOME}/lib/security/cacerts
file ${JAVA_HOME}/jre/lib/security/cacerts

######################################################################

### list
### default password: changeit

keytool -list -keystore ${JAVA_HOME}/lib/security/cacerts
keytool -list -v -keystore ${JAVA_HOME}/lib/security/cacerts

keytool -list -keystore ${JAVA_HOME}/jre/lib/security/cacerts
keytool -list -v -keystore ${JAVA_HOME}/jre/lib/security/cacerts

keytool -list -alias example -keystore keystore.jks
keytool -list -v -alias example -keystore keystore.jks

######################################################################

### print cert
keytool -printcert -v -file tls.crt

######################################################################

### create empty keystore
keytool -genkey -keyalg RSA -alias example -storepass welcome1 -keypass welcome1 -keystore keystore.jks -dname "CN=Developer, OU=Department, O=Company, L=City, ST=State, C=CA"
keytool -delete -alias example -keystore keystore.jks

### create self-signed certificate
keytool -genkey -keyalg RSA -alias example -keystore keystore.jks -storepass welcome1 -validity 365 -keysize 4096 -storetype pkcs12

######################################################################

### convert and import

### convert x.509 cert and key to pkcs12 file
openssl pkcs12 -export -name test \
    -in tls.crt -inkey tls.key -out tls.p12 \
    -CAfile ca.crt -caname rootca

### convert pkcs12 file to java keystore
keytool -importkeystore -alias test \
        -srckeystore tls.p12 -srcstoretype pkcs12 -srcstorepass welcome1 \
        -destkeystore tls.jks -deststoretype pkcs12 -deststorepass welcome1 -destkeypass welcome1

keytool -importkeystore -srckeystore tls.jks -destkeystore keystore.jks -deststoretype pkcs12

######################################################################

### import cert
keytool -import -trustcacerts -alias rootca -file ca.crt -keystore keystore.jks

### delete alias
keytool -delete -alias example -keystore keystore.jks
