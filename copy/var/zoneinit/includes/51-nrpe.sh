#!/usr/bin/bash

# fix nrpe pid write issue
mkdir -p /opt/local/var/nagios/
chown nagios:root /opt/local/var/nagios/
# Enable nrpe service
/usr/sbin/svcadm enable svc:/pkgsrc/nrpe:default
