FROM registry.gitlab.factory.social.gouv.fr/socialgouv/docker/kubectl:2.9.0

USER root

RUN set -ex \
  #
  && apk add --update --no-cache \
    git=~2 \
    less=~551 \
    openssh=~8 \
  ;

USER 1001

COPY ./bin /bin

ENTRYPOINT ["/bin/k8s-ns-killer"]
