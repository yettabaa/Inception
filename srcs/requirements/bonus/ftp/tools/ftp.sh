#!/bin/bash

mv conf/vsftpd.conf /etc/vsftpd.conf

while ! nc -z wordpress 9000; do
  echo "Waiting for wordpress service ..."
  sleep 2
done
echo "WordPress is ready!"

useradd -m $FTP_USER

echo  $FTP_USER:$FTP_PASSWORD | /usr/sbin/chpasswd

chmod -R 755 /var/www/html

chown -R $FTP_USER:$FTP_USER /var/www/html

# chown -R www-data:www-data /var/www/html

echo "${FTP_USER}" >> /etc/vsftpd.userlist

unset $DB_USER $DB_PASS $ADMIN_USER $ADMIN_PASSWORD $USER $USER_PASS $FTP_USER $FTP_PASSWORD

mkdir -p /var/run/vsftpd/empty

vsftpd /etc/vsftpd.conf


# Firewalls handle active mode connections by monitoring outgoing requests 
# and allowing incoming connections to the client’s specified ports. This can 
# be complex and problematic in certain environments.
# In passive mode, firewalls allow the client to initiate all connections, making 
# it simpler and more reliable for environments with strict firewall rules or NAT 
# configurations.

# FTP (File Transfer Protocol) is a standard network protocol used to
# transfer files between a client and a server over a network. In Docker,
# FTP can be used to allow remote file access and management of the container’s
# file system, enabling users to upload, download, or modify files within 
# the container from an external FTP client.

# File Sharing: FTP allows users to move files in and out of Docker containers
# easily, which is useful for dynamic content management, such as WordPress 
# plugins or themes.
# Service Configuration: FTP can facilitate configuration management by letting 
# administrators directly upload or edit configuration files within a container.
# Separation of Concerns: Using FTP, non-developers (e.g., content managers) can
# interact with container files without accessing the command line.
# In short, FTP in Docker provides a secure and structured way to manage and transfer
# files, ideal for containerized applications requiring regular content updates, 
# like WordPress.

