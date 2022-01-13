######################################################################

openssl s_client -connect test.example.com:443 -tls1_2

######################################################################

openssl req -in tls.csr -noout -text
openssl x509 -in tls.crt -text -noout

######################################################################

### create pfx file
openssl pkcs12 -export -in /svc/certs/tls.crt -inkey /svc/certs/tls.key -out tls.pfx
openssl pkcs12 -info -in tls.pfx -passin file:tls.password.txt

### extract certificate
openssl pkcs12 -in tls.pfx -clcerts -nokeys -out tls.crt.pem
openssl pkcs12 -in tls.pfx -clcerts -nokeys -out tls.crt.pem -password pass:PASSWORD
openssl pkcs12 -in tls.pfx -clcerts -nokeys -out tls.crt.pem -passin file:tls.password.txt

### extract private key
openssl pkcs12 -in tls.pfx -nocerts -nodes -out tls.key.pem
openssl pkcs12 -in tls.pfx -nocerts -nodes -out tls.key.pem -password pass:PASSWORD
openssl pkcs12 -in tls.pfx -nocerts -nodes -out tls.key.pem -passin file:tls.password.txt
