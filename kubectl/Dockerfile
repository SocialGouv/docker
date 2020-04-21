FROM alpine:3.11

# renovate: datasource=github-releases depName=kubernetes/kubernetes
ARG KUBECTL_VERSION=1.18.0

# renovate: datasource=github-releases depName=kubernetes-sigs/kustomize
ARG KUSTOMIZE_VERSION=3.5.2

RUN set -ex \
  #
  && apk add --update --no-cache \
    bash=~5 \
    coreutils=~8 \
    gettext=~0 \
  #
  && wget -O /dev/shm/kubectl \
    "https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl" \
  && chmod +x /dev/shm/kubectl \
  && mv /dev/shm/kubectl /usr/local/bin/kubectl \
  #
  && wget -O /dev/shm/kustomize.tar \
    "https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz" \
  && tar xvzf /dev/shm/kustomize.tar  \
  && mv /kustomize /usr/local/bin/kustomize \
  ;

USER 1001
ENTRYPOINT [ "kubectl" ]
CMD [ "--help" ]
