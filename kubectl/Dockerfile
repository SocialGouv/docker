FROM bitnami/kubectl:1.18.2 as kubectl-image
FROM alpine:3.11

RUN set -ex \
  \
  && apk add --update --no-cache \
    bash=~5 \
    coreutils=~8 \
    gettext=~0 \
  ;
COPY --from=kubectl-image /opt/bitnami/kubectl/bin/kubectl /usr/local/bin/

USER 1001
ENTRYPOINT [ "kubectl" ]
CMD [ "--help" ]
