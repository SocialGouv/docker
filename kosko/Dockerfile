#

FROM registry.gitlab.factory.social.gouv.fr/socialgouv/docker/kubectl:1.34.2 AS kubectl-image

#

FROM node:14-alpine

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
