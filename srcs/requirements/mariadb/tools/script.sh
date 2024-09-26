#!/bin/bash

touch /etc/mysql/init.sql

echo "CREATE DATABASE $MYSQL_DATABASE ;" > /etc/mysql/init.sql
echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;" >> /etc/mysql/init.sql
echo "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' WITH GRANT OPTION ;" >> /etc/mysql/init.sql
echo "FLUSH PRIVILEGES ;" >> /etc/mysql/init.sql

mysql_install_db
mysqld
