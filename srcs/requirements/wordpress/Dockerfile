FROM debian:bullseye

RUN apt update -y
RUN apt upgrade -y

RUN apt-get install -y	wget\
						php7.4\
						php-fpm\
						php-mysql\
						php-cli\
						mariadb-client sudo systemctl

RUN mkdir -p /run/php
RUN chown www-data:www-data /run/php
# RUN rm /etc/php/7.4/fpm/pool.d/www.conf
# RUN systemctl restart php7.4-fpm.service
# RUN systemctl enable php7.4-fpm.service

RUN mkdir -p /var/www/html
WORKDIR /var/www/html
COPY . .
						
RUN wget https://fr.wordpress.org/wordpress-6.7-fr_FR.tar.gz -P /var/www/html
RUN tar -xzf wordpress-6.7-fr_FR.tar.gz && rm wordpress-6.7-fr_FR.tar.gz
RUN chown -R www-data:www-data /var/www/html

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN rm /etc/php/7.4/fpm/pool.d/www.conf
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
RUN groupadd nobody
EXPOSE 9000

# RUN mv /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
# RUN sed socket 
ENTRYPOINT [ "sh", "tools/config.sh" ]
CMD [ "/usr/sbin/php-fpm7.4", "-F" ]
