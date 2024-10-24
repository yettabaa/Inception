#!/bin/bash

sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 0.0.0.0:9000|1' /etc/php/7.4/fpm/pool.d/www.conf

chmod +x /usr/local/bin/wp

cd /home

service php7.4-fpm start
wp core download --allow-root


wp config create --allow-root --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DB_PASS" --dbhost="$DB_HSOT"

# wp core install  --allow-root --url="$URL" --title="$TITLE" --admin_user="$ADMIN_USER" --admin_password="$ADMIN_PASSWORD" --admin_email="$ADMIN_EMAIL"

service php7.4-fpm stop

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