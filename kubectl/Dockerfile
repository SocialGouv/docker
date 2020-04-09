FROM bitnami/kubectl:1.17.4 as kubectl-image
FROM alpine:3.11

COPY --from=kubectl-image /opt/bitnami/kubectl/bin/kubectl /usr/local/bin/

USER 1001
ENTRYPOINT [ "kubectl" ]
CMD [ "--help" ]
