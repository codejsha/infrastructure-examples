######################################################################

mkdir certs
cd certs

### create root key

openssl genrsa -des3 -out ca.key 4096
### Enter pass phrase for ca.key:
### Verifying - Enter pass phrase for ca.key:


### create and self sign the root certificate

openssl req -x509 -new -nodes -key ca.key -sha256 -days 1024 -out ca.crt -subj "/C=KR/ST=Seoul/CN=Example Root CA"
### Enter pass phrase for ca.key:
