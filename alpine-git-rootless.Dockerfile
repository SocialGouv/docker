FROM alpine/git:v2.36.3

RUN adduser -D script

WORKDIR /home/script
USER 1000