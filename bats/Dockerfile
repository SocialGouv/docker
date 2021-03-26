FROM bats/bats:1.2.1

RUN set -x \
  #
  # Install
  # - coreutils: For GNU mktemp since busybox mktemp doesn't support --tmpdir.
  && apk add --update --no-cache coreutils=~8 \
  #
  # Install git to install extra
  #
  && apk add --update --no-cache --virtual .bats-deps git=~2 \
  #
  # Install extra bats dependencies
  #
  && git clone -b 'v2.0.0' --single-branch --depth 1 \
  https://github.com/bats-core/bats-assert /usr/lib/bats-assert \
  && git clone -b 'v0.3.0' --single-branch --depth 1 \
  https://github.com/bats-core/bats-filee /usr/lib/bats-file \
  && git clone -b 'v0.3.0' --single-branch --depth 1 \
  https://github.com/bats-core/bats-support /usr/lib/bats-support \
  #
  # Clean
  #
  && apk del .bats-deps \
  ;
