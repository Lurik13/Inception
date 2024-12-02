FROM debian:bullseye

RUN apt update -y
RUN apt upgrade -y
RUN apt install nginx -y
RUN apt install curl -y

RUN mkdir -p /etc/nginx/ssl
RUN apt install openssl -y
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=Normandie/L=LeHavre/O=42Network/OU=42LeHavre/CN=INCEPTION/UID=lribette"
RUN mkdir -p /data/run/nginx
RUN mkdir -p /var/www/wordpress
RUN mkdir /data/images

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY tools/cv.html /var/www/wordpress/index.html

RUN chmod -R 777 /var/www/wordpress
RUN chown -R www-data:www-data /var/www/wordpress

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
