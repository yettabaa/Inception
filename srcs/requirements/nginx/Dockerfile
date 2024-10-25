FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx openssl

COPY . .

RUN chmod +x tools/nginx.sh

CMD ["/tools/nginx.sh"]

