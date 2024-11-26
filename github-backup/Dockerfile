FROM bitnami/python:3.10

# hadolint ignore=DL3008
RUN apt-get update && apt-get install -y --no-install-recommends git openssh-client && rm -rf /var/lib/apt/lists/*
RUN groupadd -g 1000 user && useradd -u 1000 -r -g user -m -d /home/user user

USER 1000
RUN ls

# hadolint ignore=DL3013
RUN pip install --no-cache-dir github-backup
