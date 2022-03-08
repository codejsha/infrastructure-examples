######################################################################

openssl s_client -connect test.example.com:443 < /dev/null
openssl s_client -connect test.example.com:443 -tls1_2 < /dev/null

######################################################################

### display server certificate list
openssl s_client -connect test.example.com:443 -showcerts < /dev/null

openssl s_client -connect test.example.com:443 -showcerts < /dev/null | openssl x509 -noout -dates

######################################################################

openssl req -in tls.csr -noout -text
openssl x509 -in tls.crt -text -noout

######################################################################

### modulus
openssl rsa -noout -modulus -in tls.key
openssl req -noout -modulus -in tls.csr
openssl x509 -noout -modulus -in tls.crt

######################################################################

### create pfx file
openssl pkcs12 -export -in tls.crt -inkey tls.key -out tls.pfx
openssl pkcs12 -info -in tls.pfx -passin file:tls.password.txt

### extract certificate
openssl pkcs12 -in tls.pfx -clcerts -nokeys -out tls.crt.pem
openssl pkcs12 -in tls.pfx -clcerts -nokeys -out tls.crt.pem -password pass:PASSWORD
openssl pkcs12 -in tls.pfx -clcerts -nokeys -out tls.crt.pem -passin file:tls.password.txt

### extract private key
openssl pkcs12 -in tls.pfx -nocerts -nodes -out tls.key.pem
openssl pkcs12 -in tls.pfx -nocerts -nodes -out tls.key.pem -password pass:PASSWORD
openssl pkcs12 -in tls.pfx -nocerts -nodes -out tls.key.pem -passin file:tls.password.txt
