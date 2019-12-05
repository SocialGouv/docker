FROM registry.gitlab.factory.social.gouv.fr/socialgouv/docker/helm:0.16.0

USER root

RUN apk add --update --no-cache \
  git=~2 \
  less=~551 \
  openssh=~8

USER kubectl

COPY ./bin /bin

ENTRYPOINT ["/bin/k8s-ns-killer"]
