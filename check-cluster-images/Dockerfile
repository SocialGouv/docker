FROM alpine/k8s:1.25.9

WORKDIR /app

# hadolint ignore=DL3018
RUN apk update && apk add skopeo

COPY script.sh .

ENTRYPOINT ["/app/script.sh"]