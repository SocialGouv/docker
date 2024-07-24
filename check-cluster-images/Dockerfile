FROM alpine/k8s:1.30.3@sha256:e6532cc8ff28ea2881e4010a321f4301ae3e62423b1f26e420b2ede07b9ac994

WORKDIR /app

# hadolint ignore=DL3018
RUN apk update && apk add skopeo && rm -rf /var/cache/apk/*

COPY script.sh .

RUN adduser -D app --u 1000

USER 1000

ENTRYPOINT ["/app/script.sh"]
