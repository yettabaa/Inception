#!/bin/bash

mv conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

cd /home

if [ ! -f wp-config.php ]; then

    wp core download --allow-root

    wp config create --allow-root \
        --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DB_PASS" --dbhost="$DB_HOST"

    wp core install  --allow-root \
        --url="$URL" --title="$TITLE" --admin_user="$ADMIN_USER" --admin_password="$ADMIN_PASSWORD" --admin_email="$ADMIN_EMAIL"

    wp user create   --allow-root "$USER" "$USER_EMAIL" --user_pass="$USER_PASS"

fi

mkdir -p /run/php

php-fpm7.4 -F


# WordPress is a versatile platform that empowers users to create and manage blogs, 
# websites, and online stores with ease. Understanding the user roles and capabilities, 
# along with the content management features, can significantly enhance your site's
# effectiveness and user experience. 
# If you have specific aspects you're interested in exploring further, feel free to ask!

# WordPress.com (Online Version): Easier to set up and manage, as it handles hosting, 
# security, and updates for you. However, it limits customization options unless you 
# upgrade to paid plans. You may not be able to install custom plugins or themes freely,
# and advanced features like SEO tools or e-commerce options may require additional payments.

# Self-hosted WordPress: Offers more freedom and control. You can install any theme or plugin,
# including premium ones (which may require payment), and fully customize your website's functionality.
# It is ideal for users looking for complete control over their site, but this comes with the 
# responsibility of managing hosting, security, backups, and updates.

# There are several ways to install a self-hosted WordPress site, depending on your environment 
# and technical requirements. Here are the most common methods:
# WP-CLI, the WordPress Command Line Interface, to install WordPress.

# PHP-FPM (FastCGI Process Manager) efficiently manages PHP script execution.
# NGINX does not have native PHP support, so it relies on PHP-FPM to handle PHP requests.
# When a request for a PHP page (e.g., WordPress pages) comes in:
# NGINX forwards the request to PHP-FPM using the FastCGI protocol.
# PHP-FPM executes the PHP script (e.g., WordPress PHP code) and generates an HTML response.
# The response is sent back to NGINX, which delivers it to the user.
# Benefits of using PHP-FPM:
# Performance: PHP-FPM is optimized for high-performance environments and can handle many simultaneous requests efficiently.
# Resource Management: It allows fine-tuning of process pools and dynamic allocation of resources based on demand.
# Scalability: PHP-FPM can scale better under high traffic, making it suitable for larger WordPress installations.