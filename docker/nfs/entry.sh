#!/bin/bash
#
# This script is the entry point for the docker it will start the
# needed services and test for needed configurations.
#

if [ ! -f "/etc/exports" ]; then
  echo "Missing exports"
  exit 1
fi

rpcbind -w

#rpc.idmapd
#rpc.statd
rpc.gssd
rpc.nfsd

exportfs -av

rpc.mountd -N 2 -F

