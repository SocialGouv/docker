ARG NODE_VERSION=20.14-slim@sha256:a16301294ba66d2ad22d3beded4a52720f96ab208c1db0973c034d0127a4ccb0
FROM node:$NODE_VERSION

# hadolint ignore=DL3008
RUN apt-get update && \
  apt-get install -yq --no-install-recommends wget ca-certificates postgresql-common \
  && rm -rf /var/lib/apt/lists/*

RUN /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh -y

# hadolint ignore=DL3008,DL3059
RUN apt-get update \
  && apt-get install -yq --no-install-recommends postgresql-client-15 \
  && rm -rf /var/lib/apt/lists/*

# install greenmask cli
RUN wget https://github.com/GreenmaskIO/greenmask/releases/download/v0.1.14/greenmask-linux-amd64.tar.gz \
  && tar -xvf greenmask-linux-amd64.tar.gz \
  && mv greenmask /usr/local/bin/greenmask

USER 1000

