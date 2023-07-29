FROM alpine:3.17

RUN apk add --no-cache nginx

COPY conf/nginx.conf /etc/nginx
COPY tools/script.sh  /

ENTRYPOINT ["/script.sh"]
