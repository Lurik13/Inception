FROM debian:bullseye

RUN apt update -y
RUN apt upgrade -y
RUN apt-get -y install wget
# RUN apt install wp -y
RUN apt install curl -y

# RUN wp plugin install user-switching --activate
RUN mkdir -p /etc/wordpress/wp
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /etc/wordpress/wp

# RUN ln -sf /dev/stdout /var/log/nginx/access.log \
#     && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 9000

# ENTRYPOINT ["echo", "salut"]
