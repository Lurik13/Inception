#!/bin/bash

if [ ! -f "/var/www/html/wp-config.php"]; then
    echo "\e[38;2;0;120;200mConfiguring WordPress...\e[0m"
else
    echo "\e[38;2;120;200;0mWordPress is already configured.\e[0m"
fi

# wp config
# wp core
# wp user
# wp options

    wp core download --allow-root --path='/var/www/html' --locale=fr_FR

    wp config create --allow-root \
                                    --dbname=$DB_NAME \
                                    --dbuser=$DB_USER \
                                    --dbpass=$DB_PASSWORD \
                                    --dbhost=$DB_HOST \
                                    --path='/var/www/html'

    wp core install --allow-root \
                    --url=$WP_URL \
                    --title=$WP_TITLE \
                    --admin_user=$WP_ADMIN_USER \
                    --admin_password=$WP_ADMIN_PASSWORD \
                    --admin_email=$WP_ADMIN_EMAIL

echo "\e[48;2;0;0;0m------------------------------------\e[0m"
wp --info
echo "\e[48;2;200;0;0m------------------------------------\e[0m"
cd /var/www ; ls *
