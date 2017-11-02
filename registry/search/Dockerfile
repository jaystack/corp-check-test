FROM node:latest

WORKDIR /app

RUN npm i express

ADD scores.json /app/scores.json
ADD index.js /app/index.js

EXPOSE 3003

CMD node .