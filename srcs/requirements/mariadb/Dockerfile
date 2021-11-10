FROM alpine:3.12


RUN mkdir /run/mysqld
RUN apk update && apk upgrade && \
    apk add mariadb mariadb-common mariadb-client

COPY ./tools/my.cnf /etc/mysql/my.cnf
RUN chmod 0444 /etc/mysql/my.cnf

##  Тоже различные настройки
#COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
#RUN chmod 777 etc/mysql/mariadb.conf.d/50-server.cnf

# Скрипт потом для запуска
COPY ./tools/basic.sh /bin/basic.sh
COPY ./tools/wordpress.sql /
EXPOSE 3306

#RUN chmod +x    ./db.sh

CMD sh /bin/basic.sh

