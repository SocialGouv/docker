FROM postgres:11.11-alpine

COPY ./bin /bin

ENTRYPOINT ["/bin/wait-for-postgres"]
