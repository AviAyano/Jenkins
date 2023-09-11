FROM  registry.hub.docker.com/library/node

COPY package.json /usr/web-app/

COPY src /usr/web-app/

WORKDIR /usr/web-app

RUN apk add -U git curl npm podman

EXPOSE 3007

CMD [ "node", "server.js" ]