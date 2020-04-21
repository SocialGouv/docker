FROM python:3.8.2-alpine3.10

## Install envsubst and curl
RUN apk update
RUN apk add --no-cache gettext-dev=~0 curl=~7

## Copy git deployment scripts
COPY ./bin /bin
