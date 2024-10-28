FROM debian:bullseye

RUN apt-get update && apt-get -y install wget php7.4-fpm php-mysql

COPY . .

EXPOSE 9001

RUN chmod +x tools/adminer.sh

CMD ["./tools/adminer.sh"]