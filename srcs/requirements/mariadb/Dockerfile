FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server

EXPOSE 3306

COPY . .

RUN chmod +x tools/mariadb.sh

CMD ["./tools/mariadb.sh"]