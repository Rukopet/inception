FROM	alpine:3.12

EXPOSE	5050

RUN		apk update && apk upgrade
RUN		apk add openssl wget supervisor php7 php7-fpm php7-cgi fcgi php7-mysqli php7-mbstring php7-json php7-session

#for wp omfg when wp start work
#RUN apk add php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom

RUN		wget https://wordpress.org/latest.tar.gz
RUN		tar -zxvf latest.tar.gz
RUN		rm -f latest.tar.gz
COPY    wp-config.php /wordpress/
RUN     mv /wordpress /var/www/

CMD		sh -c "/usr/sbin/php-fpm7 --nodaemonize"