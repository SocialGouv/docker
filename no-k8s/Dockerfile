FROM ghcr.io/socialgouv/docker/kosko:6.20

RUN apk add --update --no-cache \
  # renovate: datasource=repology depName=alpine_3_13/git versioning=loose
  git=="2.30.2-r0"

# renovate: datasource=github-tags depName=socialgouv/k8s
ARG K8S_VERSION=v1.8.0
RUN git clone --depth 1 --branch ${K8S_VERSION} https://github.com/SocialGouv/k8s /k8s

WORKDIR /k8s/.k8s

RUN yarn install --frozen-lockfile --production \
  && yarn cache clean
