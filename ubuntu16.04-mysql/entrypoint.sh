#!/bin/bash -e

find /var/lib/mysql -type f -exec touch {} \;
service mysql restart > /dev/null

exec "$@"
