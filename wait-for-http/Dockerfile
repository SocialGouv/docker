FROM curlimages/curl:7.73.0

COPY wait.sh .

ENV URL $URL
ENV RETRIES $RETRIES

ENTRYPOINT ["./wait.sh"]
