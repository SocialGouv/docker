FROM alpine/git:v2.40.1@sha256:1134fdfca49677f3c33445ede74cd64b55f524ad3cb215fa464492ad281eafc0

RUN adduser -D script

RUN apk add curl=8.4.0-r0

WORKDIR /home/script
USER 1000