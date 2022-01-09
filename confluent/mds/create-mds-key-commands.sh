######################################################################

openssl genrsa -out tokenKeypair.pem 2048
openssl rsa -in tokenKeypair.pem -outform PEM -pubout -out public.pem
