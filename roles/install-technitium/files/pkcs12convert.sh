#!/bin/sh
HOSTNAME=$1

openssl pkcs12 -export -out /etc/letsencrypt/live/$HOSTNAME/$HOSTNAME.pfx -inkey /etc/letsencrypt/live/$HOSTNAME/key.pem -in /etc/letsencrypt/live/$HOSTNAME/cert.pem -certfile /etc/letsencrypt/live/$HOSTNAME/chain.pem -passout pass:
echo "pkcs#12 generated!"
