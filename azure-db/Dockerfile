#

FROM registry.gitlab.factory.social.gouv.fr/socialgouv/docker/kubectl:1.21.10 AS kubectl-image
FROM registry.gitlab.factory.social.gouv.fr/socialgouv/docker/azure-cli:1.21.10 AS azure-cli-image

FROM debian:10.4-slim

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
