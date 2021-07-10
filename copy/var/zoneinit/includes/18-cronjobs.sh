#!/usr/bin/bash

# 0 9 * * 1 /opt/qutic/bin/ssl-expire.sh
# 30 3 * * 6 /opt/local/bin/pkgin up; /opt/local/bin/pkgin -n ug
# 15 3 * * 6 /opt/local/sbin/pkg_admin audit
# 0,5,10,15,20,25,30,35,40,45,50,55 * * * * /opt/local/bin/zabbix_system >/dev/null 2>&1

cat >> /var/spool/cron/crontabs/root << EOF
# additions for mi-qutic-base image
0,2,4,6,8,10,12,14,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58 * * * * /opt/qutic/bin/smf_health_check 1>/dev/null
0 0 * * * if [[ -d /var/log/httpd ]]; then /usr/bin/ls -1dt /var/log/httpd/access* | /usr/bin/tail -n +8 | /usr/bin/xargs /usr/bin/rm -f; fi
0 0 * * * /opt/qutic/bin/traffic
EOF
