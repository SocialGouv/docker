ARG PG_IMAGE=postgres:11-alpine

FROM ${PG_IMAGE}

RUN apk add --no-cache python python-dev build-base gcc wget git py-pip py-setuptools libffi-dev openssl-dev
RUN pip install azure-cli
RUN apk del python-dev build-base gcc wget py-pip libffi-dev openssl-dev

COPY ./bin /bin


