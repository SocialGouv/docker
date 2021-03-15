FROM registry.gitlab.factory.social.gouv.fr/socialgouv/docker/kubectl:4.9.0

USER root

RUN set -ex \
  #
  && apk add --update --no-cache \
    git=~2 \
    less=~563 \
    openssh=~8 \
    nodejs=~14 \
  ;

USER 1001

COPY ./bin /bin

ENTRYPOINT ["k8s-object-cleaner"]
