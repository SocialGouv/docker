FROM fluent/fluentd:v1.10.2-debian-1.0

USER root

RUN set -ex && \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    make=4.2.1-1.2 \
    gcc=4:8.3.0-1 \
    g++=4:8.3.0-1 && \
  gem install \
    fluent-plugin-elasticsearch:4.0.7 \
    fluent-plugin-out-kaboom:0.1.1 && \
  gem sources --clear-all && \
  apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
    make \
    gcc \
    g++ \
    libc-dev && \
  rm -rf \
    /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/* \
    /usr/lib/ruby/gems/*/cache/*.gem

USER fluent

ENTRYPOINT ["tini",  "--", "/bin/entrypoint.sh"]
CMD ["fluentd"]
