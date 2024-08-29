#!/bin/sh

if [ ! -f /usr/local/bin/wp ]; then
    echo "WP-CLI loading."
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
else
    echo "WP-CLI already downloaded."
fi

cd /var/www/html
if [ -d "wp-content" ] && [ -f "wp-config.php" ]; then
  echo "WordPress already downloaded."
else
  wget https://wordpress.org/latest.tar.gz
  tar xzf latest.tar.gz
  mv wordpress/* .
  rm -rf latest.tar.gz
  rm -rf wordpress
  echo "wordpress downloaded"
fi
if [ ! -f wp-config.php ]; then
    wp config create --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=${MYSQL_HOSTNAME} --allow-root
    wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
    wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root
    echo "wp-config OK."
else
    echo "wp config already exist"
fi
exec php-fpm7.3 -F