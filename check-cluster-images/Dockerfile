FROM alpine/k8s:1.28.2@sha256:fc059f056ad003e28d19ff901b8e4dd5d8309064380dc31b61f309fc19d37c31

WORKDIR /app

# hadolint ignore=DL3018
RUN apk update && apk add skopeo && rm -rf /var/cache/apk/*

COPY script.sh .

RUN adduser -D app --u 1000

USER 1000

ENTRYPOINT ["/app/script.sh"]
