#!/bin/bash

mv conf/vsftpd.conf /etc/vsftpd.conf

while ! nc -z wordpress 9000; do
  echo "Waiting for wordpress service ..."
  sleep 2
done
echo "WordPress is ready!"

service vsftpd start

useradd -m $FTP_USER

echo  $FTP_USER:$FTP_PASSWORD | /usr/sbin/chpasswd

chmod -R 755 /var/www/html

chown -R $FTP_USER:$FTP_USER /var/www/html

# chown -R www-data:www-data /var/www/html

echo "${FTP_USER}" >> /etc/vsftpd.userlist

service vsftpd stop

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

#!/bin/bash



# mkdir -p "${FTP_CERTS_PATH}"

# openssl genpkey -algorithm RSA -out "${FTP_CERTS_PATH}vsftpd.key" 2>/dev/null

# openssl req -x509 -new -key "${FTP_CERTS_PATH}vsftpd.key" \
#   -out "${FTP_CERTS_PATH}vsftpd.crt" \
#   -days 365 -subj "/C=MA/ST=State/L=City/O=Organization/OU=Department/CN=localhost" 2>/dev/null

# if id "$FTP_USER" &>/dev/null; then
#     echo "${magenta}FTP user $FTP_USER already exists.${normal}"
# else
#     useradd -m -c "${FTP_USER_FULLNAME}" -s /bin/bash "${FTP_USER}"
# fi

# echo "${FTP_USER}:${FTP_PASSWORD}" | chpasswd

# echo "${FTP_USER}" >> /etc/vsftpd.userlist

# sed -i "s|rsa_cert_file=.*|rsa_cert_file=${FTP_CERTS_PATH}vsftpd.crt|" /etc/vsftpd.conf
# sed -i "s|rsa_private_key_file=.*|rsa_private_key_file=${FTP_CERTS_PATH}vsftpd.key|" /etc/vsftpd.conf

# chmod -R 777 /var/www/html
# vsftpd /etc/vsftpd.conf
