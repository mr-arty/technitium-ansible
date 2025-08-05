server {
    listen 80;

    server_name _;

    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;

    server_name dns.frdm.app;
    ssl_certificate certs/dns.frdm.app.crt;
    ssl_certificate_key certs/dns.frdm.app.key;

    location /dns-query {
        proxy_pass       http://dns-server-1:80;
        proxy_set_header Host              $host;
        proxy_set_header X-Real-IP         $remote_addr;
        proxy_set_header X-Forwarded-For   $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_http_version 1.1;

        proxy_set_header Upgrade           $http_upgrade;
        proxy_set_header Connection        "";
    }
}
