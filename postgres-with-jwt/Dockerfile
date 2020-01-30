FROM postgres:12.1-alpine

# Install "pgjwt" extension:
# https://github.com/michelp/pgjwt#install
RUN apk update > /dev/nul
RUN apk add g++ git make > /dev/nul
WORKDIR /tmp
RUN git clone https://github.com/michelp/pgjwt.git > /dev/nul
WORKDIR /tmp/pgjwt
RUN make install > /dev/nul

WORKDIR /
