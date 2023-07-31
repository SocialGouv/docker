FROM alpine/k8s:1.25.9@sha256:1e4b6d52e4b60eabe0692be5ec851aad3952a8244129ef7618e5e688834003d0

WORKDIR /app

# hadolint ignore=DL3018
RUN apk update && apk add skopeo && rm -rf /var/cache/apk/*

COPY script.sh .

RUN adduser -D app --u 1000

USER 1000

ENTRYPOINT ["/app/script.sh"]
