#

FROM ghcr.io/socialgouv/docker/kubectl:6.62 AS kubectl-image
FROM ghcr.io/socialgouv/docker/azure-cli:6.62 AS azure-cli-image

FROM debian:11.6-slim

COPY --from=kubectl-image /usr/local/bin/kubectl /usr/local/bin/kubectl
COPY --from=azure-cli-image /usr/bin/az /usr/bin/az
COPY --from=azure-cli-image /opt/az /opt/az

RUN set -ex \
  \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
  # renovate: datasource=repology depName=debian_stable/jq versioning=loose
  jq="1.6-2.1" \
  # renovate: datasource=repology depName=debian_stable/postgresql-13 versioning=loose
  postgresql-13="13.7-0+deb11u1" \
  # renovate: datasource=repology depName=debian_stable/git versioning=loose
  git="1:2.30.2-1" \
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
