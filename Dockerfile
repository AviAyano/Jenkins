FROM  registry.hub.docker.com/library/node

COPY package.json /usr/web-app/
COPY src /usr/web-app/

WORKDIR /usr/web-app

ENV _BUILDAH_STARTED_IN_USERNS="" \
    BUILDAH_ISOLATION=chroot \
    STORAGE_DRIVER=vfs

RUN  sudo su && npm install

EXPOSE 3007

CMD [ "node", "server.js" ]