
FROM registry.gitlab.factory.social.gouv.fr/socialgouv/docker/kubectl:0.16.0 AS kubectl-image
FROM alpine/helm:2.14.3

## Install envsubst & coreutils
RUN apk add --update --no-cache \
  bash=5.0.11-r1 \
  coreutils=8.31-r0 \
  curl=7.67.0-r0 \
  gettext-dev=0.20.1-r1 \
  git=2.24.0-r0 \
  sudo=1.8.29-r0

ENV HOME=/config

COPY --from=kubectl-image /usr/local/bin/kubectl /usr/local/bin/kubectl

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN set -x && \
    adduser kubectl -Du 2342 -h /config && \
    chgrp -R kubectl /usr/local; \
    find /usr/local -type d -exec chmod g+w {} \; && \
    echo "kubectl ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/kubectl; \
    chmod 0440 /etc/sudoers.d/kubectl; \
    # Create non-root user (with a randomly chosen UID/GUI).
    \
    # Basic check it works.
    kubectl version --client

USER kubectl

ENTRYPOINT ["/usr/local/bin/kubectl"]
