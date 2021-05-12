FROM ghcr.io/socialgouv/docker/kosko:6.7

RUN apk add --update --no-cache \
  # renovate: datasource=repology depName=alpine_3_13/git versioning=loose
  git=="2.24.4-r0"

# renovate: datasource=github-tags depName=socialgouv/k8s
ARG K8S_VERSION=v1.3.2
RUN git clone --depth 1 --branch ${K8S_VERSION} https://github.com/SocialGouv/k8s /k8s

WORKDIR /k8s/.k8s

RUN --mount=type=cache,target=/k8s/.k8s/node_modules \
  yarn install --frozen-lockfile --production \
  && yarn cache clean
