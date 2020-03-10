FROM postgres:12.2-alpine

COPY ./bin /bin

ENTRYPOINT ["/bin/wait-for-postgres"]
