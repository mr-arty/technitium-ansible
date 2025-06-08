#!/bin/sh
openssl pkcs12 -export -out /etc/letsencrypt/live/dns.frkn.org/dns.frkn.org.pfx -inkey /etc/letsencrypt/live/dns.frkn.org/privkey.pem -in /etc/letsencrypt/live/dns.frkn.org/cert.pem -certfile /etc/letsencrypt/live/dns.frkn.org/chain.pem -passout pass:
echo "pkcs#12 generated!"
