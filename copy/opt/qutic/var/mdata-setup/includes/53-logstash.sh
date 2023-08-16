#!/usr/bin/bash
# Configure ssh public and private key for root user in mdata variable

if mdata-get logstash_redis 1>/dev/null 2>&1; then
  LOGSTASH_REDIS=$(mdata-get logstash_redis | sed "s/,/\",\"/")

  sed -i \
      -e "s#\[\"127.0.0.1\"\]#\[\"${LOGSTASH_REDIS}#\"\]" \
      -e "s#\[\"131.0.0.1\"\]#\[\"${LOGSTASH_REDIS}#\"\]" \
      /opt/local/etc/beats/filebeat.yml

  svcadm restart svc:/pkgsrc/beats:filebeat || true
fi
