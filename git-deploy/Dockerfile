FROM python:3.8.3-alpine3.10

## Install envsubst and curl
RUN apk add --no-cache --update gettext-dev=~0 curl=~7.76.1-r0

## Copy git deployment scripts
COPY ./bin /bin
