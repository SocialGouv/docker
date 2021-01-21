FROM gcr.io/kaniko-project/executor:v1.3.0 as kaniko-image

FROM alpine:3.13

RUN set -ex \
  #
  && apk add --update --no-cache \
    bash=~5 \
  #
  ;

COPY --from=kaniko-image /bin/executor /bin/executor
COPY --from=kaniko-image /bin/kaniko /bin/kaniko
COPY ./config.json /kaniko/.docker/config.json

