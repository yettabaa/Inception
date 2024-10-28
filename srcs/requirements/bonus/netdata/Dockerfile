# Use Debian as the base image
FROM debian:bullseye

RUN apt-get update && apt-get install -y netdata

RUN sed -i 's/bind socket to IP = 127.0.0.1/bind socket to IP = 0.0.0.0/' /etc/netdata/netdata.conf

EXPOSE 19999

CMD ["/usr/sbin/netdata", "-D"]
