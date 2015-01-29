# script
#!/bin/bash
 clear

openssl genrsa -des3 -passout pass:x -out CA.pass.key 2048

openssl rsa -passin pass:x -in CA.pass.key -out CA.key
	echo -ne '\n'

rm CA.pass.key

openssl req -new -key CA.key -out CA.csr

openssl x509 -req -days 365 -in CA.csr -signkey CA.key -out CA.crt

keytool -import -file CA.crt -keystore clienttruststore




openssl genrsa -des3 -passout pass:x -out client.pass.key 2048

openssl rsa -passin pass:x -in client.pass.key -out client.key

rm client.pass.key

openssl req -new -key client.key -out client.csr

openssl ca -in client.csr -cert CA.crt -out client.crt





