FROM  registry.hub.docker.com/node:20-alpine

COPY package.json /usr/web-app/
COPY src /usr/web-app/

WORKDIR /usr/web-app

RUN npm install

EXPOSE 3007

CMD [ "node", "server.js" ]