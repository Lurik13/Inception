#!/bin/bash

if [ ! -f "/var/www/wordpress/wp-config.php" ] 
then
    echo "\e[38;2;0;120;200mConfiguring WordPress...\e[0m"

    wp core download --allow-root --path='/var/www/wordpress' --locale=fr_FR

    wp config create --allow-root \
                                    --dbname=$DB_NAME \
                                    --dbuser=$DB_USER \
                                    --dbpass=$DB_PASSWORD \
                                    --dbhost=$DB_HOST

    wp core install --allow-root \
                    --url=$WP_URL \
                    --title=$WP_TITLE \
                    --admin_user=$WP_ADMIN_USER \
                    --admin_password=$WP_ADMIN_PASSWORD \
                    --admin_email=$WP_ADMIN_EMAIL \
                    --skip-email

    wp user create  $WP_USER_LOGIN \
                    $WP_USER_EMAIL \
                    --role=subscriber \
                    --user_pass=$WP_USER_PASSWORD \
                    --allow-root
    
    chown -R www-data:www-data .

else
    echo "\e[38;2;120;200;0mWordPress is already configured.\e[0m"
fi

exec /usr/sbin/php-fpm7.4 -F
