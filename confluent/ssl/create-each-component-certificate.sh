#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace
set -o xtrace

rm -f *.jks

COMPONENTS=("zookeeper" "kafka" "schema-registry" "kafka-connect" "kafka-rest" "ksqldb" "control-center")

for COMPONENT_NAME in ${COMPONENTS[@]}; do

    ### keystore
    openssl genrsa -out ${COMPONENT_NAME}.key 2048
    openssl req -new -sha256 -key ${COMPONENT_NAME}.key -out ${COMPONENT_NAME}.csr -config ${COMPONENT_NAME}.csr.conf
    # openssl req -in ${COMPONENT_NAME}.csr -noout -text

    openssl x509 -req -CA ca.crt -CAkey ca.key -in ${COMPONENT_NAME}.csr -out ${COMPONENT_NAME}.crt -days 365 -CAcreateserial -sha256 -extensions req_ext -extfile ${COMPONENT_NAME}.csr.conf -passin pass:mystorepassword
    # openssl x509 -in ${COMPONENT_NAME}.crt -text -noout

    cat ${COMPONENT_NAME}.crt > ${COMPONENT_NAME}-chain.crt
    cat ca.crt >> ${COMPONENT_NAME}-chain.crt

    openssl pkcs12 -export -name ${COMPONENT_NAME} \
        -in ${COMPONENT_NAME}-chain.crt -inkey ${COMPONENT_NAME}.key \
        -out ${COMPONENT_NAME}.p12 -passout pass:mystorepassword
    keytool -importkeystore -alias ${COMPONENT_NAME} \
        -srckeystore ${COMPONENT_NAME}.p12 -srcstoretype pkcs12 -srcstorepass mystorepassword \
        -destkeystore ${COMPONENT_NAME}-keystore.jks -deststoretype pkcs12 -deststorepass mystorepassword -destkeypass mystorepassword

    ### truststore
    keytool -importcert -alias RootCA -file ca.crt -storepass mystorepassword -noprompt -keystore ${COMPONENT_NAME}-truststore.jks

done

### client truststore
keytool -importcert -alias RootCA -file ca.crt -storepass mystorepassword -noprompt -keystore client-truststore.jks

### move files
mkdir -p ssl
mv *.crt *.csr *.key *.srl *.jks ssl/
