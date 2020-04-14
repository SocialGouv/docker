FROM bitnami/kubectl:1.18.1 as kubectl-image
FROM alpine:3.11

RUN set -ex \
  \
  && apk add --update --no-cache \
    bash=~5 \
  ;
COPY --from=kubectl-image /opt/bitnami/kubectl/bin/kubectl /usr/local/bin/

USER 1001
ENTRYPOINT [ "kubectl" ]
CMD [ "--help" ]
