FROM alpine/k8s:1.31.3@sha256:7f485a380b3b890b8f4d0de63e242b79db728ef1e0fc5ae30d30cbe5f9e2d242

WORKDIR /app

# hadolint ignore=DL3018
RUN apk update && apk add skopeo && rm -rf /var/cache/apk/*

COPY script.sh .

RUN adduser -D app --u 1000

USER 1000

ENTRYPOINT ["/app/script.sh"]
