######################################################################

openssl genrsa -out tokenKeyPair.pem 2048
openssl rsa -in tokenKeyPair.pem -outform PEM -pubout -out public.pem
