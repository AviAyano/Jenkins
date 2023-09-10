FROM  registry.hub.docker.com/library/node

COPY package.json /usr/web-app/
COPY src /usr/web-app/

WORKDIR /usr/web-app

ENV _BUILDAH_STARTED_IN_USERNS="" \
    BUILDAH_ISOLATION=chroot \
    STORAGE_DRIVER=vfs

RUN sudo su \adduser -g 0 -u 1001 jenkins && \
    yum -y update && \ yum clean all && \ chmod -R 775 /usr/lib/jvm && \ npm install
    
USER 1001

EXPOSE 3007

CMD [ "sudo node", "server.js" ]