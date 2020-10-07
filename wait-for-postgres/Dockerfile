FROM postgres:10.11-alpine

COPY ./bin /bin

ENTRYPOINT ["/bin/wait-for-postgres"]
