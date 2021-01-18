#

FROM registry.gitlab.factory.social.gouv.fr/socialgouv/docker/kubectl:2.9.0 AS kubectl-image

#

FROM node:15-alpine

COPY --from=kubectl-image /usr/local/bin/kubectl /usr/local/bin/kubectl
COPY --from=kubectl-image /usr/local/bin/kustomize /usr/local/bin/kustomize

RUN set -ex \
  #
  && apk add --update --no-cache \
    bash=~5 \
    coreutils=~8 \
    gettext=~0 \
  #
  && yarn global add kosko@0.9.1 \
  #
  && kosko --version \
  ;

# renovate: datasource=github-releases depName=k14s/kapp
ARG KAPP_VERSION=v0.35.0
RUN set -ex \
  #
  && wget -O /usr/local/bin/kapp \
    "https://github.com/k14s/kapp/releases/download/${KAPP_VERSION}/kapp-linux-amd64" \
  && chmod +x /usr/local/bin/kapp \
  #
  && kapp --version \
  ;
