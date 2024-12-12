FROM debian:bullseye

RUN apt-get update -y &&\
	apt-get upgrade -y &&\
	apt-get install -y	wget\
						php7.4\
						php7.4-fpm\
						php7.4-mysql\
						php7.4-cli\
						mariadb-client\
						php7.4-curl\
						php7.4-dom\
						php7.4-imagick\
						php7.4-mbstring\
						php7.4-zip\
						php7.4-gd\
						php7.4-intl

RUN mkdir -p /run/php

RUN mkdir -p /var/www/wordpress &&\
	chown -R www-data:www-data /var/www/wordpress
WORKDIR /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp &&\
	chmod +x /usr/local/bin/wp

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY tools/config.sh /config.sh
RUN chmod +x /config.sh

EXPOSE 9000
ENTRYPOINT [ "sh", "/config.sh" ]
