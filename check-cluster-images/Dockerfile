FROM alpine/k8s:1.25.9

WORKDIR /app

# hadolint ignore=DL3018
RUN apk update && apk add skopeo && rm -rf /var/cache/apk/*

COPY script.sh .

USER 405

ENTRYPOINT ["/app/script.sh"]
