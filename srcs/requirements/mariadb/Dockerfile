FROM alpine:3.17

RUN apk update && apk add --no-cache mariadb
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql
RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld

COPY conf/mariadb-server.cnf /etc/my.cnf.d
COPY tools/script.sh /

ENTRYPOINT ["/script.sh"]
