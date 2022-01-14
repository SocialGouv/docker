ARG UBUNTU_VERSION=latest
ARG GOMPLATE_VERSION=v3.6.0-slim

FROM hairyhenderson/gomplate:$GOMPLATE_VERSION as gomplate
FROM ubuntu:$UBUNTU_VERSION

ARG NODE_VERSION=16
ARG KUBECTL_VERSION=1.20.1
ARG KUSTOMIZE_VERSION=3.5.2
ARG HELM_VERSION=3.4.2

# install gomplate
COPY --from=gomplate /gomplate /usr/local/bin/gomplate

# install dependencies
RUN apt-get update -yq && \
  apt-get -y install \
    curl \
    wget \
    gnupg \
    bash \
    jq \
    sed \
    grep \
    git \
    unzip \
    postgresql-client

# install kubectl
RUN wget -q -O /dev/shm/kubectl \
    "https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl" \
  && chmod +x /dev/shm/kubectl \
  && mv /dev/shm/kubectl /usr/local/bin/kubectl

# install kustomize
RUN wget -q -O /dev/shm/kustomize.tar \
    "https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz" \
  && tar xvzf /dev/shm/kustomize.tar  \
  && mv /kustomize /usr/local/bin/kustomize

# install helm
RUN wget -q -O /dev/shm/helm.tar.gz \
    "https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz" \
  && tar xvzf /dev/shm/helm.tar.gz  \
  && mv /linux-amd64/helm /usr/local/bin/helm

# install nodejs
RUN apt-get update -yq && \
  curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x  | bash - && \
  apt-get -y install nodejs

# install deno
RUN curl -fsSL https://deno.land/x/install/install.sh | sh

USER 1000
ENTRYPOINT [ "/bin/sh", "-c" ]
CMD []
