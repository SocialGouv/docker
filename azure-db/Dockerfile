ARG PG_IMAGE=postgres:11-alpine

FROM registry.gitlab.factory.social.gouv.fr/socialgouv/docker/kubectl:0.25.0 AS kubectl-image

# hadolint ignore=DL3006
FROM ${PG_IMAGE}

COPY --from=kubectl-image /usr/local/bin/kubectl /usr/local/bin/kubectl

RUN set -ex \
  \
  && apk add --no-cache \
    jq=~1 \
    py-setuptools=~42 \
    python=~2 \
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


