FROM python:3.7.4-alpine3.10


## Install envsubst and curl
RUN apk update
RUN apk add --no-cache gettext-dev curl


## Copy git deployment scripts
COPY ./scripts /scripts

WORKDIR /scripts
