#!/bin/bash
 
clear


rm *.crt
rm *.csr
rm *store
rm *.key
rm *.old

#penssl genrsa -des3 -passout pass:x -out CA.pass.key 2048
#openssl rsa -passin pass:x -in CA.pass.key -out CA.key
#rm CA.pass.key

#1
openssl genrsa -out CA.key 2048
openssl req -new -config openssl-ca.cnf -key CA.key -out CA.csr
openssl x509 -req -days 365 -in CA.csr -signkey CA.key -out CA.crt

#2
keytool -import -file CA.crt -keystore clienttruststore -alias CA


#clientcertificat
#3
keytool -genkey -alias client  -keyalg RSA -keystore clientkeystore -keysize 2048
#4
keytool -certreq -alias client -keystore clientkeystore -file clientcert.csr


#5
openssl x509 -req -in clientcert.csr -CA CA.crt -CAkey CA.key -CAcreateserial -out client.crt

#6
keytool -import -trustcacerts -file CA.crt -keystore clientkeystore -alias CAserver
keytool -import -file client.crt -keystore clientkeystore -alias client

#7
keytool -list -v -keystore clienttruststore
echo "Här ska det var en"

keytool -list -v -keystore clientkeystore
echo "Här ska det var två"

