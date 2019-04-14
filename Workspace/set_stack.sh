#!/bin/bash

cd $(dirname $0)
DST_HOSTNAME=$1
STACK_JSON=$(cat stack.json)

if [[ -z ${DST_HOSTNAME} ]]; then
  echo "Usage: $0 [destination hostname or ip address]"
  exit 1
fi

curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d ${STACK_JSON} "http://${DST_HOSTNAME}/api/stack"