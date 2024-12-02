#!/bin/bash

if [ ! -f "/var/www/wordpress/wp-config.php" ] 
then
    # rm /etc/php/7.4/fpm/pool.d/www.conf
    # service php7.4-fpm start
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
    chown -R www-data:www-data .
    # wp package install curl --allow-root
    # wp package install dom --allow-root
    # wp package install imagick --allow-root
    # wp package install zip --allow-root
    # wp package install gd --allow-root
    # wp package install intl --allow-root
else
    echo "\e[38;2;120;200;0mWordPress is already configured.\e[0m"
fi

# echo "\e[38;2;255;120;200mphp-fpm en-dessous:\e[0m"
# service php7.4-fpm status
# systemctl status php7.4-fpm
# echo "\e[38;2;255;120;200mphp-fpm au-dessus:\e[0m"
# while true ; do echo "" ; done
# exec "$@"
exec /usr/sbin/php-fpm7.4 -F











# wp config
# wp core
# wp user
# wp options
