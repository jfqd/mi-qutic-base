#!/bin/bash

# Get internal ip of vm
IP_INTERNAL=$(mdata-get sdc:nics | /usr/bin/json -ag ip -c 'this.nic_tag === "admin"' 2>/dev/null);
# Workaround for using DHCP so IP_INTERNAL is empty
if [[ -z "${IP_INTERNAL}" ]]; then
  IP_INTERNAL="127.0.0.1"
fi

# Configure nrpe allowed connections
if mdata-get nagios_allow 1>/dev/null 2>&1; then
  NRPE_ALLOW=$(mdata-get nagios_allow)
  gsed -i \
       -e "s/allowed_hosts=127.0.0.1,::1/allowed_hosts=${NRPE_ALLOW}/" \
       -e "s/server_address=127.0.0.1/server_address=${IP_INTERNAL}/" \
       /opt/local/etc/nagios/nrpe.cfg
fi
