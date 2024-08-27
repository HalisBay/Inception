#!/bin/sh
set -e

if [ ! -d "/var/lib/mysql/mysql" ]; then
    mysqld --initialize-insecure
    mysqld --skip-networking &
    pid="$!"
    sleep 5
    mysql < /etc/mysql/database.sql
    kill "$pid"
    wait "$pid"
fi

exec "$@"
