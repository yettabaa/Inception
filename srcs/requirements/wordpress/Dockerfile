FROM debian:bullseye

RUN apt-get update && apt-get -y install wget php7.4-fpm php-mysql iputils-ping curl iproute2

RUN wget -O /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x /usr/local/bin/wp

COPY . .

RUN chmod +x tools/wordpress.sh

CMD ["./tools/wordpress.sh"]