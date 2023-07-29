#!/bin/sh

echo "$SSL_CERT" > /etc/nginx/ssl.crt

echo "$SSL_KEY" > /etc/nginx/ssl.key

nginx
