FROM gcr.io/stacksmith-images/ubuntu:14.04-r10

MAINTAINER Bitnami <containers@bitnami.com>

ENV BITNAMI_APP_NAME=ghost \
    BITNAMI_IMAGE_VERSION=0.11.0-r1 \
    PATH=/opt/bitnami/node/bin:/opt/bitnami/mysql/bin:$PATH

# Additional modules required
RUN bitnami-pkg install node-4.5.0-1 --checksum 4ea3d270ea4b44f53d628357a062066438248a49331a0b9e4eb5e6b3671d076f
RUN bitnami-pkg install mysql-client-10.1.13-4 --checksum 14b45c91dd78b37f0f2366712cbe9bfdf2cb674769435611955191a65dbf4976

# Install ghost
RUN bitnami-pkg unpack ghost-0.11.0-0 --checksum 7b5a150692d187a34abd303a115588f078aea9b9c5b519b46955d6dba60275a4

COPY rootfs /

VOLUME ["/bitnami/ghost"]

EXPOSE 2368

ENTRYPOINT ["/app-entrypoint.sh"]

CMD ["nami", "start", "--foreground", "ghost"]
