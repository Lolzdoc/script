#!/bin/bash
 
clear


#openssl genrsa -des3 -passout pass:x -out CA.pass.key 2048
#openssl rsa -passin pass:x -in CA.pass.key -out CA.key
#rm CA.pass.key

#rm *.crt
#rm *.csr
#rm *store
rm *.key
rm *.old

#1
openssl genrsa -out CA.key 2048
#2
#openssl req -new -config openssl-ca.cnf -key CA.key -out CA.csr
#3
#openssl x509 -req -days 365 -in CA.csr -signkey CA.key -out CA.crt
#4
#keytool -import -file CA.crt -keystore clienttruststore


#clientcertificat
#5
#keytool -genkey -alias client  -keyalg RSA -keystore clientkeystore -keysize 2048

#keytool -certreq -alias client -keystore clientkeystore -file clientcert.csr

openssl rsa -in CA.key -out newCA.pem

openssl x509 -req -in clientcert.csr -CAkey newCA.pem -out client.crt

#keytool -import -file client.crt -keystore clientkeystore





#keytool -certreq -alias Dat12hri -keystore clientkeystore -file mydomain.csr


#openssl genrsa -des3 -passout pass:x -out client.pass.key 2048

#openssl rsa -passin pass:x -in client.pass.key -out client.key

#rm client.pass.key

#openssl req -new -config openssl-client.cnf -key client.key -out client.csr
#echo "AAAAAAAAAAAAAAAAAAAAAAAAAAAAATTTTTTTTTTTTTTTTTTTTT"
#touch index.txt
#echo '01' > serial.txt
#openssl ca -config openssl-ca.cnf -policy signing_policy -extensions signing_req -in client.csr -cert CA.crt -out client.crt


#keytool -import -file client.crt -keystore clientkeystore



