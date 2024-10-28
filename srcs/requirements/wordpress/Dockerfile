FROM debian:bullseye

RUN apt-get update && apt-get -y install wget php7.4-fpm php-mysql default-mysql-client

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp && \
    chmod +x /usr/local/bin/wp

COPY . .

EXPOSE 21 20 40000:40005

RUN chmod +x tools/wordpress.sh

CMD ["./tools/wordpress.sh"]