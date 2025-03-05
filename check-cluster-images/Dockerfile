FROM alpine/k8s:1.32.2@sha256:15cfdf84d6de3559bc54d7479eb4e8aadbf71f6d7f08782cb1e91f3446f4b2d8

WORKDIR /app

# hadolint ignore=DL3018
RUN apk update && apk add skopeo && rm -rf /var/cache/apk/*

COPY script.sh .

RUN adduser -D app --u 1000

USER 1000

ENTRYPOINT ["/app/script.sh"]
