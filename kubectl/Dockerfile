FROM alpine:3.11

ENV K8S_LATEST_VERSION="v1.17.4"
ENV HOME=/home/kubectl

## Install envsubst & coreutils
RUN set -ex \
  \
  && apk add --update --no-cache \
    bash=~5 \
  \
  && apk add --update --no-cache --virtual .curl-deps \
    coreutils=~8 \
    curl=~7 \
    gettext-dev=~0 \
    ca-certificates=~20191127 \
  ## Install kubectl
  ## Note: Latest version may be found on:
  ## https://aur.archlinux.org/packages/kubectl-bin/
  \
  && curl -sL -o /usr/local/bin/kubectl \
    https://storage.googleapis.com/kubernetes-release/release/${K8S_LATEST_VERSION}/bin/linux/amd64/kubectl \
  \
  && apk del .curl-deps \
  \
  && chmod +x /usr/local/bin/kubectl \
  \
  # Basic check it works.
  && kubectl version --client

ENTRYPOINT ["kubectl"]
