FROM python:3.8.2-alpine3.10

## Install git and libpq
RUN apk add --update --no-cache \
  libpq=~11 \
  git=~2

## Install python environment
RUN apk add --update --no-cache --virtual .build-deps gcc=~~8 python-dev=~~2 musl-dev=~~1 postgresql-dev=~~11
RUN pip install psycopg2==2.8.4

## Copy postgres cleaner script
COPY ./bin /bin
