#!/usr/bin/bash
if mdata-get mail_adminaddr 1>/dev/null 2>&1; then
  ADMIN_EMAIL=$(mdata-get mail_adminaddr)
  svccfg setnotify -g from-online,to-maintenance mailto:${ADMIN_EMAIL}
  svccfg setnotify problem-diagnosed,problem-updated mailto:${ADMIN_EMAIL}
fi
