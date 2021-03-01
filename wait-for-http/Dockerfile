FROM curlimages/curl:7.75.0

COPY ./bin /bin

ENV URL $URL
ENV RETRIES $RETRIES

ENTRYPOINT ["/bin/wait-for-http"]
