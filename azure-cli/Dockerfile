
FROM debian:10.9-slim

# renovate: datasource=repology depName=debian_stable/ca-certificates versioning=loose
ARG CA_CERTIFICATES_VERSION=20200601~deb10u2

# renovate: datasource=repology depName=debian_stable/curl versioning=loose
ARG CURL_VERSION=7.64.0-4+deb10u2

# renovate: datasource=repology depName=debian_stable/gnupg versioning=loose
ARG GNUPG_VERSION=2.2.12-1+deb10u1

# renovate: datasource=pypi depName=azure-cli versioning=2.20.0
ARG AZURE_CLI_VERSION=2.20.0

SHELL ["/bin/bash", "-eo", "pipefail", "-c"]

RUN set -x \
  #
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    ca-certificates="${CA_CERTIFICATES_VERSION}" \
    curl="${CURL_VERSION}" \
    gnupg="${GNUPG_VERSION}" \
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
  &&  apt-get -y clean \
  &&  apt-get -y autoclean \
  &&  apt-get -y autoremove \
  &&  rm -rf \
    /var/lib/apt/lists/* \
    /var/cache/debconf/*-old \
  #
  && az --version \
  ;

ENTRYPOINT ["az"]
