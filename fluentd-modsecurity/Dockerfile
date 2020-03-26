FROM alpine/git:v2.24.1 as builder

WORKDIR /
RUN git clone https://github.com/bitsofinfo/fluentd-modsecurity.git

FROM fluent/fluentd:v1.9.3-debian-1.0

# Use root account to use apt
USER root

COPY --from=builder /fluentd-modsecurity /plugins/fluentd-modsecurity

ENV BUILD_DEP="make gcc g++ libc-dev"
# below RUN includes plugin as examples elasticsearch is not required
# you may customize including plugins as you wish
RUN buildDeps=$BUILD_DEP \
 && apt-get update \
 && apt-get install -y --no-install-recommends make=4.2.1-1.2 gcc=4:8.3.0-1 g++=4:8.3.0-1 \
 && gem install fluent-plugin-elasticsearch:4.0.7 \
 && gem install fluent-plugin-modsecurity:0.1.4 \
 && gem sources --clear-all \
 && SUDO_FORCE_REMOVE=yes \
    apt-get purge -y --auto-remove \
                  -o APT::AutoRemove::RecommendsImportant=false \
                  $buildDeps \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

WORKDIR /plugins/fluentd-modsecurity
RUN gem build fluent-plugin-modsecurity.gemspec && \
    fluent-gem install ./fluent-plugin-modsecurity-0.2.gem

COPY config/fluent.conf /fluentd/etc/fluent.conf

USER fluent
ENTRYPOINT ["tini",  "--", "/bin/entrypoint.sh"]
CMD ["fluentd"]
