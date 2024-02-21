FROM alpine/k8s:1.29.2@sha256:a51aa37f0a34ff827c7f2f9cb7f6fbb8f0e290fa625341be14c2fcc4b1880f60

WORKDIR /app

# hadolint ignore=DL3018
RUN apk update && apk add skopeo && rm -rf /var/cache/apk/*

COPY script.sh .

RUN adduser -D app --u 1000

USER 1000

ENTRYPOINT ["/app/script.sh"]
