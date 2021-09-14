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

### create empty keystore
keytool -genkey -keyalg RSA -alias example -storepass changeit -keypass changeit -keystore keystore.jks -dname "CN=Developer, OU=Department, O=Company, L=City, ST=State, C=CA"
keytool -delete -alias example -keystore keystore.jks

### create self-signed certificate
keytool -genkey -keyalg RSA -alias example -keystore keystore.jks -storepass changeit -validity 365 -keysize 4096 -storetype pkcs12

######################################################################

### import cert
keytool -import -trustcacerts -alias example -file example.com.crt -keystore keystore.jks
keytool -import -trustcacerts -alias rootca -file rootca.crt -keystore keystore.jks
keytool -import -trustcacerts -alias test -file test.example.com.crt -keystore keystore.jks

######################################################################

### print cert
keytool -printcert -v -file example.com.crt

######################################################################

### delete alias
keytool -delete -alias example -keystore keystore.jks
