ARG PG_IMAGE=postgres:11-alpine

# hadolint ignore=DL3006
FROM ${PG_IMAGE}

RUN apk add --no-cache \
    build-base=~0 \
    gcc=~9 \
    git=~2 \
    libffi-dev=~3 \
    openssl-dev=~1 \
    py-pip=~18 \
    py-setuptools=~42 \
    python=~2 \
    python-dev=~3 \
    wget=~1 \
	&& pip install "azure-cli>=2" \
	&& apk del python-dev build-base gcc wget py-pip libffi-dev openssl-dev

COPY ./bin /bin


