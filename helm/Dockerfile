#

FROM registry.gitlab.factory.social.gouv.fr/socialgouv/docker/kubectl:1.3.0 AS kubectl-image
FROM registry.gitlab.factory.social.gouv.fr/socialgouv/docker/bats:1.3.0 AS bats-image

#

FROM alpine/helm:2.14.3

COPY --from=kubectl-image /usr/local/bin/kubectl /usr/local/bin/kubectl
COPY --from=bats-image /usr/lib/bats-assert /usr/lib/bats-assert
COPY --from=bats-image /usr/lib/bats-support /usr/lib/bats-support
COPY --from=bats-image /usr/lib/bats-file /usr/lib/bats-file

# ## Install envsubst & coreutils
RUN apk add --update --no-cache \
  bash=~5 \
  bats=~1 \
  coreutils=~8 \
  ;

RUN helm init --client-only
