FROM postgres:10.16-alpine

COPY ./bin /bin

ENTRYPOINT ["/bin/wait-for-postgres"]
