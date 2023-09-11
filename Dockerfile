FROM  node:16-alpine

# COPY package.json /usr/web-app/

# COPY src /usr/web-app/

# WORKDIR /usr/web-app

RUN apk add -U git curl npm 

# EXPOSE 3007

CMD [ "service ", "docker ", "start" ]

# FROM debian:buster-slim

# RUN apt-get update && apt-get install -y docker.io && apt-get install -y npm && apt-get install -y git && apt-get install -y podman

# CMD [ "service ", "docker ", "start" ]"