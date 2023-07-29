FROM alpine:3.17

RUN apk update && apk add --no-cache php-fpm php-mysqli php php-phar php-json php-mbstring mariadb-client
RUN wget -O /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x /usr/local/bin/wp
RUN mkdir -p /var/www/html

COPY conf/www.conf /etc/php81/php-fpm.d

RUN wp core download --allow-root --path=/var/www/html

COPY tools/script.sh /

ENTRYPOINT ["/script.sh"]
