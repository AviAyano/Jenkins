FROM  registry.hub.docker.com/library/node:latest

COPY package.json /usr/web-app/

COPY src /usr/web-app/

WORKDIR /usr/web-app

RUN apk add -U git curl  

EXPOSE 3007

CMD ["npm", "start"]