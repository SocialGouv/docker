FROM curlimages/curl:7.76.1

COPY ./bin /bin

ENV URL $URL
ENV RETRIES $RETRIES

ENTRYPOINT ["/bin/wait-for-http"]
