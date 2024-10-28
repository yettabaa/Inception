#!/bin/bash

mv conf/50-server.conf /etc/mysql/mariadb.conf.d/50-server.cnf

service mariadb start

mariadb -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"

mariadb -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"

mariadb -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"

mariadb -e "FLUSH PRIVILEGES;"

unset $DB_USER $DB_PASS $ADMIN_USER $ADMIN_PASSWORD $USER $USER_PASS $FTP_USER $FTP_PASSWORD

kill `cat /var/run/mysqld/mysqld.pid`

mariadbd

# %: A wildcard that allows connections from any host.
# @: Separates the username from the host specification in the user account syntax.


# MariaDB (database server) is an open-source relational database management system (RDBMS) that is a fork of MySQL.
# It is designed to be fast, scalable, and user-friendly, making it suitable for a wide range of
# applications, from small websites to large-scale enterprise systems. MariaDB supports SQL 
# (Structured Query Language) for managing data and is known for its robust performance,
# security features, and compatibility with MySQL.