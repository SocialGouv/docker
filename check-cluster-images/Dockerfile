FROM alpine/k8s:1.32.1@sha256:1892fdf41c09ec2b08a334daf352b3a24e79c1138690d035c804f21c8ec7aac6

WORKDIR /app

# hadolint ignore=DL3018
RUN apk update && apk add skopeo && rm -rf /var/cache/apk/*

COPY script.sh .

RUN adduser -D app --u 1000

USER 1000

ENTRYPOINT ["/app/script.sh"]
