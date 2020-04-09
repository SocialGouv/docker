
FROM debian:10.3-slim

RUN set -x \
  #
  && apt-get update \
  && apt-get install --no-install-recommends \
    ca-certificates \
    curl \
    apt-transport-https \
    lsb-release \
    gnupg \
  && curl -sL https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
  && echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ buster main" | tee /etc/apt/sources.list.d/azure-cli.list \
  && apt-get update \
  && apt-get install --no-install-recommends azure-cli \
  && az --version \
  ;
