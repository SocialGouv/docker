FROM alpine/k8s:1.25.9

WORKDIR /app

RUN apk update && apk add skopeo

ADD script.sh .

ENTRYPOINT ["/app/script.sh"]