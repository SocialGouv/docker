#!/bin/sh

CACHE_RESPONSE=${CACHE_RESPONSE:="/tmp/deploy_payload.json"}
DEPLOY_ID_FILE=${DEPLOY_ID_FILE:="DEPLOY_ID"}

set -eu -o pipefail
cat "${CACHE_RESPONSE}" \
  | python -c "import json,sys;obj=json.load(sys.stdin);print(obj.get('id'))" \
  > "${DEPLOY_ID_FILE}"

if [[ $(cat $DEPLOY_ID_FILE) = "None" ]]; then
  exit 1;
fi
