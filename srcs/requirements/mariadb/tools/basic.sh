#!/bin/sh

# /usr/bin/mysql_install_db --datadir=/var/lib/mysql --user=root --basedir=/usr
/usr/bin/mysql_install_db --user=mysql --ldata=/var/lib/mysql
/usr/bin/mysql_upgrade --user=mysql
/usr/bin/mysqld_safe --datadir="/var/lib/mysql"
echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
mysql wordpress -u root --skip-password < /wordpress.sql
echo "CREATE USER 'wp_admin' IDENTIFIED BY 'wp_admin';" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'wp_admin'@'%' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "DROP DATABASE test" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
