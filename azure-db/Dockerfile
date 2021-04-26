#

FROM ghcr.io/socialgouv/docker/kubectl:6.0.0-beta.3@sha256:c8aa69bdfc4b82e5933045285621b7dd094289a6d430b0e17c364f01c0ce9293 AS kubectl-image
FROM ghcr.io/socialgouv/docker/azure-cli:6.0.0-beta.3@sha256:9d3e89fcf12ca44e7659da459da1740d10dce0af75baaa262b738de133460bcb AS azure-cli-image

FROM debian:10.9-slim

COPY --from=kubectl-image /usr/local/bin/kubectl /usr/local/bin/kubectl
COPY --from=azure-cli-image /usr/bin/az /usr/bin/az
COPY --from=azure-cli-image /opt/az /opt/az

RUN set -ex \
  \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
  jq=1.5+dfsg-2+b1 \
  postgresql-client-11=11.7-0+deb10u1 \
  git=1:2.20.1-2+deb10u3 \
  #
  && apt-get purge -y --auto-remove \
  &&  apt-get -y clean \
  &&  apt-get -y autoclean \
  &&  apt-get -y autoremove \
  &&  rm -rf \
  /var/lib/apt/lists/* \
  /var/cache/debconf/*-old \
  ;

COPY ./bin /bin
