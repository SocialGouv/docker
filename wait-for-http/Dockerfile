FROM curlimages/curl:8.6.0@sha256:c3b8bee303c6c6beed656cfc921218c529d65aa61114eb9e27c62047a1271b9b

COPY ./bin /bin

ENV URL $URL
ENV RETRIES $RETRIES

ENTRYPOINT ["sh", "/bin/wait-for-http"]
