FROM registry.gitlab.factory.social.gouv.fr/socialgouv/docker/kosko:4.4.0

RUN apk add --update --no-cache git=~2

# renovate: datasource=github-tags depName=socialgouv/k8s versioning=semver
RUN git clone --depth 1 --branch v1.0.0 https://github.com/SocialGouv/k8s /k8s

WORKDIR /k8s/.k8s

RUN yarn install --frozen-lockfile --production --cache-folder /dev/shm/yarn
