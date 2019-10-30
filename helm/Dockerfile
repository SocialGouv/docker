
FROM registry.gitlab.factory.social.gouv.fr/socialgouv/docker/kubectl:0.10.0 AS kubectl-image
FROM alpine/helm:2.14.3

## Install envsubst & coreutils
RUN apk update && apk add --no-cache gettext-dev sudo coreutils

ENV HOME=/config

COPY --from=kubectl-image /usr/local/bin/kubectl /usr/local/bin/kubectl

RUN set -x && \
    adduser kubectl -Du 2342 -h /config && \
    chgrp -R kubectl /usr/local; \
    find /usr/local -type d | xargs chmod g+w; \
    echo "kubectl ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/kubectl; \
    chmod 0440 /etc/sudoers.d/kubectl; \
    # Create non-root user (with a randomly chosen UID/GUI).
    \
    # Basic check it works.
    kubectl version --client

USER kubectl

ENTRYPOINT ["/usr/local/bin/kubectl"]
