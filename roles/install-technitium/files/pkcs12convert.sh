#!/bin/sh
openssl pkcs12 -export -out /etc/letsencrypt/live/dns.yourdomain.com/dns.yourdomain.com.pfx -inkey /etc/letsencrypt/live/dns.yourdomain.com/privkey.pem -in /etc/letsencrypt/live/dns.yourdomain.com/cert.pem -certfile /etc/letsencrypt/live/dns.yourdomain.com/chain.pem -passout pass:
echo "pkcs#12 generated!"
