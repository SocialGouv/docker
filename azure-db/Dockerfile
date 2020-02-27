ARG PG_IMAGE=postgres:11-alpine

# hadolint ignore=DL3006
FROM ${PG_IMAGE}

RUN set -ex \
  \
  && apk add --no-cache \
    python=~2 \
    py-setuptools=~42 \
  \
  && apk add --no-cache --virtual .pip-deps \
    build-base=~0 \
    gcc=~9 \
    git=~2 \
    libffi-dev=~3 \
    openssl-dev=~1 \
    py-pip=~18 \
    python-dev=~2 \
    wget=~1 \
  \
  && pip install --no-cache-dir "azure-cli>=2" \
  \
  && apk del .pip-deps

COPY ./bin /bin


