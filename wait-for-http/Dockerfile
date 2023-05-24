FROM curlimages/curl:7.86.0@sha256:cfdeba7f88bb85f6c87f2ec9135115b523a1c24943976a61fbf59c4f2eafd78e

COPY ./bin /bin

ENV URL $URL
ENV RETRIES $RETRIES

ENTRYPOINT ["sh", "/bin/wait-for-http"]
