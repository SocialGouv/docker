FROM alpine:3.12

# renovate: datasource=github-releases depName=aquasecurity/trivy
ARG TRIVY_VERSION=v0.10.2

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

RUN set -ex \
  #
  && apk add --update --no-cache \
    ca-certificates=~20191127 \
    git=~2 \
    rpm=~4 \
  #
  && wget -qO - \
    "https://github.com/aquasecurity/trivy/releases/download/${TRIVY_VERSION}/trivy_${TRIVY_VERSION#v}_Linux-64bit.tar.gz" \
    | tar -C "/dev/shm" -xzv \
  && mv /dev/shm/trivy /usr/local/bin/trivy \
  && mv /dev/shm/contrib /tmp/contrib \
  #
  && trivy --version \
  && ls /tmp/contrib \
  ;

ENTRYPOINT ["trivy"]
