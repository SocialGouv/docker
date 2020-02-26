
FROM registry.gitlab.factory.social.gouv.fr/socialgouv/docker/kubectl:0.23.0 AS kubectl-image
FROM alpine/helm:2.14.3

## Install envsubst & coreutils
RUN apk add --update --no-cache \
  bash=~5 \
  coreutils=~8 \
  curl=~7 \
  gettext-dev=~0 \
  git=~2 \
  sudo=~1

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
