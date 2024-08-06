FROM debian:bullseye

RUN apt update -y
RUN apt upgrade -y
RUN apt-get install mariadb-server -y
RUN apt-get install procps -y

COPY conf/mariadb.cnf /etc/mysql/mariadb.conf.d/mariadb.cnf
COPY tools/config.sh /app/config.sh
RUN chmod +x /app/config.sh

EXPOSE 3306

ENTRYPOINT ["sh", "-c", "/app/config.sh"]