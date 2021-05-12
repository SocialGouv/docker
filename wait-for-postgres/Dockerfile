FROM postgres:13.2-alpine

COPY ./bin /bin

ENTRYPOINT ["/bin/wait-for-postgres"]
