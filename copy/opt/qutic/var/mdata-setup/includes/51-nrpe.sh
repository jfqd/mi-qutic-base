#!/usr/bin/bash

# Configure nrpe allowed connections
if mdata-get nagios_allow 1>/dev/null 2>&1; then
  sed -i \
       "s/allowed_hosts=127.0.0.1,::1/allowed_hosts=$(mdata-get nagios_allow)/" \
       /opt/local/etc/nagios/nrpe.cfg
  # fix nrpe pid write issue
  mkdir -p /opt/local/var/nagios/
  chown nagios:root /opt/local/var/nagios/
  # Enable nrpe service
  /usr/sbin/svcadm enable svc:/pkgsrc/nrpe:default
else
  /usr/sbin/svcadm disable svc:/pkgsrc/nrpe:default
fi
