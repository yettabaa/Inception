FROM debian:bullseye

RUN apt-get update && apt-get -y install vsftpd netcat

COPY . .

EXPOSE 20 21 40000:40005

RUN chmod +x tools/ftp.sh

CMD ["./tools/ftp.sh"]