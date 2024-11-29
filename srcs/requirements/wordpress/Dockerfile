FROM debian:bullseye

RUN apt update -y
RUN apt upgrade -y

RUN apt-get install -y	wget\
						php7.3\
						php-fpm\
						php-mysql\
						php-cli\
						mariadb-client
						
RUN mkdir -p /var/www/html
WORKDIR /var/www/html
COPY . .
						
RUN wget https://fr.wordpress.org/wordpress-6.7-fr_FR.tar.gz -P /var/www/html
RUN tar -xzf wordpress-6.7-fr_FR.tar.gz && rm wordpress-6.7-fr_FR.tar.gz
RUN chown -R www-data:www-data /var/www/html

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# RUN php wp-cli.phar --info
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp


# RUN mv /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
# RUN sed socket 
CMD [ "sh", "tools/config.sh" ]
