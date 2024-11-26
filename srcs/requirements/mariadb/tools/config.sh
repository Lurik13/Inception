#!/bin/bash

set -x  

service mariadb start;
mariadb -e "CREATE DATABASE IF NOT EXISTS \`$DB_NAME\`;"
mariadb -e "CREATE USER IF NOT EXISTS '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD';"
mariadb -e "GRANT ALL PRIVILEGES ON \`$DB_NAME\`.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
mariadb -e "FLUSH PRIVILEGES;"

mariadb-admin -u root password "$DB_ROOT_PASSWORD"
mariadb-admin -u root -p"$DB_ROOT_PASSWORD" shutdown

mariadbd-safe;
