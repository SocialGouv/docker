FROM curlimages/curl:7.73.0

COPY entrypoint.sh .

ENV URL $URL
ENV RETRIES $RETRIES

ENTRYPOINT ["./entrypoint.sh"]
