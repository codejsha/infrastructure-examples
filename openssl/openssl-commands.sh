######################################################################

### install openssl

### homebrew
brew install openssl@3

### chocolatey
choco install -y openssl

######################################################################

openssl s_client -connect test.example.com:443 < /dev/null
openssl s_client -connect test.example.com:443 -tls1_2 < /dev/null

######################################################################

### display server certificate list
openssl s_client -connect test.example.com:443 -showcerts < /dev/null

openssl s_client -connect test.example.com:443 -showcerts < /dev/null | openssl x509 -noout -dates

######################################################################

openssl req -x509 -new -nodes -key ca.key -sha256 -days 1024 -out ca.crt -subj "/C=KR/ST=Seoul/CN=Example Root CA"
openssl req -newkey rsa:2048 -nodes -x509 -keyout tls.key -out tls.crt -days 365 -subj "/C=KR/ST=Seoul/CN=example.com"
openssl pkcs12 -export -in tls.crt -inkey tls.key -out tls.p12 -name "example.com" -password pass:changeit

openssl req -in tls.csr -text -noout
openssl x509 -in tls.crt -text -noout

######################################################################

### modulus
openssl rsa -noout -modulus -in tls.key
openssl req -noout -modulus -in tls.csr
openssl x509 -noout -modulus -in tls.crt

######################################################################

### create p12 file
openssl pkcs12 -export -in tls.crt -inkey tls.key -out tls.p12
openssl pkcs12 -info -in tls.p12 -passin file:tls.password.txt

### extract certificate
openssl pkcs12 -in tls.p12 -clcerts -nokeys -out tls.crt.pem
openssl pkcs12 -in tls.p12 -clcerts -nokeys -out tls.crt.pem -password pass:PASSWORD
openssl pkcs12 -in tls.p12 -clcerts -nokeys -out tls.crt.pem -passin file:tls.password.txt

### extract private key
openssl pkcs12 -in tls.p12 -nocerts -nodes -out tls.key.pem
openssl pkcs12 -in tls.p12 -nocerts -nodes -out tls.key.pem -password pass:PASSWORD
openssl pkcs12 -in tls.p12 -nocerts -nodes -out tls.key.pem -passin file:tls.password.txt
