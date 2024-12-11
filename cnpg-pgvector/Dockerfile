# CNPG operand image with pgvector extension
ARG PG_MAJOR=15@sha256:61cca1ee5bdf949e43694af6de922215a2cad63977e7bb9bbc1e2a09de2be823

FROM ghcr.io/cloudnative-pg/postgresql:$PG_MAJOR as builder

ARG PGVECTOR_TAG=v0.4.1

USER root

WORKDIR /tmp/pgvector

# hadolint ignore=DL3008,DL3003
RUN apt-get update && apt-get install -y --no-install-recommends git

RUN git clone --depth 1 --branch "$PGVECTOR_TAG" https://github.com/pgvector/pgvector.git .

# hadolint ignore=DL3008,DL3003
RUN apt-get update && \
    apt-get install -y  --no-install-recommends build-essential postgresql-server-dev-$PG_MAJOR && \
    make clean && \
    make OPTFLAGS="" && \
    make install && \
    mkdir /usr/share/doc/pgvector && \
    cp LICENSE README.md /usr/share/doc/pgvector && \
    apt-get remove -y build-essential postgresql-server-dev-$PG_MAJOR && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* && \
    cd /tmp && rm -r /tmp/pgvector

USER postgres

FROM ghcr.io/cloudnative-pg/postgresql:$PG_MAJOR

COPY --from=builder --chown=postgres:postgres /usr/lib/postgresql/15/lib/vector* /usr/lib/postgresql/15/lib/
COPY --from=builder --chown=postgres:postgres /usr/share/postgresql/15/extension/vector* /usr/share/postgresql/15/extension/
COPY --from=builder --chown=postgres:postgres /usr/share/doc/pgvector /usr/share/doc/

USER postgres
