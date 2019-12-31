FROM alpine:3.11

## Install envsubst & coreutils
RUN apk add --update --no-cache \
  bash=~5 \
  coreutils=~8 \
  curl=~7 \
  gettext-dev=~0 \
  sudo=~1 \
  ca-certificates=~20191127


ENV K8S_LATEST_VERSION="v1.17.0"

## Install kubectl
## Note: Latest version may be found on:
## https://aur.archlinux.org/packages/kubectl-bin/
RUN set -x && \
    curl -sL https://storage.googleapis.com/kubernetes-release/release/${K8S_LATEST_VERSION}/bin/linux/amd64/kubectl \
      -o /usr/local/bin/kubectl

ENV HOME=/home/kubectl

RUN set -x && \
    chmod +x /usr/local/bin/kubectl && \
    \
    # Create non-root user (with a randomly chosen UID/GUI).
    adduser kubectl -Du 2342 -h /home/kubectl && \
    \
    # Basic check it works.
    kubectl version --client

USER kubectl

ENTRYPOINT ["kubectl"]
