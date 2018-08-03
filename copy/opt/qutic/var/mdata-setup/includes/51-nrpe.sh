#!/usr/bin/bash

# Configure nrpe allowed connections
if mdata-get nagios_allow 1>/dev/null 2>&1; then
  NRPE_ALLOW=$(mdata-get nagios_allow)
  sed -i \
       "s/allowed_hosts=127.0.0.1,::1/allowed_hosts=${NRPE_ALLOW}/" \
       /opt/local/etc/nagios/nrpe.cfg
fi
