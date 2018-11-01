#!/usr/bin/bash

# Enable beaver service
/usr/sbin/svcadm enable svc:/application/management/beaver:default
# ensure beaver service is running
/usr/sbin/svcadm clear svc:/application/management/beaver:default 2>dev/null || true
