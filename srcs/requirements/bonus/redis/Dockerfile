FROM debian:bullseye

RUN apt-get update && apt-get -y install redis-server net-tools

EXPOSE 6379

CMD ["redis-server", "--bind", "0.0.0.0", "--port", "6379", "--protected-mode", "no"]