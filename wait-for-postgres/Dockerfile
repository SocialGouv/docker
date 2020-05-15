FROM postgres:12.3-alpine

COPY ./bin /bin

ENTRYPOINT ["/bin/wait-for-postgres"]
