#!/bin/bash

# set -x

mariadbd-safe &
sleep 1
while ! mariadb-check --all-databases
do 
    sleep 1
done

mariadb --execute "CREATE DATABASE IF NOT EXISTS \`$DB_NAME\`;"
mariadb --execute "CREATE USER IF NOT EXISTS '$DB_USER'@'wordpress.Inception' IDENTIFIED BY '$DB_PASSWORD';"
mariadb --execute "GRANT ALL PRIVILEGES ON \`$DB_NAME\`.* TO '$DB_USER'@'wordpress.Inception' IDENTIFIED BY '$DB_PASSWORD';"
# Reload the privilege tables to apply changes
mariadb --execute "FLUSH PRIVILEGES;"

mariadb-admin -u root password "$DB_ROOT_PASSWORD"
mariadb-admin -u root -p"$DB_ROOT_PASSWORD" shutdown

exec mariadbd-safe
