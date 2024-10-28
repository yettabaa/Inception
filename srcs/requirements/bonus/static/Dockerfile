FROM debian:buster

RUN apt-get update -y && apt-get install nodejs npm -y

WORKDIR /usr/src/app

RUN npm init -y && npm install express -y

COPY /tools .

EXPOSE 3000

CMD ["node", "server.js"]