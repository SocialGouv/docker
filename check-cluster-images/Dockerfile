FROM alpine/k8s:1.34.1@sha256:ec714df3813b5405292860f8a1c55c5727bf8c33c88992f1e981efad8065547f

WORKDIR /app

# hadolint ignore=DL3018
RUN apk update && apk add skopeo && rm -rf /var/cache/apk/*

COPY script.sh .

RUN adduser -D app --u 1000

USER 1000

ENTRYPOINT ["/app/script.sh"]
