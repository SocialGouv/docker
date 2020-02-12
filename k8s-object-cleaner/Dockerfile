FROM registry.gitlab.factory.social.gouv.fr/socialgouv/docker/helm:0.22.0

USER root

RUN apk add --update --no-cache \
  git=~2 \
  less=~551 \
  openssh=~8 \
  nodejs=~12

USER kubectl

COPY ./bin /bin

ENTRYPOINT ["k8s-object-cleaner"]
