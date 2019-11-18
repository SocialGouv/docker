FROM python:3.8.0b1-alpine3.10

## Install envsubst and curl
RUN apk update
RUN apk add --no-cache gettext-dev=0.19.8.1-r4 curl=7.66.0-r0

## Copy git deployment scripts
COPY ./bin /bin
