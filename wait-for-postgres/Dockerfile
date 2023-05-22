FROM postgres:11.11-alpine@sha256:7eb2962f883f1d984a8938c135cb432c47a33f5184b7d3f87bed8f67d53449df

COPY ./bin /bin

ENTRYPOINT ["/bin/wait-for-postgres"]
