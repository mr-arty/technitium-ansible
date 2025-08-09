#!/bin/sh
openssl pkcs12 -export -out /etc/letsencrypt/live/dns.frdm.app/dns.frdm.app.pfx -inkey /etc/letsencrypt/live/dns.frdm.app/key.pem -in /etc/letsencrypt/live/dns.frdm.app/cert.pem -certfile /etc/letsencrypt/live/dns.frdm.app/chain.pem -passout pass:
echo "pkcs#12 generated!"
