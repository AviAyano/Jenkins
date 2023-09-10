FROM  registry.hub.docker.com/library/node

COPY package.json /usr/web-app/
COPY src /usr/web-app/

WORKDIR /usr/web-app

EXPOSE 3007

CMD [ "node", "server.js" ]