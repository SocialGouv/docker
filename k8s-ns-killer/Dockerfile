FROM registry.gitlab.factory.social.gouv.fr/socialgouv/docker/helm:0.7.0

USER root

RUN apk add --update --no-cache git less openssh

USER kubectl

COPY ./bin /bin

ENTRYPOINT ["/bin/k8s-ns-killer"]
