#!/bin/bash

mv conf/nginx.conf /etc/nginx/nginx.conf

mkdir /etc/nginx/ssl

openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
        -keyout /etc/nginx/ssl/private_key.key \
        -out /etc/nginx/ssl/public_key.crt \
        -subj "/C=MA/ST=Casablanca/L=AINCHOCK/O=42/OU=1337/CN=yettabaa"

nginx

# Nginx (pronounced "engine-x") is a high-performance, open-source web server 
# and reverse proxy server. It is widely used for serving static content, 
# load balancing, and handling high traffic due to its ability to efficiently
# manage multiple connections.
# Nginx is also commonly used as a reverse proxy to distribute requests to 
# backend services and improve application scalability.

# SSL (Secure Sockets Layer) and its successor TLS (Transport Layer Security)
# Secure protocols that encrypt data transmitted over the internet, ensuring 
# confidentiality, integrity, and authentication between clients and servers. 
# TLS is the modern successor to SSL.

# => nano /etc/hosts add you hostname 