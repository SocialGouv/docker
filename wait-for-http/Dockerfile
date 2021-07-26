FROM curlimages/curl:7.78.0

COPY ./bin /bin

ENV URL $URL
ENV RETRIES $RETRIES

ENTRYPOINT ["sh", "/bin/wait-for-http"]
