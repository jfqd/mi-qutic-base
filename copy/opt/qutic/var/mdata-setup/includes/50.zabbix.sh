#!/usr/bin/bash

if mdata-get zabbix_pski 1>/dev/null 2>&1; then
  PSKI=$(mdata-get zabbix_pski)

  if mdata-get zabbix_psk 1>/dev/null 2>&1; then
    PSK=$(mdata-get zabbix_psk)

    echo "${PSK}" > /opt/local/etc/zabbix_agentd.psk
    chmod 0400 /opt/local/etc/zabbix_agentd.psk
    chown zabbix:zabbix /opt/local/etc/zabbix_agentd.psk

    sed -i \
        -e "s|# TLSAccept=unencrypted|TLSAccept=psk" \
        -e "s|# TLSConnect=unencrypted|TLSConnect=psk|" \
        -e "s|# TLSPSKIdentity=|TLSPSKIdentity=${PSKI}|" \
        -e "s|# TLSPSKFile=|TLSPSKFile=/etc/zabbix/zabbix_agentd.psk" \
        /opt/local/etc/zabbix_agentd.conf

  fi
fi

if mdata-get zabbix_server 1>/dev/null 2>&1; then
  ZABBIX_SERVER=$(mdata-get zabbix_server)
  sed -i \
      -e "s|Server=127.0.0.1|Server=${ZABBIX_SERVER}|" \
      -e "s|ServerActive=127.0.0.1|ServerActive=${ZABBIX_SERVER}|" \
      /opt/local/etc/zabbix_agentd.conf

  HOSTNAME=$(/bin/hostname)
  sed -i \
      -e "s|# PidFile=/tmp/zabbix_agentd.pid|PidFile=/var/tmp/zabbix_agentd.pid|" \
      -e "s|LogFile=/tmp/zabbix_agentd.log|LogFile=/var/log/zabbix/zabbix_agentd.log|" \
      -e "s|Hostname=Zabbix server|Hostname=${HOSTNAME}|" \
      -e "s|# Include=/opt/local/etc/zabbix_agentd.conf.d/*.conf|Include=/opt/local/etc/zabbix_agentd.conf.d/*.conf" \
      /opt/local/etc/zabbix_agentd.conf

  /usr/sbin/svcadm enable -r svc:/pkgsrc/zabbix:agent
fi
