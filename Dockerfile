FROM  registry.hub.docker.com/library/node

COPY package.json /usr/web-app/
COPY src /usr/web-app/

WORKDIR /usr/web-app

RUN sudo npm install

EXPOSE 3007

CMD [ "sudo node", "server.js" ]