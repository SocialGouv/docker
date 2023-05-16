FROM curlimages/curl:7.86.0@sha256:651d7d471b8d8a36d7872eb4f5132efe84775ca26cafcde3c1a3ad60e7a74dbc

COPY ./bin /bin

ENV URL $URL
ENV RETRIES $RETRIES

ENTRYPOINT ["sh", "/bin/wait-for-http"]
