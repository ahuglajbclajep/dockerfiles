FROM node:10.9.0-alpine

ARG PANDOC_VERSION=2.2.3.2

RUN echo http://nl.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories \
 && echo http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories \
 && apk add --no-cache chromium nss \
 && apk add --no-cache -t build-dependencies \
    ghc cabal curl \
    musl-dev zlib-dev \
 && wget https://hackage.haskell.org/package/pandoc-$PANDOC_VERSION/pandoc-$PANDOC_VERSION.tar.gz \
 && tar xf pandoc-$PANDOC_VERSION.tar.gz \
 && cd pandoc-$PANDOC_VERSION \
 && cabal update \
 && cabal install --only-dependencies \
 && cabal configure --prefix=/usr/local \
 && cabal build \
 && cabal copy \
 && cd .. \
 && apk del --purge build-dependencies \
 && rm -rf pandoc-$PANDOC_VERSION* /root/.cabal/ /root/.ghc/
