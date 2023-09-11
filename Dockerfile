FROM  node:16-alpine

# COPY package.json /usr/web-app/

# COPY src /usr/web-app/

# WORKDIR /usr/web-app

RUN apk add -U git curl npm podman docker.io

# EXPOSE 3007

CMD [ "service ", "docker ", "start" ]