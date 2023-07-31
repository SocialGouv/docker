FROM bats/bats:v1.10.0@sha256:fe06862c559a1824073ba6c0fd481d082ac6388eb896222a7604ccdb81c38ac4

RUN set -x \
  #
  # Install
  # - coreutils: For GNU mktemp since busybox mktemp doesn't support --tmpdir.
  && apk add --update --no-cache \
  # renovate: datasource=repology depName=alpine_3_12/coreutils versioning=loose
  coreutils=="9.0-r2" \
  #
  # Install git to install extra
  && apk add --update --no-cache --virtual .bats-deps \
  # renovate: datasource=repology depName=alpine_3_12/git versioning=loose
  git=="2.34.8-r0" \
  #
  # Install extra bats dependencies
  && git clone -q -b 'v0.3.0' --single-branch --depth 1 \
  https://github.com/ztombol/bats-assert /usr/lib/bats-assert \
  && git clone -q -b 'v0.2.0' --single-branch --depth 1 \
  https://github.com/ztombol/bats-file /usr/lib/bats-file \
  && git clone -q -b 'v0.3.0' --single-branch --depth 1 \
  https://github.com/ztombol/bats-support /usr/lib/bats-support \
  #
  # Clean
  && apk del .bats-deps \
  ;
