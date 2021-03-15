FROM registry.gitlab.factory.social.gouv.fr/socialgouv/docker/kosko:4.9.0

RUN apk add --update --no-cache git=~2

# renovate: datasource=github-tags depName=socialgouv/k8s
ARG K8S_VERSION=v1.3.2
RUN git clone --depth 1 --branch ${K8S_VERSION} https://github.com/SocialGouv/k8s /k8s

WORKDIR /k8s/.k8s

RUN yarn install --frozen-lockfile --production --cache-folder /dev/shm/yarn
