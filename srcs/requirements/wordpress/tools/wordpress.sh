#!/bin/sh
cd /var/www/html
wget https://wordpress.org/latest.tar.gz
tar xfz latest.tar.gz
rm -rf wp-admin wp-content wp-includes
mv wordpress/* .
rm -f latest.tar.gz
rm -rf wordpress
cp wp-config-sample.php wp-config.php
sed -i "s/database_name_here/$MYSQL_DATABASE/" wp-config.php
sed -i "s/username_here/$MYSQL_USER/" wp-config.php
sed -i "s/localhost/$MYSQL_HOSTNAME/" wp-config.php
sed -i "s/password_here/$MYSQL_PASSWORD/" wp-config.php
sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
exec php-fpm7.3 -F