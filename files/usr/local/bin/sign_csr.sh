#!/bin/bash
set -e

SCRIPT_NAME=$(basename $0)

[ -z $2 ] && echo "${SCRIPT_NAME} <csr filename> <crt filename>" 1>&2 && exit 1

csr=$1
crt=$2

cd /etc/ssl/zk

openssl x509 -req -SHA256 -days 3650 \
  -CA zk_ca.crt -CAkey zk_ca.key -CAcreateserial \
  -in ${csr} -out ${crt}
