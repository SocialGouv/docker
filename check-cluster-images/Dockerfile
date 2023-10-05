FROM alpine/k8s:1.28.2@sha256:d7b859ed3422c920e733e07c860867f208796a03b35960530ac8da63ffb2c262

WORKDIR /app

# hadolint ignore=DL3018
RUN apk update && apk add skopeo && rm -rf /var/cache/apk/*

COPY script.sh .

RUN adduser -D app --u 1000

USER 1000

ENTRYPOINT ["/app/script.sh"]
