#!/bin/sh
cd /var/www/html

if [ -d "wp-content" ] && [ -f "wp-config.php" ]; then
  echo "WordPress zaten kurulmuş."
  exit 0
fi

wget https://wordpress.org/latest.tar.gz
tar xzf latest.tar.gz
mv wordpress/* .
rm -rf latest.tar.gz
rm -rf wordpress

sed -i "s/database_name_here/$MYSQL_DATABASE/" wp-config-sample.php
sed -i "s/username_here/$MYSQL_USER/"  wp-config-sample.php
sed -i "s/localhost/$MYSQL_HOSTNAME/"  wp-config-sample.php
sed -i "s/password_here/$MYSQL_PASSWORD/"  wp-config-sample.php
cp wp-config-sample.php wp-config.php

exec php-fpm7.3 -F