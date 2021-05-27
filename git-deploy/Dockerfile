FROM python:3.9.5-alpine3.13

## Install envsubst and curl
RUN apk add --no-cache --update \
  # renovate: datasource=repology depName=alpine_3_13/bash versioning=loose
  bash=="5.1.0-r0" \
  # renovate: datasource=repology depName=alpine_3_13/coreutils versioning=loose
  coreutils=="8.32-r2" \
  # renovate: datasource=repology depName=alpine_3_13/curl versioning=loose
  curl=="7.77.0-r0" \
  # renovate: datasource=repology depName=alpine_3_13/gettext versioning=loose
  gettext=="0.20.2-r2"

## Copy git deployment scripts
COPY ./bin /bin
