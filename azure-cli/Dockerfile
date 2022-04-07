
FROM debian:11.3-slim

# renovate: datasource=pypi depName=azure-cli versioning=2.22.1
ARG AZURE_CLI_VERSION=2.22.1

SHELL ["/bin/bash", "-eo", "pipefail", "-c"]

RUN --mount=type=cache,target=/var/cache/apt \
  --mount=type=cache,target=/var/lib/apt \
  --mount=type=cache,target=/var/cache/debconf \
  \
  set -x \
  #
  && apt-get update \
  && apt-get install -y --no-install-recommends \
  # renovate: datasource=repology depName=debian_stable/ca-certificates versioning=loose
  ca-certificates="20210119" \
  # renovate: datasource=repology depName=debian_stable/curl versioning=loose
  curl="7.74.0-1.3+deb11u1" \
  # renovate: datasource=repology depName=debian_stable/gnupg versioning=loose
  gnupg="2.2.27-2+deb11u1" \
  #
  && curl -sL https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
  && echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ buster main" | tee /etc/apt/sources.list.d/azure-cli.list \
  #
  && apt-get update \
  && apt-get install -y --no-install-recommends \
  azure-cli=${AZURE_CLI_VERSION}-1~buster \
  #
  && apt-get remove --purge -y \
  ca-certificates \
  curl \
  gnupg \
  && apt-get purge -y --auto-remove \
  && apt-get -y clean \
  && apt-get -y autoclean \
  && apt-get -y autoremove \
  && rm -rf \
  /var/lib/apt/lists/* \
  /var/cache/debconf/*-old \
  ;

ENTRYPOINT ["az"]
