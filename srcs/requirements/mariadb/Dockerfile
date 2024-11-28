FROM debian:bullseye

RUN apt update -y
RUN apt upgrade -y
RUN apt-get install -y mariadb-server mariadb-client

COPY conf/mariadb.cnf /etc/mysql/mariadb.conf.d/mariadb.cnf
COPY tools/config.sh /config.sh

RUN chmod +x /config.sh
RUN chown -R mysql:mysql /var/lib/mysql
RUN mariadb-install-db

EXPOSE 3306

ENTRYPOINT ["/config.sh"]
