FROM curlimages/curl:8.8.0@sha256:73e4d532ea62d7505c5865b517d3704966ffe916609bedc22af6833dc9969bcd

COPY ./bin /bin

ENV URL $URL
ENV RETRIES $RETRIES

ENTRYPOINT ["sh", "/bin/wait-for-http"]
