FROM node:latest

WORKDIR /app

ADD package.json /app/package.json
ADD package-lock.json /app/package-lock.json

RUN npm install

ADD tsconfig.json /app/tsconfig.json
ADD test /app/test
ADD registry /app/registry

RUN sh registry/init.sh

CMD npm start