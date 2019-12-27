#!/usr/bin/bash

# ensure base account-passwords
gsed -i \
     -e 's#root:NP:#root:$5$n.gQ1n45$Fz52//LPBHKPiKZRu91HdnsCSipemrHzQqc84EFZWe8:#' \
     -e 's#admin:NP:#admin:$5$/r9514eY$RoXZYxBvKW12U2MpLjBUdkS5gMMe.o8y31eg.7wvlm.:#' \
     /etc/shadow

# cleanup mdata-store
mdata-delete mail_smarthost || true
mdata-delete mail_auth_user || true
mdata-delete mail_auth_pass || true
mdata-delete mail_adminaddr || true
mdata-delete admin_authorized_keys || true
mdata-delete root_authorized_keys || true
