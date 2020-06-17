FROM registry.gitlab.factory.social.gouv.fr/socialgouv/docker/kubectl:1.33.0

USER root

RUN set -ex \
  #
  && apk add --update --no-cache \
    git=~2 \
    less=~551 \
    openssh=~8 \
    nodejs=~12 \
  ;

USER 1001

COPY ./bin /bin

ENTRYPOINT ["k8s-object-cleaner"]
