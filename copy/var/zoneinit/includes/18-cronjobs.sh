#!/usr/bin/bash

# create cronjob for ssl-expire script
CRON='0 9 * * 1 /opt/qutic/bin/ssl-expire.sh
0 0 * * * /opt/qutic/bin/traffic
30 3 * * 6 /opt/local/bin/pkgin up; /opt/local/bin/pkgin -n ug'
(crontab -l 2>/dev/null || true; echo "$CRON" ) | sort | uniq | crontab

# 15 3 * * 6 /opt/local/sbin/pkg_admin audit

echo '0,2,4,6,8,10,12,14,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58 * * * * /opt/qutic/bin/smf_health_check 1>/dev/null' >> /var/spool/cron/crontabs/root
echo '0 0 * * * if [[ -d /var/log/httpd ]]; then /usr/bin/ls -1dt /var/log/httpd/access* | /usr/bin/tail -n +8 | /usr/bin/xargs /usr/bin/rm -f; fi' >> /var/spool/cron/crontabs/root
