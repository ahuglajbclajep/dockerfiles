FROM node:10.15.3-alpine

ARG PANDOC_V=2.7.1

RUN echo http://nl.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories \
 && echo http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories \
 && apk add --no-cache ca-certificates && update-ca-certificates \
 && apk add --no-cache chromium nss \
 && wget -O - https://github.com/jgm/pandoc/releases/download/$PANDOC_V/pandoc-$PANDOC_V-linux.tar.gz | \
    tar -xz -C /usr/local/ --strip-components=1 \
 && rm -rf /usr/local/share/man/*
