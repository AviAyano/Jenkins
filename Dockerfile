FROM  registry.hub.docker.com/library/node

COPY package.json /usr/web-app/
COPY src /usr/web-app/

WORKDIR /usr/web-app

ENV _BUILDAH_STARTED_IN_USERNS="" \
    BUILDAH_ISOLATION=chroot \
    STORAGE_DRIVER=vfs

RUN yum -y update && yum install -y libcap2-bin
RUN setcap cap_sys_admin=eip /bin/npm 
RUN  adduser -g 0 -u 1001 jenkins && \ yum -y update && \ yum clean all && \ npm install --unsafe-perm=true

USER 1001

EXPOSE 3007

CMD [ "node", "server.js" ]