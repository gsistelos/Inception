#!/bin/sh

if [ ! -f "/init.sql" ]
then

# Create /init.sql
echo "CREATE DATABASE $DB_NAME;
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWD';
FLUSH PRIVILEGES;" > /init.sql

fi

# Start server in foreground
mysqld --user=mysql --init-file=/init.sql
