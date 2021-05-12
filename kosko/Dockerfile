#

FROM ghcr.io/socialgouv/docker/kubectl:6.0 AS kubectl-image

#

FROM node:14.16.1-alpine3.13

COPY --from=kubectl-image /usr/local/bin/kubectl /usr/local/bin/kubectl
COPY --from=kubectl-image /usr/local/bin/kustomize /usr/local/bin/kustomize

ARG KOSKO_VERSION
ENV KOSKO_VERSION=${KOSKO_VERSION}

RUN set -ex \
  #
  && apk add --update --no-cache \
  # renovate: datasource=repology depName=alpine_3_13/yq versioning=loose
  yq=="3.4.1-r0" \
  #
  && apk add --update --no-cache \
  # renovate: datasource=repology depName=alpine_3_13/bash versioning=loose
  bash=="5.1.0-r0" \
  # renovate: datasource=repology depName=alpine_3_13/coreutils versioning=loose
  coreutils=="8.32-r2" \
  # renovate: datasource=repology depName=alpine_3_13/gettext versioning=loose
  gettext=="0.20.2-r2" \
  #
  && yarn global add kosko@${KOSKO_VERSION} \
  #
  && kosko --version \
  ;

# renovate: datasource=github-releases depName=k14s/kapp
ARG KAPP_VERSION=v0.36.0
RUN set -ex \
  #
  && wget -q -O /usr/local/bin/kapp \
  "https://github.com/k14s/kapp/releases/download/${KAPP_VERSION}/kapp-linux-amd64" \
  && chmod +x /usr/local/bin/kapp \
  #
  && kapp --version \
  ;
