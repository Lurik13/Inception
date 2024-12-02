FROM debian:bullseye

RUN apt-get update -y &&\
	apt-get upgrade -y &&\
	apt-get install -y	wget\
						php7.4\
						php-fpm\
						php-mysql\
						php-cli\
						mariadb-client

RUN mkdir -p /run/php

RUN mkdir -p /var/www/wordpress &&\
	chown -R www-data:www-data /var/www/wordpress
WORKDIR /var/www/wordpress
						
# RUN wget https://fr.wordpress.org/wordpress-6.7-fr_FR.tar.gz
# RUN tar -xzf wordpress-6.7-fr_FR.tar.gz && rm wordpress-6.7-fr_FR.tar.gz


RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp &&\
	chmod +x /usr/local/bin/wp

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY tools/config.sh /config.sh
RUN chmod +x /config.sh

# RUN mv /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
# RUN sed socket
EXPOSE 9000
ENTRYPOINT [ "sh", "/config.sh" ]
# CMD [ "/usr/sbin/php-fpm7.4", "-F" ]
