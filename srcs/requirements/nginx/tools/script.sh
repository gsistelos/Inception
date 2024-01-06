#!/bin/sh

# Create certificate and key files
echo "$SSL_CERT" > /etc/nginx/ssl.crt
echo "$SSL_KEY" > /etc/nginx/ssl.key

# Start server in foreground
nginx
