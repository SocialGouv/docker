FROM bats/bats:1.2.1

RUN set -x \
    #
    # Install
    # - coreutils: For GNU mktemp since busybox mktemp doesn't support --tmpdir.
    && apk add --update --no-cache coreutils=~8.32-r2 \
    #
    # Install git to install extra
    #
    && apk add --update --no-cache --virtual .bats-deps git=~2.30.2-r0 \
    #
    # Install extra bats dependencies
    #
    && git clone -b 'v0.3.0' --single-branch --depth 1 \
      https://github.com/ztombol/bats-assert /usr/lib/bats-assert \
    && git clone -b 'v0.2.0' --single-branch --depth 1 \
      https://github.com/ztombol/bats-file /usr/lib/bats-file \
    && git clone -b 'v0.3.0' --single-branch --depth 1 \
      https://github.com/ztombol/bats-support /usr/lib/bats-support \
    #
    # Clean
    #
    && apk del .bats-deps \
    ;
