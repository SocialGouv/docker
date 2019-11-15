FROM alpine:3.10

## Install envsubst & coreutils
RUN apk add --update --no-cache \
  bash=5.0.0-r0 \
  coreutils=8.31-r0 \
  curl=7.66.0-r0 \
  gettext-dev=0.19.8.1-r4  \
  sudo=1.8.27-r0 \
  ca-certificates=20190108-r0


ENV K8S_LATEST_VERSION="v1.16.2"
## Install kubectl
## Note: Latest version may be found on:
## https://aur.archlinux.org/packages/kubectl-bin/
ADD https://storage.googleapis.com/kubernetes-release/release/${K8S_LATEST_VERSION}/bin/linux/amd64/kubectl /usr/local/bin/kubectl

ENV HOME=/config

RUN set -x && \
    chmod +x /usr/local/bin/kubectl && \
    \
    # Create non-root user (with a randomly chosen UID/GUI).
    adduser kubectl -Du 2342 -h /config && \
    \
    # Basic check it works.
    kubectl version --client

USER kubectl

ENTRYPOINT ["/usr/local/bin/kubectl"]
