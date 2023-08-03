#!/usr/bin/env bash

set -ex

pg_dump -v -Fc --no-owner --no-acl |
	gzip |
	aws s3 cp - "${DESTINATION_PATH}/$(date +"%Y-%m-%dT%H:%M:%S%:z").psql.gz"
