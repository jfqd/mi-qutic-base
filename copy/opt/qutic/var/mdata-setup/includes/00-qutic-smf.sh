# This script load all SMF manifests from /opt/qutic/lib/svc/manifest

QUTIC_SVC_DIR='/opt/qutic/lib/svc/manifest/'

for xml in ${QUTIC_SVC_DIR}*; do
	svccfg import ${xml}
done
