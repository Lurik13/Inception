FROM debian:bullseye

RUN apt update -y
RUN apt upgrade -y
RUN apt install nginx -y
RUN apt install curl -y

RUN mkdir -p /etc/nginx/ssl
RUN apt install openssl -y
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=Normandie/L=LeHavre/O=42Network/OU=42LeHavre/CN=INCEPTION/UID=lribette"
RUN mkdir -p /run/nginx
RUN mkdir -p /var/www/wordpress
RUN mkdir -p /data/images

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod -R 755 /var/www/wordpress
RUN chown -R www-data:www-data /var/www/wordpress

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
