FROM python:3.10.0-alpine3.14

## Install envsubst and curl
RUN apk add --no-cache --update \
  # renovate: datasource=repology depName=alpine_3_14/bash versioning=loose
  bash=="5.1.4-r0" \
  # renovate: datasource=repology depName=alpine_3_14/coreutils versioning=loose
  coreutils=="8.32-r2" \
  # renovate: datasource=repology depName=alpine_3_14/curl versioning=loose
  curl=="7.79.1-r0" \
  # renovate: datasource=repology depName=alpine_3_14/gettext versioning=loose
  gettext=="0.21-r0"

## Copy git deployment scripts
COPY ./bin /bin
