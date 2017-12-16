#!/usr/bin/bash

VFSTAB=$(mdata-get vfstab)
if [ -n "$VFSTAB" ]; then
  # extend vfstab
  /usr/bin/cat >> /etc/vfstab << EOF
$VFSTAB
EOF
  # mount directory
  # TODO: handle multiple lines
  MOUNTPOINT=$(/usr/bin/echo "$VFSTAB" | /usr/bin/awk '{print $3}')
  [ -n "$MOUNTPOINT" ] && /usr/sbin/mount "$MOUNTPOINT"

  /usr/sbin/svcadm enable svc:/network/rpc/bind
  /usr/sbin/svcadm enable svc:/network/nfs/client
fi
