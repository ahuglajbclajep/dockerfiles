FROM ubuntu:16.04

ARG mysqlv=5.7
ARG mysqlp=mysql

RUN { \
    echo "mysql-server-$mysqlv mysql-server/root_password password $mysqlp"; \
    echo "mysql-server-$mysqlv mysql-server/root_password_again password $mysqlp"; \
  } | debconf-set-selections && \
  apt-get update && \
  apt-get install -y mysql-server && \
  rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /
ENTRYPOINT ["./entrypoint.sh"]
