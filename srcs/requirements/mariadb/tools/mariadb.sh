#!/bin/bash

mv conf/50-server.conf /etc/mysql/mariadb.conf.d/50-server.cnf

service mariadb start

mariadb -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mariadb -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"
mariadb -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"
mariadb -e "FLUSH PRIVILEGES;"

kill `cat /var/run/mysqld/mysqld.pid`

mariadbd

# %: A wildcard that allows connections from any host.
# @: Separates the username from the host specification in the user account syntax.
