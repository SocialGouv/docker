#

FROM ghcr.io/socialgouv/docker/kubectl:6.19 AS kubectl-image
FROM ghcr.io/socialgouv/docker/azure-cli:6.19 AS azure-cli-image

FROM debian:10.9-slim

COPY --from=kubectl-image /usr/local/bin/kubectl /usr/local/bin/kubectl
COPY --from=azure-cli-image /usr/bin/az /usr/bin/az
COPY --from=azure-cli-image /opt/az /opt/az

RUN set -ex \
  \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
  # renovate: datasource=repology depName=debian_stable/jq versioning=loose
  jq="1.5+dfsg-2+b1" \
  # renovate: datasource=repology depName=debian_stable/postgresql-client-11 versioning=loose
  postgresql-client-11="11.11-0+deb10u1" \
  # renovate: datasource=repology depName=debian_stable/git versioning=loose
  git="1:2.20.1-2+deb10u3" \
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
