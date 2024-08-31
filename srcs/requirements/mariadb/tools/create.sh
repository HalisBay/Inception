#!/bin/bash
mysql_install_db --user=mysql
exec mysqld
