FROM curlimages/curl:7.77.0

COPY ./bin /bin

ENV URL $URL
ENV RETRIES $RETRIES

ENTRYPOINT ["sh", "/bin/wait-for-http"]
