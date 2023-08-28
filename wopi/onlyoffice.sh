#!/bin/sh
set -e

# we can't mount it directly because the run-document-server.sh script wants to move it
cp /etc/onlyoffice/documentserver/local.dist.json /etc/onlyoffice/documentserver/local.json

CERT_PATH=/var/www/onlyoffice/Data/certs/
mkdir -p "${CERT_PATH}"

# generate self-signed certificate
openssl req -x509 -newkey rsa:4096 -keyout ${CERT_PATH}onlyoffice.key -out ${CERT_PATH}onlyoffice.crt -sha256 -days 365 -batch -nodes >/dev/null 2>&1

chmod 400 "${CERT_PATH}"onlyoffice.key

/app/ds/run-document-server.sh
