#!/bin/bash

mv conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer.php

mkdir -p /run/php

php-fpm7.4 -F