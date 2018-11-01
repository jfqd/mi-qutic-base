#!/usr/bin/bash

# ensure base account-passwords
gsed -i \
     -e 's#root:NP:#root:$5$n.gQ1n45$Fz52//LPBHKPiKZRu91HdnsCSipemrHzQqc84EFZWe8:#' \
     -e 's#admin:NP:#admin:$5$/r9514eY$RoXZYxBvKW12U2MpLjBUdkS5gMMe.o8y31eg.7wvlm.:#' \
     /etc/shadow
