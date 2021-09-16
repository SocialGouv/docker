FROM alpine:3.14

# renovate: datasource=github-releases depName=kubernetes/kubernetes
ARG KUBECTL_VERSION=v1.22.1

# renovate: datasource=github-releases depName=kubernetes-sigs/kustomize versioning=loose
ARG KUSTOMIZE_VERSION=kustomize/v3.5.2

RUN set -ex \
  #
  && apk add --update --no-cache \
  # renovate: datasource=repology depName=alpine_3_14/bash versioning=loose
  bash=="5.1.4-r0" \
  # renovate: datasource=repology depName=alpine_3_14/coreutils versioning=loose
  coreutils=="8.32-r2" \
  # renovate: datasource=repology depName=alpine_3_14/gettext versioning=loose
  gettext=="0.21-r0" \
  # renovate: datasource=repology depName=alpine_3_14/jq versioning=loose
  jq=="1.6-r1" \
  # renovate: datasource=repology depName=alpine_3_14/git versioning=loose
  git=="2.32.0-r0" \
  # renovate: datasource=repology depName=alpine_3_14/nodejs versioning=loose
  nodejs=="14.17.6-r0" \
  # renovate: datasource=repology depName=alpine_3_14/yarn versioning=loose
  yarn=="1.22.10-r0" \
  #
  && wget -q -O /dev/shm/kubectl \
  "https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl" \
  && chmod +x /dev/shm/kubectl \
  && mv /dev/shm/kubectl /usr/local/bin/kubectl \
  #
  && wget -q -O /dev/shm/kustomize.tar \
  "https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2F${KUSTOMIZE_VERSION#kustomize/}/kustomize_${KUSTOMIZE_VERSION#kustomize/}_linux_amd64.tar.gz" \
  && tar xvzf /dev/shm/kustomize.tar  \
  && mv /kustomize /usr/local/bin/kustomize \
  ;

RUN set -ex \
  #
  && apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community \
  # renovate: datasource=repology depName=alpine_edge/yq versioning=loose
  yq=="4.13.0-r0";

# renovate: datasource=github-releases depName=k14s/kapp
ARG KAPP_VERSION=v0.39.0
RUN set -ex \
  #
  && wget -q -O /usr/local/bin/kapp \
  "https://github.com/k14s/kapp/releases/download/${KAPP_VERSION}/kapp-linux-amd64" \
  && chmod +x /usr/local/bin/kapp \
  ;


USER 1001
ENTRYPOINT [ "kubectl" ]
CMD [ "--help" ]
