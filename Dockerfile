FROM node:latest

WORKDIR /app

ADD package.json /app/package.json
ADD package-lock.json /app/package-lock.json

RUN npm install

ADD registry/_npmrc /root/.npmrc
ADD tsconfig.json /app/tsconfig.json
ADD test /app/test
ADD registry /app/registry

CMD npm start