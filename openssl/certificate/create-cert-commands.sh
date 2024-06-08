######################################################################

rm -rf ./certs
mkdir certs


### create certificate key
openssl genrsa -out tls.key 2048


### create csr
openssl req -new -sha256 -key tls.key -out tls.csr -config ./tls.csr.conf

### check
# openssl req -in tls.csr -noout -text


### create certificate
openssl x509 -req -in tls.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out tls.crt -days 365 -sha256 -extensions req_ext -extfile ./tls.csr.conf
### Enter pass phrase for ca.key:

### check
# openssl x509 -in tls.crt -text -noout


mv tls.crt tls.key tls.csr ./certs
