FROM gcr.io/kaniko-project/executor:v1.3.0 as kaniko-image

FROM alpine:3.13

RUN set -ex \
  #
  && apk add --update --no-cache \
    bash=~5 \
  #
  ;
COPY --from=kaniko-image /kaniko/executor /bin/kaniko
COPY --from=kaniko-image /kaniko/executor /bin/executor
COPY ./config.json /kaniko/.docker/config.json

