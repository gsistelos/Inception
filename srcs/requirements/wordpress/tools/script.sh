#!/bin/sh

cd /var/www/html

wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_USER_PASSWD --dbhost=mariadb
wp core install --url=gguedes.42.fr --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWD --admin_email=$WP_ADMIN_EMAIL --skip-email
wp user create $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWD --role=author

php-fpm81 -F
