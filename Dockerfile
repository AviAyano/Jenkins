FROM  node:20-alpine

COPY package.json /usr/web-app/
COPY src /usr/web-app/

WORKDIR /usr/web-app

RUN npm install

CMD [ "node", "server.js" ]