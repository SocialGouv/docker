#
# CNPG operand image with pgvector extension
# build with : `docker build . -f Dockerfile.cnpg-pgvector -t cnpg-pgvector`
#

ARG PG_MAJOR=15
ARG PGVECTOR_TAG=v0.4.1

FROM ghcr.io/cloudnative-pg/postgresql:$PG_MAJOR as builder

USER root

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends git

RUN git clone --depth 1 --branch $PGVECTOR_TAG https://github.com/pgvector/pgvector.git /tmp/pgvector

RUN apt-get update && \
    apt-get install -y  --no-install-recommends build-essential postgresql-server-dev-$PG_MAJOR && \
    cd /tmp/pgvector && \
    make clean && \
    make OPTFLAGS="" && \
    make install && \
    mkdir /usr/share/doc/pgvector && \
    cp LICENSE README.md /usr/share/doc/pgvector && \
    rm -r /tmp/pgvector && \
    apt-get remove -y build-essential postgresql-server-dev-$PG_MAJOR && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

FROM ghcr.io/cloudnative-pg/postgresql:$PG_MAJOR

COPY --from=builder --chown=postgres:postgres /usr/lib/postgresql/15/lib/vector* /usr/lib/postgresql/15/lib/
COPY --from=builder --chown=postgres:postgres /usr/share/postgresql/15/extension/vector* /usr/share/postgresql/15/extension/
COPY --from=builder --chown=postgres:postgres /usr/share/doc/pgvector /usr/share/doc/

USER postgres