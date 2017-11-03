FROM node:latest

WORKDIR /app

RUN npm i express

ADD packages /app/packages
ADD search.js /app/index.js

EXPOSE 3003

CMD node .