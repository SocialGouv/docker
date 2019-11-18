FROM registry.gitlab.factory.social.gouv.fr/socialgouv/docker/helm:0.12.0

USER root

RUN apk add --update --no-cache git=2.24.0-r0 less=551-r0 openssh=8.1_p1-r0

USER kubectl

COPY ./bin /bin

ENTRYPOINT ["/bin/k8s-ns-killer"]
