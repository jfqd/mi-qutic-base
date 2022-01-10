#!/usr/bin/bash

HOSTNAME=$(/usr/bin/hostname)
sed -i \
    "s/host.example.com/${HOSTNAME}/" \
    /opt/local/etc/beats/filebeat.yml

# Enable filebeat service
/usr/sbin/svcadm enable beats:filebeat
