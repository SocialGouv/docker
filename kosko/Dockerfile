#

FROM registry.gitlab.factory.social.gouv.fr/socialgouv/docker/kubectl:4.7.1 AS kubectl-image

#

FROM node:15-alpine

COPY --from=kubectl-image /usr/local/bin/kubectl /usr/local/bin/kubectl
COPY --from=kubectl-image /usr/local/bin/kustomize /usr/local/bin/kustomize

ARG KOSKO_VERSION
ENV KOSKO_VERSION=${KOSKO_VERSION}

RUN set -ex \
  #
  && apk add --no-cache yq=~4 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community \
  #
  && apk add --update --no-cache \
    bash=~5 \
    coreutils=~8 \
    gettext=~0 \
    jq=~1 \
  #
  && yarn global add kosko@${KOSKO_VERSION} \
  #
  && kosko --version \
  ;

# renovate: datasource=github-releases depName=k14s/kapp
ARG KAPP_VERSION=v0.36.0
RUN set -ex \
  #
  && wget -O /usr/local/bin/kapp \
    "https://github.com/k14s/kapp/releases/download/${KAPP_VERSION}/kapp-linux-amd64" \
  && chmod +x /usr/local/bin/kapp \
  #
  && kapp --version \
  ;
