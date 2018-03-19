#!/usr/bin/bash
# Configure ssh public and private key for root user in mdata variable

if mdata-get logstash_redis 1>/dev/null 2>&1; then
  LOGSTASH_REDIS=$(mdata-get logstash_redis)

  gsed -i \
       "s#redis://127.0.0.1:6379/0#${LOGSTASH_REDIS}#" \
       /opt/local/etc/beaver.conf
fi
