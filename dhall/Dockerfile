FROM alpine:3.15

# renovate: datasource=github-releases depName=dhall-lang/dhall-haskell
ARG DHALL_VERSION=1.40.2

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

RUN set -ex \
  #
  && wget -q -O /dev/shm/dhall-release.json \
  "https://api.github.com/repos/dhall-lang/dhall-haskell/releases/tags/${DHALL_VERSION}" \
  #
  && DHALL_CORE_URL=$( \
  grep "browser_download_url.*dhall-[0-9.].*linux.tar.bz2\"" /dev/shm/dhall-release.json | \
  cut -d '"' -f 4 \
  )\
  && wget -q -O /dev/shm/dhall-core.tar.bz2 "${DHALL_CORE_URL}" \
  && tar --extract --bzip2 --file /dev/shm/dhall-core.tar.bz2 --directory=/usr/local \
  #
  && DHALL_JSON_URL=$( \
  grep "browser_download_url.*dhall-json-[0-9.].*linux.tar.bz2\"" /dev/shm/dhall-release.json | \
  cut -d '"' -f 4 \
  )\
  && wget -q -O /dev/shm/dhall-json.tar.bz2 "${DHALL_JSON_URL}" \
  && tar --extract --bzip2 --file /dev/shm/dhall-json.tar.bz2 --directory=/usr/local \
  #
  && DHALL_YAML_URL=$( \
  grep "browser_download_url.*dhall-yaml-[0-9.].*linux.tar.bz2\"" /dev/shm/dhall-release.json | \
  cut -d '"' -f 4 \
  )\
  && wget -q -O /dev/shm/dhall-yaml.tar.bz2 "${DHALL_YAML_URL}" \
  && tar --extract --bzip2 --file /dev/shm/dhall-yaml.tar.bz2 --directory=/usr/local \
  #
  ;

# No-root
RUN adduser --home /home/socialgouv --disabled-password --gecos User socialgouv
USER socialgouv
WORKDIR /home/socialgouv

# Set dhall cache
ENV XDG_CACHE_HOME=/home/socialgouv/.cache
