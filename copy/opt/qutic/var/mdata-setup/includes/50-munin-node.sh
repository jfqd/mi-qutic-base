#!/usr/bin/bash
# Configure munin-node allowed connections

MUNIN_CONF='/opt/local/etc/munin/munin-node.conf'

cp ${MUNIN_CONF}.tpl ${MUNIN_CONF}
if mdata-get munin_master_allow 1>/dev/null 2>&1; then
  echo "# mdata-get munin_master_allow" >> ${MUNIN_CONF}
  for allow in $(mdata-get munin_master_allow); do
    echo "allow ^${allow//\./\\.}$" >> ${MUNIN_CONF}
  done
  /usr/sbin/svcadm enable svc:/pkgsrc/munin-node:default
else
  /usr/sbin/svcadm disable svc:/pkgsrc/munin-node:default
fi
