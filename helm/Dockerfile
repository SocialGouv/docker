#

FROM registry.gitlab.factory.social.gouv.fr/socialgouv/docker/kubectl:1.34.0 AS kubectl-image
FROM registry.gitlab.factory.social.gouv.fr/socialgouv/docker/bats:1.34.0 AS bats-image

#

FROM alpine/helm:2.14.3

ARG HELM_CHART_VERSION
ENV HELM_CHART_VERSION=${HELM_CHART_VERSION}

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]
RUN set -ex \
  #
  && apk add --update --no-cache \
    bash=~5 \
    bats=~1 \
    coreutils=~8 \
    gettext=~0 \
  #
  && helm init --client-only \
  && helm repo add socialgouv "https://github.com/SocialGouv/helm-charts/releases/download/v${HELM_CHART_VERSION}" \
  && wget -qO - \
    "https://github.com/SocialGouv/helm-charts/releases/download/v${HELM_CHART_VERSION}/helm-just-linux-${HELM_CHART_VERSION}.tgz" \
    | tar -C "$(helm home)" -xzv \
  ;

COPY --from=kubectl-image /usr/local/bin/kubectl /usr/local/bin/kubectl
COPY --from=kubectl-image /usr/local/bin/kustomize /usr/local/bin/kustomize
COPY --from=bats-image /usr/lib/bats-assert /usr/lib/bats-assert
COPY --from=bats-image /usr/lib/bats-support /usr/lib/bats-support
COPY --from=bats-image /usr/lib/bats-file /usr/lib/bats-file
