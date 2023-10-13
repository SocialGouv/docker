#!/usr/bin/env bash

set -e

# check mandatory environment variables
MANDATORY_VARS="AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_DEFAULT_REGION AWS_ENDPOINT_URL DESTINATION_PATH"
for VAR in $MANDATORY_VARS; do
  if [[ -z "${!VAR}" ]]; then
    echo "${VAR} environment variable is empty"
    exit 1
  fi
done

./dump-upload.sh

if ! [[ -z $RETENTION_DAYS ]]; then
  ./rotate-dumps.sh
fi