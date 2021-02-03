FROM registry.gitlab.factory.social.gouv.fr/socialgouv/docker/kosko:4.2.0

RUN apk add --update --no-cache git=~2

COPY .k8s /.k8s

RUN cd .k8s; yarn install --frozen-lockfile; cd -
