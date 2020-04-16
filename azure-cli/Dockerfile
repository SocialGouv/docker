
FROM debian:10.3-slim

RUN set -x \
  #
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    ca-certificates=20190110 \
    curl=7.64.0-4+deb10u1 \
    apt-transport-https=1.8.2 \
    lsb-release=10.2019051400 \
    gnupg=2.2.12-1+deb10u1 \
  #
  && curl -sL https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
  && echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ buster main" | tee /etc/apt/sources.list.d/azure-cli.list \
  && apt-get update \
  #
  && apt-get install -y --no-install-recommends azure-cli \
  #
  && apt-get remove --purge -y \
    ca-certificates \
    curl \
    apt-transport-https \
    lsb-release \
    gnupg \
  && apt-get purge -y --auto-remove \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  #
  && az --version \
  ;
