FROM ubuntu:16.04

RUN \
  apt-get update && \
  apt-get install -y software-properties-common && \
  add-apt-repository -y ppa:deadsnakes/ppa && \
  apt-get update && \
  apt-get install -y python3.6 python3.6-dev curl && \
  rm -rf /var/lib/apt/lists/*
　
RUN curl https://bootstrap.pypa.io/get-pip.py | python3.6
