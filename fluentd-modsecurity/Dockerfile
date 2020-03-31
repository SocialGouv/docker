FROM fluent/fluentd:v1.9.3-debian-1.0

USER root

RUN buildDeps="sudo make gcc g++ libc-dev" \
  && apt-get update \
  && apt-get install -y --no-install-recommends $buildDeps \
  && sudo gem install fluent-plugin-elasticsearch \
  && sudo gem install fluent-plugin-out-kaboom \
  && sudo gem sources --clear-all \
  && SUDO_FORCE_REMOVE=yes apt-get purge -y --auto-remove \
    -o APT::AutoRemove::RecommendsImportant=false \
    $buildDeps \
  && rm -rf /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/* \
    /usr/lib/ruby/gems/*/cache/*.gem

USER fluent

ENTRYPOINT ["tini",  "--", "/bin/entrypoint.sh"]
CMD ["fluentd"]
