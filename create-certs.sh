#!/bin/bash
# Script to create certificate for icecast server
# Saulo Madalozzo <saulo.zz@gmail.com>, dec 2024
# Usage: ./create-certs.sh or add to crontab (adjust path):
# 45 4 * * 2 /home/ubuntu/icecast/create-certs.sh > /home/ubuntu/icecast/create-certs.log 2>&1

date

# domains to create certificates
DOMAIN=yourdomain.com

# create certificate
docker run --rm --name certbot -p 80:80 -v "/home/ubuntu/icecast/certs:/etc/letsencrypt" certbot/certbot certonly --standalone --domain "$DOMAIN" --text --verbose  --preferred-challenges=http --agree-tos -n

sudo chmod -R 755 /home/ubuntu/icecast/certs/

cat certs/live/yourdomain.com/fullchain.pem certs/live/yourdomain.com/privkey.pem > icecast.pem
chmod 666 icecast.pem

