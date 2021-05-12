FROM python:3.8.9-alpine3.13

## Install envsubst and curl
RUN apk add --no-cache --update \
  gettext-dev=="0.20.2-r2" \
  # renovate: datasource=repology depName=alpine_3_13/curl versioning=loose
  curl=="7.76.1-r0"

## Copy git deployment scripts
COPY ./bin /bin
